package com.liangxunwang.unimanager.mvc.wwwnet;

import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.FuwuQuery;
import com.liangxunwang.unimanager.query.RecordQuery;
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
@RequestMapping("/netFuwuCenterController")
public class NetFuwuCenterController extends ControllerConstants {
    @Autowired
    @Qualifier("appFuwuService")
    private ListService appFuwuService;

    @Autowired
    @Qualifier("appRecordTopService")
    private ListService appRecordTopService;

    @RequestMapping("toCenter")
    public String toLogin(HttpSession session,ModelMap map,FuwuQuery query ,Page page){
        EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);

        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());

        if(emp == null){
            return "../../hmt/login";
        }else
        query.setAccessToken(emp.getAccess_token());
        try {
            Object[] results = (Object[]) appFuwuService.list(query);
            map.put("list", results[0]);
            long count = (Long) results[1];
            page.setCount(count);
            page.setPageCount(calculatePageCount(query.getSize(), count));
            map.addAttribute("page", page);
            map.addAttribute("query", query);

            switch (Integer.parseInt(query.getMm_fuwu_type())){
                case 0:
                    //商店
                    map.put("name", "商店");
                    break;
                case 1:
                    //装车工人
                    map.put("name", "装车工人");
                    break;
                case 2:
                    //物流中心
                    map.put("name", "物流中心");
                    break;
                case 3:
                    //嫁接
                    map.put("name", "嫁接团队");
                    break;
                case 4:
                    //吊车服务
                    map.put("name", "吊车服务");
                    break;

            }

            //查询热点信息
            RecordQuery recordQuery = new RecordQuery();
            recordQuery.setIndex(1);
            recordQuery.setSize(10);
            List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
            map.put("listsHot", listsHot);

            return "../../hmt/fuwuCenter";
        }catch (ServiceException e){
            return "../../hmt/login";
        }
    }

}
