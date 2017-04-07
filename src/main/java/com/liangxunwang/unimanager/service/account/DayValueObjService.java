package com.liangxunwang.unimanager.service.account;

import com.liangxunwang.unimanager.dao.DayValueObjDao;
import com.liangxunwang.unimanager.dao.NearbyDistanceObjDao;
import com.liangxunwang.unimanager.model.DayValueObj;
import com.liangxunwang.unimanager.model.NearbyDistanceObj;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.SaveService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.service.UpdateService;
import com.liangxunwang.unimanager.util.UUIDFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhl on 2015/3/3.
 */
@Service("dayValueObjService")
public class DayValueObjService implements ListService,SaveService ,UpdateService{
    @Autowired
    @Qualifier("dayValueObjDao")
    private DayValueObjDao dayValueObjDao;

    @Override
    public Object list(Object object) throws ServiceException {
        Map<String, Object> map = new HashMap<String, Object>();
        List<DayValueObj> lists = dayValueObjDao.lists(map);
        return lists;
    }

    @Override
    public Object save(Object object) throws ServiceException {
        DayValueObj aboutUs = (DayValueObj) object;
        aboutUs.setMm_day_id(UUIDFactory.random());
        dayValueObjDao.save(aboutUs);
        return null;
    }


    @Override
    public Object update(Object object) {
        DayValueObj feiyongObj = (DayValueObj) object;
        dayValueObjDao.update(feiyongObj);
        return null;
    }
}
