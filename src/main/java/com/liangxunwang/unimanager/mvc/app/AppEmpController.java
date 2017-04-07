package com.liangxunwang.unimanager.mvc.app;

import com.liangxunwang.unimanager.model.*;
import com.liangxunwang.unimanager.model.tip.DataTip;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.query.*;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.ControllerConstants;
import com.liangxunwang.unimanager.util.MD5Util;
import com.liangxunwang.unimanager.util.Page;
import com.liangxunwang.unimanager.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

/**
 * Created by zhl on 2015/8/12.
 */
@Controller
public class AppEmpController extends ControllerConstants {

    @Autowired
    @Qualifier("empService")
    private ExecuteService empServiceExecute;


    @RequestMapping(value = "/getMemberInfoById", produces = "text/plain;charset=UTF-8;")
    @ResponseBody
    public String getMemberInfoById(String id) throws Exception {
        try {
            //查看该会员信息
            EmpVO empVO = (EmpVO) empServiceExecute.execute(id);
            DataTip tip = new DataTip();
            tip.setData(empVO);
            return toJSONString(tip);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }

    @Autowired
    @Qualifier("appEmpService")
    private UpdateService appEmpService;

    @RequestMapping(value = "/sendLocation", produces = "text/plain;charset=UTF-8;")
    @ResponseBody
    public String sendLocation(String mm_emp_id,String lat, String lng){
        try {
            //保存用户定位数据
            Emp emp = new Emp();
            emp.setMm_emp_id(mm_emp_id);
            emp.setLat(lat);
            emp.setLng(lng);
            appEmpService.update(emp);
            DataTip tip = new DataTip();
            tip.setData(tip);
            return toJSONString(tip);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }


    @RequestMapping(value = "/updatePwr", produces = "text/plain;charset=UTF-8;")
    @ResponseBody
    public String updatePwr(String mm_emp_mobile,String newpass,String mm_emp_card){
        try {
            //修改用户密码
            Emp emp = new Emp();
            emp.setMm_emp_mobile(mm_emp_mobile);
            if(!StringUtil.isNullOrEmpty(newpass)){
                emp.setMm_emp_password(newpass);
            }
            if(!StringUtil.isNullOrEmpty(mm_emp_card)){
                emp.setMm_emp_card(mm_emp_card);
            }
            appEmpService.update(emp);
            DataTip tip = new DataTip();
            tip.setData(tip);
            return toJSONString(tip);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }

    @Autowired
    @Qualifier("appEmpService")
    private ListService appEmpServiceList;


    @RequestMapping(value = "/getNearby", produces = "text/plain;charset=UTF-8;")
    @ResponseBody
    public String getNearby(NearbyQuery query, Page page){
        query.setIndex(page.getIndex()==0?1:page.getIndex());
        query.setSize(query.getSize()==0?page.getDefaultSize():query.getSize());
        try {
            Object[] results = (Object[])appEmpServiceList.list(query);
            DataTip tip = new DataTip();
            tip.setData(results[0]);
            return toJSONString(tip);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }

    @Autowired
    @Qualifier("appEmpPwrService")
    private UpdateService appEmpPwrService;

    @RequestMapping(value = "/updatePwrApp", produces = "text/plain;charset=UTF-8;")
    @ResponseBody
    public String updatePwr(String mm_emp_mobile,String newpass){
        try {
            //修改用户密码
            Emp emp = new Emp();
            emp.setMm_emp_mobile(mm_emp_mobile);
            if(!StringUtil.isNullOrEmpty(newpass)){
                emp.setMm_emp_password(newpass);
            }
            appEmpPwrService.update(emp);
            DataTip tip = new DataTip();
            tip.setData(tip);
            return toJSONString(tip);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }

    @Autowired
    @Qualifier("appEmpService")
    private ExecuteService appEmpServiceExe;

    @RequestMapping(value = "/getMemberByMobile", produces = "text/plain;charset=UTF-8;")
    @ResponseBody
    public String getMemberByMobile(String mm_emp_mobile) throws Exception {
        try {
            //查看该会员信息
            EmpVO empVO = (EmpVO) appEmpServiceExe.execute(mm_emp_mobile);
            if(empVO != null){
                //说明该手机号已经注册了
                DataTip tip = new DataTip();
                tip.setData(empVO);
                return toJSONString(tip);
            }else {
                return toJSONString(ERROR_1);
            }
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }


    @Autowired
    @Qualifier("appEmpBaiduService")
    private UpdateService appEmpBaiduService;

    @RequestMapping("/updatePushId")
    @ResponseBody
    public String updatePushId(@RequestParam String id, @RequestParam String userId, @RequestParam String channelId, @RequestParam String type){
        if (StringUtil.isNullOrEmpty(id) || StringUtil.isNullOrEmpty(userId) || StringUtil.isNullOrEmpty(channelId)|| StringUtil.isNullOrEmpty(type)){
            return toJSONString(ERROR_1);
        }
        Object[] params = new Object[]{id, userId, channelId, type};
        try {
            appEmpBaiduService.update(params);
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);

        }
    }


    @Autowired
    @Qualifier("appEmpCoverService")
    private UpdateService appEmpCoverService;

    @RequestMapping("/uploadCover")
    @ResponseBody
    public String uploadCover(@RequestParam String mm_emp_id, @RequestParam String mm_emp_cover){
        if (StringUtil.isNullOrEmpty(mm_emp_id) || StringUtil.isNullOrEmpty(mm_emp_cover)){
            return toJSONString(ERROR_1);
        }
        Object[] params = new Object[]{mm_emp_id, mm_emp_cover};
        try {
            appEmpCoverService.update(params);
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);

        }
    }

    @Autowired
    @Qualifier("empExcelService")
    private UpdateService empExcelService;

    @RequestMapping(value = "/addCompanyLocation", produces = "text/plain;charset=UTF-8;")
    @ResponseBody
    public String addCompanyLocation(String mm_emp_id,String lat, String lng){
        try {
            //保存用户公司定位数据
            Emp emp = new Emp();
            emp.setMm_emp_id(mm_emp_id);
            emp.setLat_company(lat);
            emp.setLng_company(lng);
            empExcelService.update(emp);
            DataTip tip = new DataTip();
            tip.setData(tip);
            return toJSONString(tip);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }

}
