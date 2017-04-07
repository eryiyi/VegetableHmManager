package com.liangxunwang.unimanager.service.account;

import com.liangxunwang.unimanager.dao.EmpDao;
import com.liangxunwang.unimanager.model.Emp;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.service.ExecuteService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.service.UpdateService;
import com.liangxunwang.unimanager.util.CreateSimpleExcelToDisk;
import com.liangxunwang.unimanager.util.DateUtil;
import com.liangxunwang.unimanager.util.StringUtil;
import jxl.Workbook;
import jxl.format.CellFormat;
import jxl.write.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 */
@Service("empExcelService")
public class EmpExcelService implements ExecuteService,UpdateService{
    @Autowired
    @Qualifier("empDao")
    private EmpDao empDao;

    @Override
    public Object execute(Object object) throws Exception {
        Object[] objects = (Object[]) object;
        String ids = (String) objects[0];
        HttpServletRequest request = (HttpServletRequest) objects[1];
        if(!StringUtil.isNullOrEmpty(ids)){
            String[] arrs = ids.split(",");
            //查询这些用户的数据
            List<EmpVO> empVOs = new ArrayList<EmpVO>();
            for(int i=0;i<arrs.length;i++){
                EmpVO empVO = empDao.findById(arrs[i]);
                if(empVO != null && !StringUtil.isNullOrEmpty(empVO.getMm_emp_id())){
                    if(empVO != null && !StringUtil.isNullOrEmpty(empVO.getMm_emp_endtime())){
                        //vip到期日期不为空
                        empVO.setMm_emp_endtime(DateUtil.getDate(empVO.getMm_emp_endtime(), "yyyy-MM-dd"));
                    }
                    empVOs.add(empVO);
                }
            }
            String fileName = CreateSimpleExcelToDisk.toExcelEmp(empVOs,request);
            return fileName;
        }
        return null;
    }


    @Override
    public Object update(Object object) {
        Emp emp = (Emp) object;
        empDao.updateCompanyLocation(emp);
        return null;
    }
}
