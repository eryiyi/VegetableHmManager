package com.liangxunwang.unimanager.mvc.admin;

import com.liangxunwang.unimanager.model.Admin;
import com.liangxunwang.unimanager.model.FeiyongObj;
import com.liangxunwang.unimanager.model.LogoObj;
import com.liangxunwang.unimanager.model.Role;
import com.liangxunwang.unimanager.mvc.vo.AdminVO;
import com.liangxunwang.unimanager.query.AdminQuery;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.ControllerConstants;
import com.liangxunwang.unimanager.util.Page;
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
public class AdminEditController extends ControllerConstants {

    @Autowired
    @Qualifier("adminEditService")
    private ExecuteService adminEditService;

    @Autowired
    @Qualifier("adminEditService")
    private UpdateService adminUpdateService;

    @Autowired
    @Qualifier("adminEditService")
    private DeleteService adminServiceDelete;

    @Autowired
    @Qualifier("logoService")
    private SaveService logoService;

    @RequestMapping("/admin/detail")
    public String toUpdateType(HttpSession session,ModelMap map, String id) throws Exception {
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        Object[] results = (Object[]) adminEditService.execute(id);
        if(results != null){
            AdminVO admin = (AdminVO) results[0];
            String permissions = (String) results[1];
            Role role  = (Role) results[2];
            map.put("admin", admin);
            if(role != null){
                map.put("role", role);
            }else {
                map.put("roleRname", "最高管理员");
            }
            map.put("permissions_admin", permissions);
        }
        return "/admin/detail";
    }

    @RequestMapping("/admin/updateType")
    @ResponseBody
    public String updateType(HttpSession session, String mm_manager_id, String mm_manager_is_use , String mm_manager_nickname){
        try {
            Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
            Object[] params = new Object[]{mm_manager_id, mm_manager_is_use};
            //mm_manager_is_use :0 1 是禁止和启动管理员 2是删除管理员
            if("2".equals(mm_manager_is_use)){
                //删除
                adminServiceDelete.delete(mm_manager_id);
            }else {
                //更改管理员状态
                adminUpdateService.update(params);
            }
            //日志记录
            switch (Integer.parseInt(mm_manager_is_use)){
                case 0:
                    logoService.save(new LogoObj("禁用管理员:"+ mm_manager_nickname, manager.getMm_manager_id()));
                    break;
                case 1:
                    logoService.save(new LogoObj("启用管理员:"+ mm_manager_nickname, manager.getMm_manager_id()));
                    break;
                case 2:
                    logoService.save(new LogoObj("删除管理员:"+ mm_manager_nickname, manager.getMm_manager_id()));
                    break;
            }
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }


//    @RequestMapping("/admin/updatePwr")
//    @ResponseBody
//    public String updatePwr(HttpSession session, String mm_manager_id, String mm_manager_password){
//        try {
//            Object[] params = new Object[]{mm_manager_id, mm_manager_password};
//            adminUpdateService.update(params);
//            //日志记录
//            logoService.save(new LogoObj("更新管理员:"+manager.getMm_manager_nickname()+"的状态", manager.getMm_manager_id()));
//            return toJSONString(SUCCESS);
//        }catch (ServiceException e){
//            return toJSONString(ERROR_1);
//        }
//    }

}
