package com.liangxunwang.unimanager.mvc.webv;

import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.query.FuwuQuery;
import com.liangxunwang.unimanager.service.ExecuteService;
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

/**
 * Created by zhl on 2015/8/12.
 */
@Controller
public class WebvEmpController extends ControllerConstants {
    @Autowired
    @Qualifier("empService")
    private ExecuteService empService;

    @RequestMapping(value = "/toShareMp",  produces = "text/plain;charset=UTF-8;")
    public String toShareMp(ModelMap map,String mm_emp_id) {
        //根据id查询明信片
        try {
            EmpVO empVO = (EmpVO) empService.execute(mm_emp_id);
            map.put("empVO", empVO);
            return "/webv/mingpianshare";
        }catch (Exception e) {
            return toJSONString(ERROR_1);
        }
    }

}
