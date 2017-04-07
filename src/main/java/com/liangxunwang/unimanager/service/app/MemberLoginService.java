package com.liangxunwang.unimanager.service.app;

import com.liangxunwang.unimanager.dao.EmpDao;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.service.ExecuteService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.Constants;
import com.liangxunwang.unimanager.util.DateUtil;
import com.liangxunwang.unimanager.util.MD5Util;
import com.liangxunwang.unimanager.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * Created by zhl on 2015/1/29.
 */
@Service("memberLoginService")
public class MemberLoginService implements ExecuteService {
    @Autowired
    @Qualifier("empDao")
    private EmpDao dao;

    @Override
    public Object execute(Object object) {
        Object[] params = (Object[]) object;
        String username = (String) params[0];
        String password = (String) params[1];

        EmpVO member = dao.findByMobile(username);
        if (member == null){
            throw new ServiceException("NotFound");
        }
        if (!new MD5Util().getMD5ofStr(password).equals(member.getMm_emp_password())){
            throw new ServiceException("PassError");
        }
//        if(!StringUtil.isNullOrEmpty(member.getUserId())){
//            //说明有USERID
//            if(StringUtil.isNullOrEmpty(userId)){
//                //没有传userid,说明用户更换了手机号，登录失败
//                throw new ServiceException("ChangeMobile");
//            }else{
//                //userid不是空
//                if(!member.getUserId().equals(userId)){
//                    //两次传的userid不一样
//                    throw new ServiceException("ChangeMobile");
//                }
//            }
//        }

        if ("1".equals(member.getIs_use())){
            throw new ServiceException("NotUse");//禁用
        }
        if (!"1".equals(member.getIscheck())){
            throw new ServiceException("NotCheck");//未审核
        }

        if(!StringUtil.isNullOrEmpty(member.getMm_emp_cover())){
            if (member.getMm_emp_cover().startsWith("upload")) {
                member.setMm_emp_cover(Constants.URL + member.getMm_emp_cover());
            }else {
                member.setMm_emp_cover(Constants.QINIU_URL + member.getMm_emp_cover());
            }
        }

        if(!StringUtil.isNullOrEmpty(member.getAd_pic())){
            if (member.getAd_pic().startsWith("upload")) {
                member.setAd_pic(Constants.URL + member.getAd_pic());
            }else {
                member.setAd_pic(Constants.QINIU_URL + member.getAd_pic());
            }
        }

        if(!StringUtil.isNullOrEmpty(member.getMm_emp_company_pic())){
            if (member.getMm_emp_company_pic().startsWith("upload")) {
                member.setMm_emp_company_pic(Constants.URL + member.getMm_emp_company_pic());
            }else {
                member.setMm_emp_company_pic(Constants.QINIU_URL + member.getMm_emp_company_pic());
            }
        }
        if(member != null && !StringUtil.isNullOrEmpty(member.getMm_emp_endtime())){
            //vip到期日期不为空
            member.setMm_emp_endtime(DateUtil.getDate(member.getMm_emp_endtime(), "yyyy-MM-dd"));
        }
        return member;
    }
}
