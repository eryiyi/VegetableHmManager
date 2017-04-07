package com.liangxunwang.unimanager.mvc.wwwnet;

import com.liangxunwang.unimanager.model.Record;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.service.SaveService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.Constants;
import com.liangxunwang.unimanager.util.ControllerConstants;
import com.liangxunwang.unimanager.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by zhl on 2015/8/12.
 */
@Controller
@RequestMapping("/netAddRecordController")
public class NetAddRecordController extends ControllerConstants {

    @RequestMapping("toAddRecord")
    public String toAddRecord( ModelMap map, HttpSession session){
        EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);
        if(emp == null){
            return "../../hmt/login";
        }else{
            map.put("emp", emp);
            map.addAttribute("server_url", Constants.URL);
            return "../../hmt/addRecord";
        }
    }

    @Autowired
    @Qualifier("appRecordService")
    private SaveService recordSaveService;

    @RequestMapping("/addRecord")
    @ResponseBody
    public String addRecord(HttpSession session, Record record, String ad_1,String ad_2,String ad_3,String ad_4,String ad_5,String ad_6,String ad_7,String ad_8,String ad_9){
        try {
            EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);
            if(emp != null && !StringUtil.isNullOrEmpty(emp.getMm_emp_id())){
                record.setMm_emp_id(emp.getMm_emp_id());
                record.setAccessToken(emp.getAccess_token());
                record.setMm_emp_msg_num(emp.getMm_emp_msg_num());
                record.setProvinceid(emp.getMm_emp_provinceId());
                record.setCityid(emp.getMm_emp_cityId());
                record.setCountryid(emp.getMm_emp_countryId());
                String picurl = "";
                if(!StringUtil.isNullOrEmpty(ad_1)){
                    picurl += ad_1;
                }
                if(!StringUtil.isNullOrEmpty(ad_2)){
                    if(StringUtil.isNullOrEmpty(picurl)){
                        //如果picurl是空的
                        picurl += ad_2;
                    }else {
                        picurl +="," + ad_2;
                    }
                }
                if(!StringUtil.isNullOrEmpty(ad_3)){
                    if(StringUtil.isNullOrEmpty(picurl)){
                        picurl += ad_3;
                    }else {
                        picurl +="," + ad_3;
                    }
                }
                if(!StringUtil.isNullOrEmpty(ad_4)){
                    if(StringUtil.isNullOrEmpty(picurl)){
                        picurl += ad_4;
                    }else {
                        picurl +="," + ad_4;
                    }
                }
                if(!StringUtil.isNullOrEmpty(ad_5)){

                    if(StringUtil.isNullOrEmpty(picurl)){
                        picurl += ad_5;
                    }else {
                        picurl +="," + ad_5;
                    }
                }
                if(!StringUtil.isNullOrEmpty(ad_6)){
                    if(StringUtil.isNullOrEmpty(picurl)){
                        picurl += ad_6;
                    }else {
                        picurl +="," + ad_6;
                    }
                }
                if(!StringUtil.isNullOrEmpty(ad_7)){

                    if(StringUtil.isNullOrEmpty(picurl)){
                        picurl += ad_7;
                    }else {
                        picurl +="," + ad_7;
                    }
                }
                if(!StringUtil.isNullOrEmpty(ad_8)){
                    if(StringUtil.isNullOrEmpty(picurl)){
                        picurl += ad_8;
                    }else {
                        picurl +="," + ad_8;
                    }
                }
                if(!StringUtil.isNullOrEmpty(ad_9)){
                    if(StringUtil.isNullOrEmpty(picurl)){
                        picurl += ad_9;
                    }else {
                        picurl +="," + ad_9;
                    }
                }
                record.setMm_msg_picurl(picurl);
                recordSaveService.save(record);//保存信息
                return toJSONString(SUCCESS);
            }else {
                return toJSONString(ERROR_9);
            }

        }catch (ServiceException e){
            if (e.getMessage().equals("HAS_PUBLISH")){
                return toJSONString(ERROR_2);
            }else if(e.getMessage().equals("HAS_FULL")){
                return toJSONString(ERROR_3);
            }else if(e.getMessage().equals("accessTokenNull")){
                return toJSONString(ERROR_9);
            }
            else{
                return toJSONString(ERROR_1);
            }
        }
    }

}
