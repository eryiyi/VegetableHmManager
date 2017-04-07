package com.liangxunwang.unimanager.service.account;

import com.liangxunwang.unimanager.dao.ShenheRecordDao;
import com.liangxunwang.unimanager.model.ShenheRecordObj;
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

@Service("shenheRecordService")
public class ShenheRecordService implements ListService,SaveService ,UpdateService{
    @Autowired
    @Qualifier("shenheRecordDao")
    private ShenheRecordDao shenheRecordDao;

    @Override
    public Object list(Object object) throws ServiceException {
        Map<String, Object> map = new HashMap<String, Object>();
        List<ShenheRecordObj> lists = shenheRecordDao.lists(map);
        return lists;
    }


    @Override
    public Object save(Object object) throws ServiceException {
        ShenheRecordObj aboutUs = (ShenheRecordObj) object;
        aboutUs.setMm_record_shenhe_id(UUIDFactory.random());
        shenheRecordDao.save(aboutUs);
        return null;
    }


    @Override
    public Object update(Object object) {
        ShenheRecordObj feiyongObj = (ShenheRecordObj) object;
        shenheRecordDao.update(feiyongObj);
        return null;
    }
}
