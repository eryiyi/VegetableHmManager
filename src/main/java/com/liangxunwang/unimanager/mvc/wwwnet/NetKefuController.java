package com.liangxunwang.unimanager.mvc.wwwnet;

import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.mvc.vo.KefuVO;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.KefuQuery;
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
@RequestMapping("/netKefuController")
public class NetKefuController extends ControllerConstants {

    @Autowired
    @Qualifier("appKefuTelService")
    private ListService appKefuTelService;

    @Autowired
    @Qualifier("appRecordTopService")
    private ListService appRecordTopService;

    @RequestMapping("toKefu")
    public String toKefu(HttpSession session, ModelMap map, KefuQuery query){
        try {
            EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);
            if(emp != null){
                //说明登陆了 ，只需要取本地的
                query.setMm_emp_countryId(emp.getMm_emp_countryId());
            }
            query.setMm_tel_type("0");
            List<KefuVO> list = (List<KefuVO>) appKefuTelService.list(query);
            map.put("list", list);//本地的

            query.setMm_tel_type("1");
            query.setMm_emp_countryId("");
            List<KefuVO> listAll = (List<KefuVO>) appKefuTelService.list(query);
            map.put("listAll", listAll);//全国的

            //查询热点信息
            RecordQuery recordQuery = new RecordQuery();
            recordQuery.setIndex(1);
            recordQuery.setSize(10);
            List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
            map.put("listsHot", listsHot);
            return "../../hmt/kefuCenter";
        }catch (ServiceException e){
            String msg = e.getMessage();
            if (msg.equals("accessTokenNull")){
                return "../../hmt/login";
            }else{
                return "../../hmt/login";
            }
        }
    }

}
