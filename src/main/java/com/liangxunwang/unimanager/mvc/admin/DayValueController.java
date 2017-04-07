package com.liangxunwang.unimanager.mvc.admin;

import com.liangxunwang.unimanager.model.Admin;
import com.liangxunwang.unimanager.model.DayValueObj;
import com.liangxunwang.unimanager.model.LogoObj;
import com.liangxunwang.unimanager.model.NearbyDistanceObj;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.SaveService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.service.UpdateService;
import com.liangxunwang.unimanager.util.ControllerConstants;
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
@RequestMapping("/dayValueController")
public class DayValueController extends ControllerConstants {

    @Autowired
    @Qualifier("dayValueObjService")
    private ListService nearbyDistanceObjServiceList;

    @Autowired
    @Qualifier("dayValueObjService")
    private SaveService nearbyDistanceObjServiceSave;

    @Autowired
    @Qualifier("dayValueObjService")
    private UpdateService nearbyDistanceObjServiceUpdate;

    @Autowired
    @Qualifier("logoService")
    private SaveService logoService;


    @RequestMapping("toUpdate")
    public String add(ModelMap map){
        List<DayValueObj> list = (List<DayValueObj>) nearbyDistanceObjServiceList.list("");
       if(list != null && list.size() > 0){
           map.put("aboutUs", list.get(0));
       }
        return "/dayvalue/update";
    }

    @RequestMapping("update")
    @ResponseBody
    public String addAboutUs(HttpSession session,DayValueObj aboutUs){
            //需要跟新
            Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
            try {
                nearbyDistanceObjServiceUpdate.update(aboutUs);
                //日志记录
                logoService.save(new LogoObj("更新控制信息展示的天数", manager.getMm_manager_id()));
                return toJSONString(SUCCESS);
            }catch (ServiceException e){
                return toJSONString(ERROR_1);
            }
    }


}
