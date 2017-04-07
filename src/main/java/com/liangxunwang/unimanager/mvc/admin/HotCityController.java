package com.liangxunwang.unimanager.mvc.admin;

import com.liangxunwang.unimanager.model.*;
import com.liangxunwang.unimanager.mvc.vo.CityVO;
import com.liangxunwang.unimanager.mvc.vo.KefuVO;
import com.liangxunwang.unimanager.query.*;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.ControllerConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/hotCityController")
public class HotCityController extends ControllerConstants {
    @Autowired
    @Qualifier("hotCityService")
    private ListService levelService;

    @Autowired
    @Qualifier("hotCityService")
    private SaveService levelServiceSave;

    @Autowired
    @Qualifier("hotCityService")
    private DeleteService levelServiceDelete;

    @Autowired
    @Qualifier("logoService")
    private SaveService logoService;

    @Autowired
    @Qualifier("provinceService")
    private ListService provinceService;

    @Autowired
    @Qualifier("cityService")
    private ListService cityService;
    @Autowired
    @Qualifier("countryService")
    private ListService countryService;

    @RequestMapping("list")
    public String list(HttpSession session,ModelMap map, HotCityQuery query){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        List<CityVO> list = (List<CityVO>) levelService.list(query);
        map.put("list", list);
        return "/hotcity/list";
    }

    //添加热门城市
    @RequestMapping("toAdd")
    public String add(ModelMap map, HotCityQuery query){
        //查询省份
        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);

        map.put("listProvinces", listProvinces);

        return "/hotcity/addhotcity";
    }

    @RequestMapping("addhotcity")
    @ResponseBody
    public String addKefu(HttpSession session,CityObj cityObj){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        levelServiceSave.save(cityObj);
        //日志记录
        logoService.save(new LogoObj("添加热门城市", manager.getMm_manager_id()));
        return toJSONString(SUCCESS);
    }

    @RequestMapping("delete")
    @ResponseBody
    public String delete(HttpSession session,String id, String city){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        levelServiceDelete.delete(id);
        //日志记录
        logoService.save(new LogoObj("删除热门城市："+ city, manager.getMm_manager_id()));
        return toJSONString(SUCCESS);
    }

}
