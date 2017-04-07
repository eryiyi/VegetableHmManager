package com.liangxunwang.unimanager.service.account;

import com.liangxunwang.unimanager.dao.EmpDao;
import com.liangxunwang.unimanager.model.Emp;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.query.EmpQuery;
import com.liangxunwang.unimanager.query.MemberQuery;
import com.liangxunwang.unimanager.service.ExecuteService;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.service.UpdateService;
import com.liangxunwang.unimanager.util.Constants;
import com.liangxunwang.unimanager.util.DateUtil;
import com.liangxunwang.unimanager.util.MD5Util;
import com.liangxunwang.unimanager.util.StringUtil;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 */
@Service("empService")
public class EmpService implements ListService , UpdateService , ExecuteService{
    @Autowired
    @Qualifier("empDao")
    private EmpDao empDao;

    @Override
    public Object list(Object object) throws ServiceException {
        EmpQuery query = (EmpQuery) object;
        Map<String, Object> map = new HashMap<String, Object>();
        int index = (query.getIndex() - 1) * query.getSize();
        int size = query.getSize();

        map.put("index", index);
        map.put("size", size);

        if (!StringUtil.isNullOrEmpty(query.getMm_emp_company_type())) {
            map.put("mm_emp_company_type", query.getMm_emp_company_type());
        }
        if (!StringUtil.isNullOrEmpty(query.getMm_emp_type())) {
            if(!"2".equals(query.getMm_emp_type())){
                //说明是普通会员和经营户
                map.put("mm_emp_type", query.getMm_emp_type());
            }else {
                map.put("is_special", "1");
            }
        }
        if (!StringUtil.isNullOrEmpty(query.getMm_level_id())) {
            map.put("mm_level_id", query.getMm_level_id());
        }
        if (!StringUtil.isNullOrEmpty(query.getIscheck())) {
            map.put("ischeck", query.getIscheck());
        }
        if (!StringUtil.isNullOrEmpty(query.getKeyword())) {
            map.put("keyword", query.getKeyword());
        }

        //判断三天之内的即将到期的，需要传递当前日期的毫秒值和三天之后的毫秒值
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        DateTimeFormatter timeFormatter = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm");
        String today = String.valueOf(df.format(new Date())) +" 23:59";//今天
        DateTime dateTime = DateTime.parse(today, timeFormatter);

        Object[] objects = DateUtil.getDayInterval(dateTime.getMillis(), -3);//3天之后
        String startDay = (String) objects[2];

        DateTime dateTimeStart = DateTime.parse(startDay, timeFormatter);

        if (!StringUtil.isNullOrEmpty(query.getIs_daoqi())) {
            map.put("is_daoqi", query.getIs_daoqi());
            if("1".equals(query.getIs_daoqi())){
                if (!StringUtil.isNullOrEmpty(String.valueOf(dateTimeStart.getMillis()))){
                    map.put("end", String.valueOf(dateTimeStart.getMillis()));
                }
                if (!StringUtil.isNullOrEmpty(String.valueOf(dateTime.getMillis()))){
                    map.put("start", String.valueOf(dateTime.getMillis()));
                }
            }
        }

        //分地区管理
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_provinceId())){
            map.put("mm_emp_provinceId", query.getMm_emp_provinceId());
        }
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_cityId())){
            map.put("mm_emp_cityId", query.getMm_emp_cityId());
        }
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_countryId())){
            map.put("mm_emp_countryId", query.getMm_emp_countryId());
        }

        //判断是否今日注册量
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_regtime())){
            if("0".equals(query.getMm_emp_regtime())){
                //不限时间
                map.put("mm_emp_regtime", "");
            }else if("1".equals(query.getMm_emp_regtime())){
                map.put("mm_emp_regtime", DateUtil.getDateAndTimeTwo());
            }
        }

        List<EmpVO> lists = empDao.listMemberByName(map);
        if(lists != null){
            String startTimeLong = "";//今天的毫秒值
            String endTimeLong = "";//三天之后的毫秒值
            if (!StringUtil.isNullOrEmpty(String.valueOf(dateTimeStart.getMillis()))){
                endTimeLong = String.valueOf(dateTimeStart.getMillis());
            }
            if (!StringUtil.isNullOrEmpty(String.valueOf(dateTime.getMillis()))){
                startTimeLong = String.valueOf(dateTime.getMillis());
            }
            for(EmpVO empVO:lists){
                if(empVO != null && !StringUtil.isNullOrEmpty(empVO.getMm_emp_endtime())){
                    //vip到期日期不为空
                    if(Long.valueOf(empVO.getMm_emp_endtime()) > Long.valueOf(startTimeLong) && Long.valueOf(empVO.getMm_emp_endtime())<Long.valueOf(endTimeLong)){
                        //大于开始时间 小于结束时间 说明三天之内即将到期
                        empVO.setIs_dq("1");
                    }else {
                        empVO.setIs_dq("0");
                    }
                    empVO.setMm_emp_endtime(DateUtil.getDate( empVO.getMm_emp_endtime(), "yyyy-MM-dd"));
                }
            }
        }
        long count = empDao.count(map);


        return new Object[]{lists, count};
    }

    @Override
    public Object update(Object object) {
        if (object instanceof Emp){
            Emp emp = (Emp) object;
            if(emp != null && !StringUtil.isNullOrEmpty(emp.getMm_emp_password())){
                emp.setMm_emp_password(new MD5Util().getMD5ofStr(emp.getMm_emp_password()));//密码加密
                empDao.updatePwr(emp);
            }else {
                if(emp != null && !StringUtil.isNullOrEmpty(emp.getMm_emp_cover()) && !emp.getMm_emp_cover().startsWith("http://")){
                    empDao.updateCover(emp);
                }
                if(emp != null && !StringUtil.isNullOrEmpty(emp.getAd_pic()) && !emp.getAd_pic().startsWith("http://")){
                    empDao.updateAd(emp);
                }
                if(!StringUtil.isNullOrEmpty(emp.getMm_emp_endtime())){
                    emp.setMm_emp_endtime(DateUtil.getMs(emp.getMm_emp_endtime(), "yyyy-MM-dd") + "");
                    empDao.update(emp);
                }
//
            }
        }
        return null;
    }

    @Override
    public Object execute(Object object) throws ServiceException {
        String id = (String) object;
        EmpVO empVO = empDao.findById(id);
        if (empVO !=null && !StringUtil.isNullOrEmpty(empVO.getMm_emp_cover())) {
            if (empVO.getMm_emp_cover().startsWith("upload")) {
                empVO.setMm_emp_cover(Constants.URL + empVO.getMm_emp_cover());
            }else {
                empVO.setMm_emp_cover(Constants.QINIU_URL + empVO.getMm_emp_cover());
            }
        }

        if(empVO != null && !StringUtil.isNullOrEmpty(empVO.getMm_emp_company_pic())){
            if(empVO.getMm_emp_company_pic().startsWith("upload")){
                empVO.setMm_emp_company_pic(Constants.URL + empVO.getMm_emp_company_pic());
            }else{
                empVO.setMm_emp_company_pic(Constants.QINIU_URL + empVO.getMm_emp_company_pic());
            }
        }
        if(empVO != null && !StringUtil.isNullOrEmpty(empVO.getMm_emp_endtime())){
            //vip到期日期不为空
            empVO.setMm_emp_endtime(DateUtil.getDate( empVO.getMm_emp_endtime(), "yyyy-MM-dd"));
        }
        if(empVO != null && !StringUtil.isNullOrEmpty(empVO.getAd_pic())){
            if(empVO.getAd_pic().startsWith("upload")){
                empVO.setAd_pic(Constants.URL + empVO.getAd_pic());
            }else{
                empVO.setAd_pic(Constants.QINIU_URL + empVO.getAd_pic());
            }
        }else {
            if(empVO != null){
                empVO.setAd_pic(Constants.QINIU_URL + "ad_mp.jpg" );
            }
        }
        return empVO;
    }

}
