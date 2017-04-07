package com.liangxunwang.unimanager.service.app;

import com.liangxunwang.unimanager.dao.AccessTokenDao;
import com.liangxunwang.unimanager.dao.DayValueObjDao;
import com.liangxunwang.unimanager.dao.RecordDao;
import com.liangxunwang.unimanager.dao.ShenheRecordDao;
import com.liangxunwang.unimanager.model.*;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.RecordQuery;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.*;
import com.qiniu.common.QiniuException;
import com.qiniu.storage.BucketManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.qiniu.util.UrlSafeBase64;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by zhl on 2015/3/3.
 */
@Service("appRecordService")
public class AppRecordService implements ListService ,SaveService, FindService{
    @Autowired
    @Qualifier("recordDao")
    private RecordDao recordDao;

    @Autowired
    @Qualifier("accessTokenDao")
    private AccessTokenDao accessTokenDao;

    @Autowired
    @Qualifier("dayValueObjDao")
    private DayValueObjDao dayValueObjDao;

    @Override
    public Object list(Object object) throws ServiceException {
        RecordQuery query = (RecordQuery) object;
        Map<String, Object> map = new HashMap<String, Object>();
        //判断accesstoken是否存在 是否是最新的
        if(!StringUtil.isNullOrEmpty(query.getAccessToken())){
            //不为空，判断是否单点登录
            AccessToken accessToken = accessTokenDao.findByToken(query.getAccessToken());
            if(accessToken == null){
                throw new ServiceException("accessTokenNull");
            }
        }
        int index = (query.getIndex() - 1) * query.getSize();
        int size = query.getSize();
        map.put("index", index);
        map.put("size", size);
        if (!StringUtil.isNullOrEmpty(query.getKeyword())) {
            map.put("keyword", query.getKeyword());
        }
        if (!StringUtil.isNullOrEmpty(query.getMm_msg_type())) {
            map.put("mm_msg_type", query.getMm_msg_type());
        }
        if (!StringUtil.isNullOrEmpty(query.getMm_emp_id())) {
            map.put("mm_emp_id", query.getMm_emp_id());
        }

        if("1".equals(query.getIs_guanzhu())){
            //如果是1 说明是关注的区域,要查询关注的那几个县区的信息
            map.put("countryid", query.getCountryid());
            map.put("is_guanzhu", "1");
        }else {
            if(!StringUtil.isNullOrEmpty(query.getIs_select_countryId())){
                //说明要查看某一县区的信息
                map.put("countryid", query.getIs_select_countryId());
                map.put("is_guanzhu", "0");
            }else{
                //权限管理
                if(!StringUtil.isNullOrEmpty(query.getMm_level_num())){
                    //存在等级
                    switch (Integer.parseInt(query.getMm_level_num())){
                        case 0://VIP1
                            if (!StringUtil.isNullOrEmpty(query.getCountryid())) {
                                map.put("countryid", query.getCountryid());
                                map.put("is_guanzhu", "0");
                            }
                            break;
                        case 1://VIP2
                            if (!StringUtil.isNullOrEmpty(query.getCityid())) {
                                map.put("cityid", query.getCityid());
                            }
                            break;
                        case 2://VIP3
                            if (!StringUtil.isNullOrEmpty(query.getProvinceid())) {
                                map.put("provinceid", query.getProvinceid());
                            }
                            break;
                        case 3:
                            //全国
                            break;
                        case 4:
                            //全国
                            break;
                    }
                }else {
                    if (!StringUtil.isNullOrEmpty(query.getCountryid())) {
                        map.put("countryid", query.getCountryid());
                        map.put("is_guanzhu", "0");
                    }
                }
                //查看所有信息权限	0默认不允许 1允许
                if("1".equals(query.getIs_see_all())){
                    map.put("countryid", "");
                    map.put("cityid", "");
                    map.put("provinceid", "");
                }
                if("1".equals(query.getMm_msg_type())){
                    //如果是供应的话 要让全部人都看到
                    query.setIs_see_all("1");
                    map.put("countryid", "");
                    map.put("cityid", "");
                    map.put("provinceid", "");
                }
            }
        }

        //查询几天的数据
        Map<String, Object> mapDay = new HashMap<String, Object>();
        List<DayValueObj> listsDay = dayValueObjDao.lists(mapDay);//天数
        DayValueObj dayValueObj = null;
        if(listsDay != null && listsDay.size() > 0){
            dayValueObj = listsDay.get(0);
        }
        String mm_day_value = "30";
        if(dayValueObj != null){
            mm_day_value = dayValueObj.getMm_day_value();//天数
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        DateTimeFormatter timeFormatter = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm");
        String today = String.valueOf(df.format(new Date())) +" 23:59";//今天
        DateTime dateTime = DateTime.parse(today, timeFormatter);
        if(!StringUtil.isNullOrEmpty(mm_day_value)){
            //如果设置了天数
            Object[] objects = DateUtil.getDayInterval(dateTime.getMillis(), Integer.parseInt(mm_day_value));
            String startDay = (String) objects[2];

            DateTime dateTimeStart = DateTime.parse(startDay, timeFormatter);
            if (!StringUtil.isNullOrEmpty(String.valueOf(dateTimeStart.getMillis()))){
                map.put("start", String.valueOf(dateTimeStart.getMillis()));
            }

            if (!StringUtil.isNullOrEmpty(String.valueOf(dateTime.getMillis()))){
                map.put("end", String.valueOf(dateTime.getMillis()));
            }
        }
        map.put("is_check", "1");//查看已经审核通过的
        List<RecordVO> list = recordDao.listRecordVo(map);
        long count = recordDao.count(map);
        for (RecordVO record : list){
            if(!StringUtil.isNullOrEmpty(record.getMm_msg_video())){
                if (record.getMm_msg_video().startsWith("upload")){
                    record.setMm_msg_video(Constants.URL + record.getMm_msg_video());
                }else {
                    record.setMm_msg_video(Constants.QINIU_URL + record.getMm_msg_video());
                }
            }
            //处理经纬度
            if(!StringUtil.isNullOrEmpty(record.getLat()) && !StringUtil.isNullOrEmpty(record.getLng())){
                record.setMm_msg_title(record.getLat() +"," + record.getLng());//把经纬度放到title字段里
            }
            if (!StringUtil.isNullOrEmpty(record.getMm_emp_cover())){
                if (record.getMm_emp_cover().startsWith("upload")){
                    record.setMm_emp_cover(Constants.URL+record.getMm_emp_cover());
                }else {
                    record.setMm_emp_cover(Constants.QINIU_URL + record.getMm_emp_cover());
                }
            }
            if(!StringUtil.isNullOrEmpty(record.getMm_msg_picurl())){
                //处理图片URL链接
                StringBuffer buffer = new StringBuffer();
                String[] pics = new String[]{};
                if(record!=null && record.getMm_msg_picurl()!=null){
                    pics = record.getMm_msg_picurl().split(",");
                }
                for (int i=0; i<pics.length; i++){
                    if (pics[i].startsWith("upload")) {
                        buffer.append(Constants.URL + pics[i]);
                        if (i < pics.length - 1) {
                            buffer.append(",");
                        }
                    }else {
                        buffer.append(Constants.QINIU_URL + pics[i]);
                        if (i < pics.length - 1) {
                            buffer.append(",");
                        }
                    }
                }
                record.setMm_msg_picurl(buffer.toString());
            }
//            record.setDateline(RelativeDateFormat.format(Long.parseLong(record.getDateline())));
            record.setDateline(DateUtil.getDate(record.getDateline(), "yy-MM-dd HH:mm"));
        }

        return new Object[]{list, count};
    }

    @Autowired
    @Qualifier("shenheRecordDao")
    private ShenheRecordDao shenheRecordDao;
    @Override
    public Object save(Object object) throws ServiceException {
        Record record = (Record) object;
        //判断accesstoken是否存在 是否是最新的
        if(!StringUtil.isNullOrEmpty(record.getAccessToken())){
            //不为空，判断是否单点登录
            AccessToken accessToken = accessTokenDao.findByToken(record.getAccessToken());
            if(accessToken == null){
                throw new ServiceException("accessTokenNull");
            }
        }else {
            throw new ServiceException("accessTokenNull");
        }
        //先判断用户今天发布信息数量
        String mm_emp_id = record.getMm_emp_id();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mm_emp_id", mm_emp_id);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        DateTimeFormatter timeFormatter = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm");
        String start = String.valueOf(df.format(new Date())) +" 00:00";//今天
        String end = String.valueOf(df.format(new Date())) +" 23:59";//今天
        if (!StringUtil.isNullOrEmpty(start)){
            DateTime dateTime = DateTime.parse(start, timeFormatter);
            map.put("start", dateTime.getMillis());
        }
        if (!StringUtil.isNullOrEmpty(end)){
            DateTime dateTime = DateTime.parse(end, timeFormatter);
            map.put("end", dateTime.getMillis());
        }
        long lNum =  recordDao.countbyEmpId(map);//今天已经发布的信息数量
        long lCount = Long.valueOf(record.getMm_emp_msg_num());//允许发布的信息数量
        if (lNum >= lCount){
            throw new ServiceException("HAS_FULL");
        }
        record.setMm_msg_id(UUIDFactory.random());
        record.setDateline(System.currentTimeMillis() + "");
        record.setIs_del("0");
        record.setIs_top("0");
        record.setTop_num("0");
        if(!StringUtil.isNullOrEmpty(record.getMm_msg_video())){
            String picName = getVideoPic(record.getMm_msg_video());
            record.setMm_msg_picurl(picName);
        }
        //判断是否审核
        if ("371621".equals(record.getCountryid())){
            //说明是惠民的
            //判断审核方式
            Map<String, Object> map1 = new HashMap<String, Object>();
            List<ShenheRecordObj> listsShenheType = shenheRecordDao.lists(map1);
            if(listsShenheType != null && listsShenheType.size()>0){
                ShenheRecordObj shenheTypeObj = listsShenheType.get(0);
                if(shenheTypeObj != null){
                    if("0".equals(shenheTypeObj.getMm_record_shenhe_type())){
                        //自动审核
                        record.setIs_check("1");;//是否审核  0默认否  1已审核
                    }else{
                        //需要管理员手动审核
                        record.setIs_check("0");//是否审核  0默认否  1已审核
                    }
                }

            }else {
                record.setIs_check("1");;//是否审核  0默认否  1已审核
            }

        }else {
            record.setIs_check("1");;//是否审核  0默认否  1已审核
        }
        recordDao.save(record);

        RecordVO vo = recordDao.findById(record.getMm_msg_id());
        if (vo != null) {
            if (vo.getMm_emp_cover().startsWith("upload")) {
                vo.setMm_emp_cover(Constants.URL + vo.getMm_emp_cover());
            }else {
                vo.setMm_emp_cover(Constants.QINIU_URL + vo.getMm_emp_cover());
            }
            vo.setDateline(RelativeDateFormat.format(Long.parseLong(vo.getDateline())));
            if (!StringUtil.isNullOrEmpty(vo.getMm_msg_picurl())) {
                String[] pic = vo.getMm_msg_picurl().split(",");
                StringBuffer buffer = new StringBuffer();
                for (int i = 0; i < pic.length; i++) {
                    if (pic[i].startsWith("upload")) {
                        buffer.append(Constants.URL + pic[i]);
                        if (i < pic.length - 1) {
                            buffer.append(",");
                        }
                    }else {
                        buffer.append(Constants.QINIU_URL + pic[i]);
                        if (i < pic.length - 1) {
                            buffer.append(",");
                        }
                    }
                }
                vo.setMm_msg_picurl(buffer.toString());
            }
        }
        //发通知 给所有用户 有新消息
//        BaiduPush.PushMsgToAllMsg("蔬菜通有新的消息", "新的求购供应信息" ,"");
        return vo;
    }


    @Override
    public Object findById(Object object) throws ServiceException {
        String id = (String) object;
        RecordVO vo = recordDao.findById(id);
        if (vo != null) {
            if (vo.getMm_emp_cover().startsWith("upload")) {
                vo.setMm_emp_cover(Constants.URL + vo.getMm_emp_cover());
            }else {
                vo.setMm_emp_cover(Constants.QINIU_URL + vo.getMm_emp_cover());
            }
            vo.setDateline(RelativeDateFormat.format(Long.parseLong(vo.getDateline())));
            if (!StringUtil.isNullOrEmpty(vo.getMm_msg_picurl())) {
                String[] pic = vo.getMm_msg_picurl().split(",");
                StringBuffer buffer = new StringBuffer();
                for (int i = 0; i < pic.length; i++) {
                    if (pic[i].startsWith("upload")) {
                        buffer.append(Constants.URL + pic[i]);
                        if (i < pic.length - 1) {
                            buffer.append(",");
                        }
                    }else {
                        buffer.append(Constants.QINIU_URL + pic[i]);
                        if (i < pic.length - 1) {
                            buffer.append(",");
                        }
                    }
                }
                vo.setMm_msg_picurl(buffer.toString());
            }
        }
        return vo;
    }

//    @Override
//    public Object delete(Object object) throws ServiceException {
//        Auth auth = Auth.create(ControllerConstants.QINIU_AK, ControllerConstants.QINIU_SK);
//        BucketManager bucketManager = new BucketManager(auth);
//        String recordId = (String) object;
//        if (!StringUtil.isNullOrEmpty(recordId)) {
//            RecordVO record  = recordDao.findById(recordId);
//
//            //图片不为空  删除七牛空间的图片
//            if (!StringUtil.isNullOrEmpty(record.getMm_msg_picurl())){
//                if (!record.getMm_msg_picurl().startsWith("upload")){
//                    String[] picKeys = record.getMm_msg_picurl().split(",");
//                    for (int i=0; i<picKeys.length; i++){
//                        try {
//                            bucketManager.delete(Constants.QINIU_SPACE, picKeys[i]);
//                        } catch (QiniuException e) {
//                            throw new ServiceException("ERROR");
//                        }
//                    }
//                }
//            }
//            //删除动态
//            recordDao.deleteById(recordId);
//        }else {
//            throw new ServiceException("ERROR");
//        }
//        return null;
//    }

    private String getVideoPic(String videoName){
        String picName = UUIDFactory.random();
        StringMap params = new StringMap()
                .putWhen("force", 1, true)
                .putNotEmpty("pipeline", "");

        String saveas = Constants.QINIU_SPACE+":"+picName;
        String safeSaveas = UrlSafeBase64.encodeToString(saveas);

        String fops = "vframe/jpg/offset/1/rotate/auto|saveas/";

        String fop = fops + safeSaveas;

        String persistentId;
        try {
            persistentId = new Ops().oper(Constants.QINIU_SPACE, videoName,fop,params);
            System.out.println(persistentId);
        } catch (QiniuException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            try {
                System.out.println(e.response.bodyString());
            } catch (QiniuException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        }

        return picName;
    }

}
