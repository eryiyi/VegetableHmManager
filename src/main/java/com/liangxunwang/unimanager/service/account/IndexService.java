package com.liangxunwang.unimanager.service.account;

import com.liangxunwang.unimanager.dao.EmpDao;
import com.liangxunwang.unimanager.dao.RecordDao;
import com.liangxunwang.unimanager.dao.ReportDao;
import com.liangxunwang.unimanager.query.BaseAreaQuery;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.DateUtil;
import com.liangxunwang.unimanager.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by zhl on 2015/3/3.
 */
@Service("indexService")
public class IndexService implements ListService {
    @Autowired
    @Qualifier("empDao")
    private EmpDao empDao;

    @Autowired
    @Qualifier("recordDao")
    private RecordDao recordDao;

    @Autowired
    @Qualifier("reportDao")
    private ReportDao reportDao;

    @Override
    public Object list(Object object) throws ServiceException {
        BaseAreaQuery query = (BaseAreaQuery) object;
        Map<String, Object> map = new HashMap<String, Object>();
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_provinceId())){
            map.put("mm_emp_provinceId", query.getMm_emp_provinceId());
        }
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_cityId())){
            map.put("mm_emp_cityId", query.getMm_emp_cityId());
        }
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_countryId())){
            map.put("mm_emp_countryId", query.getMm_emp_countryId());
        }
        //总共会员数量
        long memberCount = empDao.count(map);
        //待审核的数量
        map.put("ischeck", "0");
        long memberCountNo = empDao.count(map);
        //今日注册会员数量

        map.put("mm_emp_regtime", DateUtil.getDateAndTimeThree());
        long memberCountNoDay = empDao.countDay(map);

        //资讯管理
        Map<String, Object> mapR = new HashMap<String, Object>();
        //分地区管理
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_provinceId())){
            mapR.put("provinceid", query.getMm_emp_provinceId());
        }
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_cityId())){
            mapR.put("cityid", query.getMm_emp_cityId());
        }
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_countryId())){
            mapR.put("countryid", query.getMm_emp_countryId());
        }

        mapR.put("mm_msg_type", "0");//求购信息
        long countQiugou = recordDao.count(mapR);
        mapR.put("mm_msg_type", "1");//供应信息
        long countGongying = recordDao.count(mapR);

        Map<String, Object> mapRN = new HashMap<String, Object>();
        //分地区管理
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_provinceId())){
            mapRN.put("provinceid", query.getMm_emp_provinceId());
        }
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_cityId())){
            mapRN.put("cityid", query.getMm_emp_cityId());
        }
        if(!StringUtil.isNullOrEmpty(query.getMm_emp_countryId())){
            mapRN.put("countryid", query.getMm_emp_countryId());
        }
        mapRN.put("is_check", "0");
        mapRN.put("mm_msg_type", "0");//求购信息
        long countQiugouN = recordDao.count(mapRN);
        mapRN.put("mm_msg_type", "1");//供应信息
        long countGongyingN = recordDao.count(mapRN);


        //查询举报数量
        Map<String, Object> mapReport = new HashMap<String, Object>();
        long countReport = reportDao.countAll(mapReport);

        List<Long> list = new ArrayList<Long>();
        list.add(memberCount);
        list.add(memberCountNo);
        list.add(countQiugou);
        list.add(countGongying);
        list.add(countReport);
        list.add(memberCountNoDay);
        list.add(countQiugouN);
        list.add(countGongyingN);
        return list;
    }
}
