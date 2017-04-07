package com.liangxunwang.unimanager.mvc.admin;

import com.liangxunwang.unimanager.model.*;
import com.liangxunwang.unimanager.mvc.vo.CountryVO;
import com.liangxunwang.unimanager.query.CityQuery;
import com.liangxunwang.unimanager.query.CountryQuery;
import com.liangxunwang.unimanager.query.HotCityQuery;
import com.liangxunwang.unimanager.query.ProvinceQuery;
import com.liangxunwang.unimanager.service.DeleteService;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.SaveService;
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
@RequestMapping("/hotAreaController")
public class HotAreaController extends ControllerConstants {
    @Autowired
    @Qualifier("hotAreaService")
    private ListService hotAreaService;

    @Autowired
    @Qualifier("hotCityService")
    private ListService hotCityService;

    @Autowired
    @Qualifier("hotAreaService")
    private SaveService hotAreaServiceSave;

    @Autowired
    @Qualifier("hotAreaService")
    private DeleteService hotAreaServiceDelete;

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
        List<CountryVO> list = (List<CountryVO>) hotAreaService.list(query);
        map.put("list", list);
        return "/hotarea/list";
    }

    //添加热门城市
    @RequestMapping("toAdd")
    public String add(ModelMap map, HotCityQuery query){
        //查询地市 热门的
        HotCityQuery cityQuery = new HotCityQuery();
        List<CityObj> listCitys = (List<CityObj>) hotCityService.list(query);

        map.put("listCitys", listCitys);

        return "/hotarea/addhotarea";
    }

    @RequestMapping("addhotarea")
    @ResponseBody
    public String addKefu(HttpSession session,CountryObj cityObj){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        hotAreaServiceSave.save(cityObj);
        //日志记录
        logoService.save(new LogoObj("添加热门县区", manager.getMm_manager_id()));
        return toJSONString(SUCCESS);
    }

    @RequestMapping("delete")
    @ResponseBody
    public String delete(HttpSession session,String id, String area){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        hotAreaServiceDelete.delete(id);
        //日志记录
        logoService.save(new LogoObj("删除热门县区："+ area, manager.getMm_manager_id()));
        return toJSONString(SUCCESS);
    }

}
