package com.liangxunwang.unimanager.mvc.wwwnet;

import com.liangxunwang.unimanager.model.AdObj;
import com.liangxunwang.unimanager.model.CityObj;
import com.liangxunwang.unimanager.model.CountryObj;
import com.liangxunwang.unimanager.model.ProvinceObj;
import com.liangxunwang.unimanager.model.tip.DataTip;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.*;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.ControllerConstants;
import com.liangxunwang.unimanager.util.Page;
import com.liangxunwang.unimanager.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/hmtIndex")
public class NetIndexController extends ControllerConstants {

    @Autowired
    @Qualifier("webVRecordService")
    private ListService recordService;

    @Autowired
    @Qualifier("provinceService")
    private ListService provinceService;

    @Autowired
    @Qualifier("cityService")
    private ListService cityService;
    @Autowired
    @Qualifier("countryService")
    private ListService countryService;

    @Autowired
    @Qualifier("adObjService")
    private ListService adObjService;

    @Autowired
    @Qualifier("appRecordTopService")
    private ListService appRecordTopService;


    @RequestMapping("toIndex")
    public String toIndex(HttpSession session, ModelMap map, RecordQuery query, Page page,HttpServletRequest request) {
        EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);

        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());
        if(StringUtil.isNullOrEmpty(query.getMm_msg_type())){
            //如果msgtype是空
            query.setMm_msg_type("0");//求购
        }

        if(emp != null){
            //说明已经登陆
            query.setAccessToken(emp.getAccess_token());
            query.setProvinceid(emp.getMm_emp_provinceId());
            query.setCityid(emp.getMm_emp_cityId());
            query.setCountryid(emp.getMm_emp_countryId());

            //当前登陆者的等级vip 0  -- 4
            if(!StringUtil.isNullOrEmpty(emp.getMm_level_num())){
                query.setMm_level_num(emp.getMm_level_num());
            } else {
                query.setMm_level_num("");
            }

            //权限-- 查看全部信息
            if(!StringUtil.isNullOrEmpty(emp.getIs_see_all())){
                query.setIs_see_all(emp.getIs_see_all());
            }else {
                query.setIs_see_all("");
            }

            //是否是选择的县区
            if(!StringUtil.isNullOrEmpty(query.getCountryid())){
                query.setIs_select_countryId(query.getIs_select_countryId());
            }
            if("1".equals(query.getMm_msg_type())){
                //如果是供应的话 要让全部人都看到
                query.setIs_see_all("1");
                query.setCountryid("");
                query.setCityid("");
                query.setProvinceid("");
            }

        }else{
            //说明没有登陆
        }

        try {
            Object[] results = (Object[]) recordService.list(query);
            map.put("list", results[0]);
            long count = (Long) results[1];
            page.setCount(count);
            page.setPageCount(calculatePageCount(query.getSize(), count));
            map.addAttribute("page", page);
            map.addAttribute("query", query);
            map.addAttribute("mm_msg_type", query.getMm_msg_type());
            request.setAttribute("list", results[0]);
        }catch (ServiceException e){
            String msg = e.getMessage();
            if (msg.equals("accessTokenNull")){
                return "../../hmt/login";
            }else{
                return "../../hmt/login";
            }
        }

        if(emp != null){
            //说明已经登陆
            map.put("is_login", "1");
            map.put("emp", emp);
        }else{
            //说明没有登陆
            map.put("is_login", "0");
        }

        //查询广告
//        AdQuery queryad = new AdQuery();
//        queryad.setMm_ad_type("0");
//        List<AdObj> listAd = (List<AdObj>) adObjService.list(queryad);
//        map.put("listAd", listAd);
        //查询热点信息
        RecordQuery recordQuery = new RecordQuery();
        recordQuery.setIndex(1);
        recordQuery.setSize(10);
        List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
        map.put("listsHot", listsHot);

        return "../../hmt/supply";
    }




}
