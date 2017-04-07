package com.liangxunwang.unimanager.service.webv;

import com.liangxunwang.unimanager.dao.AccessTokenDao;
import com.liangxunwang.unimanager.dao.RecordDao;
import com.liangxunwang.unimanager.model.AccessToken;
import com.liangxunwang.unimanager.model.Record;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.RecordQuery;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.Constants;
import com.liangxunwang.unimanager.util.DateUtil;
import com.liangxunwang.unimanager.util.RelativeDateFormat;
import com.liangxunwang.unimanager.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhl on 2015/3/3.
 */
@Service("webVRecordService")
public class WebVRecordService implements ListService,DeleteService,ExecuteService,UpdateService {

    @Autowired
    @Qualifier("recordDao")
    private RecordDao recordDao;

    @Autowired
    @Qualifier("accessTokenDao")
    private AccessTokenDao accessTokenDao;

    @Override
    public Object list(Object object) throws ServiceException {
        RecordQuery query = (RecordQuery) object;
        Map<String, Object> map = new HashMap<String, Object>();
        int index = (query.getIndex() - 1) * query.getSize();
        int size = query.getSize();

        map.put("index", index);
        map.put("size", size);

        if (!StringUtil.isNullOrEmpty(query.getMm_msg_type())) {
            map.put("mm_msg_type", query.getMm_msg_type());
        }

        if (!StringUtil.isNullOrEmpty(query.getKeyword())) {
            map.put("keyword", query.getKeyword());
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
            }else{
                //权限管理
                if(!StringUtil.isNullOrEmpty(query.getMm_level_num())){
                    //存在等级
                    switch (Integer.parseInt(query.getMm_level_num())){
                        case 0:
                            if (!StringUtil.isNullOrEmpty(query.getCountryid())) {
                                map.put("countryid", query.getCountryid());
                                map.put("is_guanzhu", "0");
                            }
                            break;
                        case 1:
                            if (!StringUtil.isNullOrEmpty(query.getCityid())) {
                                map.put("cityid", query.getCityid());
                            }
                            break;
                        case 2:
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
                    map.put("is_guanzhu", "0");
                }
            }
        }

//        //判断accesstoken是否存在 是否是最新的
//        if(!StringUtil.isNullOrEmpty(query.getAccessToken())){
//            //不为空，判断是否单点登录
//            AccessToken accessToken = accessTokenDao.findByToken(query.getAccessToken());
//            if(accessToken == null){
//                throw new ServiceException("accessTokenNull");
//            }
//        }else {
//        //      throw new ServiceException("accessTokenNull");
//            //没登陆
//            map.put("index", 1);
//            map.put("size", 10);
//        }
        List<RecordVO> lists = recordDao.listRecordVo(map);
        for (RecordVO record : lists){
            if(!StringUtil.isNullOrEmpty(record.getMm_msg_video())){
                if (record.getMm_msg_video().startsWith("upload")){
                    record.setMm_msg_video(Constants.URL + record.getMm_msg_video());
                }else {
                    record.setMm_msg_video(Constants.QINIU_URL + record.getMm_msg_video());
                }
            }
            //处理内容-文字超出限制
            if(!StringUtil.isNullOrEmpty(record.getMm_msg_content())){
                if(record.getMm_msg_content().length() > 50){
                    record.setMm_msg_title(record.getMm_msg_content().substring(0,49)+"...");
                }else {
                    record.setMm_msg_title(record.getMm_msg_content());
                }
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

        long count = recordDao.count(map);

        return new Object[]{lists, count};
    }


    @Override
    public Object delete(Object object) throws ServiceException {
        String mm_msg_id = (String) object;
        recordDao.deleteById(mm_msg_id);
        return null;
    }

    @Override
    public Object execute(Object object) throws ServiceException {
        String mm_msg_id = (String) object;
        RecordVO recordVO = recordDao.findById(mm_msg_id);
        if(recordVO !=null && !StringUtil.isNullOrEmpty(recordVO.getMm_msg_video())){
            if (recordVO.getMm_msg_video().startsWith("upload")){
                recordVO.setMm_msg_video(Constants.URL + recordVO.getMm_msg_video());
            }else {
                recordVO.setMm_msg_video(Constants.QINIU_URL + recordVO.getMm_msg_video());
            }
        }
        if (recordVO != null && !StringUtil.isNullOrEmpty(recordVO.getMm_emp_cover())){
            if (recordVO.getMm_emp_cover().startsWith("upload")){
                recordVO.setMm_emp_cover(Constants.URL+recordVO.getMm_emp_cover());
            }else {
                recordVO.setMm_emp_cover(Constants.QINIU_URL + recordVO.getMm_emp_cover());
            }
        }
        if(recordVO!= null && !StringUtil.isNullOrEmpty(recordVO.getMm_msg_picurl())){
            //处理图片URL链接
            StringBuffer buffer = new StringBuffer();
            String[] pics = new String[]{};
            if(recordVO!=null && recordVO.getMm_msg_picurl()!=null){
                pics = recordVO.getMm_msg_picurl().split(",");
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
            recordVO.setMm_msg_picurl(buffer.toString());
        }
        if(recordVO != null && !StringUtil.isNullOrEmpty(recordVO.getDateline())){
            recordVO.setDateline(RelativeDateFormat.format(Long.parseLong(recordVO.getDateline())));
        }
        return recordVO;
    }

    @Override
    public Object update(Object object) {
        if (object instanceof Record){
            Record record = (Record) object;
            recordDao.updateTop(record);
        }
        return null;
    }
}
