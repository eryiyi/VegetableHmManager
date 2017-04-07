package com.liangxunwang.unimanager.mvc.wwwnet;

import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.mvc.vo.FavourVO;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.FavourQuery;
import com.liangxunwang.unimanager.query.RecordQuery;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.ControllerConstants;
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
@RequestMapping("/netMineFavourController")
public class NetMineFavourController extends ControllerConstants {
    @Autowired
    @Qualifier("appFavourService")
    private ListService appFavourService;

    @Autowired
    @Qualifier("appRecordTopService")
    private ListService appRecordTopService;


    @RequestMapping("favour")
    public String favour(FavourQuery query,HttpSession session, ModelMap map){
        EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);
        if(emp == null){
            return "../../hmt/login";
        }else
            query.setAccessToken(emp.getAccess_token()==null?"":emp.getAccess_token());
            map.put("is_login", "1");
            map.put("emp", emp);
        query.setMm_emp_id(emp.getMm_emp_id());
        try {
            List<FavourVO> list = (List<FavourVO>) appFavourService.list(query);
            map.put("list", list);
            //查询热点信息
            RecordQuery recordQuery = new RecordQuery();
            recordQuery.setIndex(1);
            recordQuery.setSize(10);
            List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
            map.put("listsHot", listsHot);

            return "../../hmt/favour";
        }catch (ServiceException e){
            return "../../hmt/login";
        }


    }



}
