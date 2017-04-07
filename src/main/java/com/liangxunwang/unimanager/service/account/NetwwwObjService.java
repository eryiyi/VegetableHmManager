package com.liangxunwang.unimanager.service.account;

import com.liangxunwang.unimanager.dao.AdDao;
import com.liangxunwang.unimanager.dao.NetwwwObjDao;
import com.liangxunwang.unimanager.model.AdObj;
import com.liangxunwang.unimanager.model.NetwwwObj;
import com.liangxunwang.unimanager.query.AdQuery;
import com.liangxunwang.unimanager.query.NetwwwObjQuery;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.Constants;
import com.liangxunwang.unimanager.util.StringUtil;
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
@Service("netwwwObjService")
public class NetwwwObjService implements ListService,SaveService ,DeleteService,ExecuteService, UpdateService{
    @Autowired
    @Qualifier("netwwwObjDao")
    private NetwwwObjDao netwwwObjDao;

    @Override
    public Object list(Object object) throws ServiceException {
        NetwwwObjQuery query = (NetwwwObjQuery) object;
        Map<String, Object> map = new HashMap<String, Object>();
        if(!StringUtil.isNullOrEmpty(query.getMm_net_type())){
            map.put("mm_net_type", query.getMm_net_type());
        }
        List<NetwwwObj> lists = netwwwObjDao.lists(map);
        return lists;
    }

    @Override
    public Object save(Object object) throws ServiceException {
        NetwwwObj adObj = (NetwwwObj) object;
        adObj.setId(UUIDFactory.random());
        netwwwObjDao.save(adObj);
        return null;
    }

    @Override
    public Object delete(Object object) throws ServiceException {
        String id = (String) object;
        netwwwObjDao.delete(id);
        return null;
    }

    @Override
    public Object execute(Object object) throws ServiceException {
        return netwwwObjDao.findById((String) object);
    }

    @Override
    public Object update(Object object) {
        NetwwwObj adObj = (NetwwwObj) object;
        netwwwObjDao.update(adObj);
        return null;
    }
}
