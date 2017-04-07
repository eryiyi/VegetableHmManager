package com.liangxunwang.unimanager.mvc.webv;

import com.liangxunwang.unimanager.model.AdObj;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.query.AdQuery;
import com.liangxunwang.unimanager.query.PaihangQuery;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.ControllerConstants;
import com.liangxunwang.unimanager.util.Page;
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
@RequestMapping("/webvShangquanController")
public class WebvShangquanController extends ControllerConstants {

    @RequestMapping("toShangquan")
    public String toTop(HttpSession session, ModelMap map, PaihangQuery query, Page page){
        EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);
        if(emp != null){
            //说明已经登陆
            map.put("is_login", "1");
            map.put("emp", emp);
        }else{
            //说明没有登陆
            map.put("is_login", "0");
        }
        return "/webv/shangquan";
    }

}
