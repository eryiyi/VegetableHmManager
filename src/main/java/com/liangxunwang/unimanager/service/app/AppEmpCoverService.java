package com.liangxunwang.unimanager.service.app;

import com.liangxunwang.unimanager.dao.EmpDao;
import com.liangxunwang.unimanager.service.UpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 */
@Service("appEmpCoverService")
public class AppEmpCoverService implements  UpdateService{
    @Autowired
    @Qualifier("empDao")
    private EmpDao empDao;

    @Override
    public Object update(Object object) {
        Object[] params = (Object[]) object;
        String mm_emp_id = (String) params[0];
        String mm_emp_cover = (String) params[1];
        empDao.updateCoverByEmpId(mm_emp_id, mm_emp_cover);
        return null;
    }
}
