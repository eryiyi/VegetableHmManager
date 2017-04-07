package com.liangxunwang.unimanager.service.account;

import com.liangxunwang.unimanager.dao.HotCityDao;
import com.liangxunwang.unimanager.dao.KefuTelDao;
import com.liangxunwang.unimanager.model.CityObj;
import com.liangxunwang.unimanager.model.KefuTel;
import com.liangxunwang.unimanager.mvc.vo.CityVO;
import com.liangxunwang.unimanager.mvc.vo.KefuVO;
import com.liangxunwang.unimanager.query.HotCityQuery;
import com.liangxunwang.unimanager.query.KefuQuery;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.StringUtil;
import com.liangxunwang.unimanager.util.UUIDFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("hotCityService")
public class HotCityService implements ListService,SaveService , DeleteService{

    @Autowired
    @Qualifier("hotCityDao")
    private HotCityDao hotCityDao;

    @Override
    public Object list(Object object) throws ServiceException {
        HotCityQuery query = (HotCityQuery) object;
        Map<String, Object> map = new HashMap<String, Object>();
        if(!StringUtil.isNullOrEmpty(query.getFather())){
            map.put("father", query.getFather());
        }
        List<CityVO> lists = hotCityDao.lists(map);
        return lists;
    }

    @Override
    public Object save(Object object) throws ServiceException {
        CityObj cityObj = (CityObj) object;
        cityObj.setId(UUIDFactory.random());
        hotCityDao.save(cityObj);
        return null;
    }

    @Override
    public Object delete(Object object) throws ServiceException {
        hotCityDao.delete((String) object);
        return null;
    }
}
