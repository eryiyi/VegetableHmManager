package com.liangxunwang.unimanager.mvc.webv;

import com.liangxunwang.unimanager.model.*;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.query.CityQuery;
import com.liangxunwang.unimanager.query.CountryQuery;
import com.liangxunwang.unimanager.query.EmpQuery;
import com.liangxunwang.unimanager.query.ProvinceQuery;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.SaveService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by zhl on 2015/8/12.
 */
@Controller
@RequestMapping("/webvRegController")
public class WebvRegController extends ControllerConstants {
    @Autowired
    @Qualifier("appProvinceService")
    private ListService appProvinceService;

    @Autowired
    @Qualifier("cityService")
    private ListService cityService;
    @Autowired
    @Qualifier("countryService")
    private ListService countryService;

    @RequestMapping("toReg")
    public String toReg(ModelMap map){
        //查询省份
        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) appProvinceService.list(provinceQuery);
        map.put("listProvinces", listProvinces);
        return "/webv/reg";
    }

    @Autowired
    @Qualifier("webProfileService")
    private SaveService webProfileService;

    @RequestMapping("/empReg")
    @ResponseBody
    public String empReg(Emp member){
        try {
            webProfileService.save(member);
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            String msg = e.getMessage();
            if (msg.equals("MobileIsUse")){
                return toJSONString(ERROR_2);
            }else if (msg.equals(Constants.SAVE_ERROR)){
                return toJSONString(ERROR_1);
            }else if(msg.equals("CardIsUse")){
                return toJSONString(ERROR_3);
            }
            else{
                return toJSONString(ERROR_1);
            }
        }

    }


}
