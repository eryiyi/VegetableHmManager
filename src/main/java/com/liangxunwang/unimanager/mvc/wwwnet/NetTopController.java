package com.liangxunwang.unimanager.mvc.wwwnet;

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
@RequestMapping("/netTopController")
public class NetTopController extends ControllerConstants {

    @Autowired
    @Qualifier("paihangService")
    private ListService paihangService;

    @Autowired
    @Qualifier("adObjService")
    private ListService adObjService;

    @RequestMapping("toTop")
    public String toTop(HttpSession session, ModelMap map, PaihangQuery query, Page page){
        EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);
        query.setIs_del("0");
        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());

        try {
            Object[] results = (Object[]) paihangService.list(query);
            map.put("list", results[0]);
            long count = (Long) results[1];
            page.setCount(count);
            page.setPageCount(calculatePageCount(query.getSize(), count));
            map.addAttribute("page", page);
            map.addAttribute("query", query);

            if(emp != null){
                //说明已经登陆
                map.put("is_login", "1");
                map.put("emp", emp);
            }else{
                //说明没有登陆
                map.put("is_login", "0");
            }
            //查询广告
//            AdQuery queryad = new AdQuery();
//            queryad.setMm_ad_type("1");
//            List<AdObj> listAd = (List<AdObj>) adObjService.list(queryad);
//            map.put("listAd", listAd);
            return "../../hmt/top";
        }catch (ServiceException e){
            String msg = e.getMessage();
            if (msg.equals("accessTokenNull")){
                return "../../hmt/login";
            }else{
                return "../../hmt/login";
            }
        }
//
    }

}
