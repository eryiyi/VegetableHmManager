package com.liangxunwang.unimanager.mvc.wwwnet;

import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.NearbyQuery;
import com.liangxunwang.unimanager.query.RecordQuery;
import com.liangxunwang.unimanager.service.ListService;
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
@RequestMapping("/netNearbyController")
public class NetNearbyController extends ControllerConstants {

    @Autowired
    @Qualifier("appEmpService")
    private ListService appEmpServiceList;

    @Autowired
    @Qualifier("appRecordTopService")
    private ListService appRecordTopService;

    @RequestMapping("nearby")
    public String nearby(HttpSession session, ModelMap map ,NearbyQuery query, Page page){
        EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);
        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());

        if(emp == null){
            return "../../hmt/login";
        }else{
            Object[] results = (Object[]) appEmpServiceList.list(query);
            map.put("list", results[0]);
            long count = (Long) results[1];
            page.setCount(count);
            page.setPageCount(calculatePageCount(query.getSize(), count));
            map.addAttribute("page", page);
            map.addAttribute("query", query);

            map.put("is_login", "1");
            map.put("emp", emp);
            //查询热点信息
            RecordQuery recordQuery = new RecordQuery();
            recordQuery.setIndex(1);
            recordQuery.setSize(10);
            List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
            map.put("listsHot", listsHot);

            return "../../hmt/nearby";
        }

    }

}
