package com.liangxunwang.unimanager.mvc.webv;

import com.liangxunwang.unimanager.model.FuwuObj;
import com.liangxunwang.unimanager.model.KefuTel;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.mvc.vo.KefuVO;
import com.liangxunwang.unimanager.query.FuwuQuery;
import com.liangxunwang.unimanager.query.KefuQuery;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.ControllerConstants;
import com.liangxunwang.unimanager.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by zhl on 2015/8/12.
 */
@Controller
@RequestMapping("/webvKefuController")
public class WebvKefuController extends ControllerConstants {


    @Autowired
    @Qualifier("appKefuTelService")
    private ListService appKefuTelService;

    @RequestMapping("toKefu")
    public String toLogin(HttpSession session,ModelMap map,KefuQuery query){
        try {
            if(StringUtil.isNullOrEmpty(query.getIsType())){
                query.setIsType("0");//0是本地  1是全国
            }
            EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);
            if(emp != null){
                //说明登陆了 ，只需要取本地的
                query.setMm_emp_countryId(emp.getMm_emp_countryId());
            }
            query.setMm_tel_type("0");
            List<KefuVO> list = (List<KefuVO>) appKefuTelService.list(query);

            query.setMm_tel_type("1");
            query.setMm_emp_countryId("");
            List<KefuVO> listAll = (List<KefuVO>) appKefuTelService.list(query);

            if("0".equals(query.getIsType())){
                map.put("list", list);//本地的
            }else {
                map.put("list", listAll);//全国的
            }
            map.addAttribute("query", query);
            return "/webv/kefu";
        }catch (ServiceException e){
            String msg = e.getMessage();
            if (msg.equals("accessTokenNull")){
                return "/webv/login";
            }else{
                return "/webv/login";
            }
        }

    }

}
