package com.liangxunwang.unimanager.service.account;

import com.liangxunwang.unimanager.dao.HotAreaDao;
import com.liangxunwang.unimanager.dao.HotCityDao;
import com.liangxunwang.unimanager.model.CityObj;
import com.liangxunwang.unimanager.model.CountryObj;
import com.liangxunwang.unimanager.mvc.vo.CountryVO;
import com.liangxunwang.unimanager.query.HotCityQuery;
import com.liangxunwang.unimanager.service.DeleteService;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.SaveService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.StringUtil;
import com.liangxunwang.unimanager.util.UUIDFactory;
import org.apache.poi.ss.formula.functions.Count;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("hotAreaService")
public class HotAreaService implements ListService,SaveService , DeleteService{

    @Autowired
    @Qualifier("hotAreaDao")
    private HotAreaDao hotAreaDao;

    @Override
    public Object list(Object object) throws ServiceException {
        HotCityQuery query = (HotCityQuery) object;
        Map<String, Object> map = new HashMap<String, Object>();
        if(!StringUtil.isNullOrEmpty(query.getFather())){
            map.put("father", query.getFather());
        }
        List<CountryVO> lists = hotAreaDao.lists(map);
        return lists;
    }

    @Override
    public Object save(Object object) throws ServiceException {
        CountryObj cityObj = (CountryObj) object;
        cityObj.setId(UUIDFactory.random());
        hotAreaDao.save(cityObj);
        return null;
    }

    @Override
    public Object delete(Object object) throws ServiceException {
        hotAreaDao.delete((String) object);
        return null;
    }
}
