package com.liangxunwang.unimanager.mvc.webv;

import com.liangxunwang.unimanager.model.AboutUs;
import com.liangxunwang.unimanager.model.FuwuObj;
import com.liangxunwang.unimanager.model.tip.DataTip;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.mvc.vo.FuwuVO;
import com.liangxunwang.unimanager.query.FuwuQuery;
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
@RequestMapping("/webvFuwuCenterController")
public class WebvFuwuCenterController extends ControllerConstants {

    @Autowired
    @Qualifier("appFuwuService")
    private ListService appFuwuService;

    @RequestMapping("toCenter")
    public String toLogin(HttpSession session,ModelMap map,FuwuQuery query ,Page page){
        EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);

        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());

        if(emp == null){
            return "/webv/login";
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
            map.put("mm_fuwu_type", query.getMm_fuwu_type());

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
            return "/webv/fuwu_center";

        }catch (ServiceException e){
            return "/webv/login";
        }

    }



}
