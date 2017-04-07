package com.liangxunwang.unimanager.mvc.admin;

import com.liangxunwang.unimanager.model.*;
import com.liangxunwang.unimanager.mvc.vo.FuwuVO;
import com.liangxunwang.unimanager.query.*;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.ControllerConstants;
import com.liangxunwang.unimanager.util.Page;
import com.liangxunwang.unimanager.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhl on 2015/8/12.
 */
@Controller
@RequestMapping("/fuwu")
public class FuwuController extends ControllerConstants {

    @Autowired
    @Qualifier("fuwuService")
    private ListService levelService;

    @Autowired
    @Qualifier("fuwuService")
    private SaveService levelServiceSave;

    @Autowired
    @Qualifier("fuwuService")
    private ExecuteService levelServiceSaveExe;

    @Autowired
    @Qualifier("fuwuService")
    private UpdateService levelServiceSaveUpdate;

    @Autowired
    @Qualifier("fuwuService")
    private DeleteService levelServiceSaveDel;

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
    public String list(HttpSession session,ModelMap map, FuwuQuery query ,Page page){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);

        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());

        //要根据登录着查询 县区 市  省 只能查看自己的服务列表
        if("1".equals(manager.getMm_manager_type())){
            //县级
            query.setCountryid(manager.getMm_manager_area_uuid());
        }
        if("2".equals(manager.getMm_manager_type())){
            //市级
            query.setCityid(manager.getMm_manager_area_uuid());
        }
        if("3".equals(manager.getMm_manager_type())){
            //省级
            query.setProvinceid(manager.getMm_manager_area_uuid());
        }
        Object[] results = (Object[]) levelService.list(query);
        map.put("list", results[0]);
        long count = (Long) results[1];
        page.setCount(count);
        page.setPageCount(calculatePageCount(query.getSize(), count));
        map.addAttribute("page", page);
        map.addAttribute("query", query);
        //日志记录
        logoService.save(new LogoObj("查看服务列表", manager.getMm_manager_id()));
        return "/fuwu/list";
    }

    @RequestMapping("add")
    public String add(HttpSession session,ModelMap map, FuwuQuery query){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        //查询省份
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);
        map.put("listProvinces", listProvinces);

//        if("0".endsWith(manager.getMm_manager_type()) || "4".endsWith(manager.getMm_manager_type())){
//            //如果是0或者4 说明是顶级管理员 全国性的 都可以看
//            //如果是123 说明是地区管理员，只能设置自己地区的服务
//            ProvinceQuery provinceQuery = new ProvinceQuery();
//            provinceQuery.setIs_use("1");
//            //查询省份
//            List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);
//            //查询地市
//            CityQuery cityQuery = new CityQuery();
//            cityQuery.setIs_use("1");
//            List<CityObj> listCitys = (List<CityObj>) cityService.list(cityQuery);
//            //查询县区
//            CountryQuery countryQuery = new CountryQuery();
//            countryQuery.setIs_use("1");
//            List<CountryObj> listsCountry = (List<CountryObj>) countryService.list(countryQuery);
//            map.put("listProvinces", listProvinces);
//            map.put("listCitys", listCitys);
//            map.put("listsCountry", listsCountry);
//            //查询地市all
//            CityQuery cityQueryAll = new CityQuery();
//            cityQueryAll.setIs_use("1");
//            List<CityObj> listCitysAll = (List<CityObj>) cityService.list(cityQueryAll);
//            //查询县区all
//            CountryQuery countryQueryAll = new CountryQuery();
//            countryQueryAll.setIs_use("1");
//            List<CountryObj> listsCountryAll = (List<CountryObj>) countryService.list(countryQueryAll);
//
//            map.put("listCitysAll", toJSONString(listCitysAll));
//            map.put("listsCountryAll", toJSONString(listsCountryAll));
//        }else {
//            if("1".endsWith(manager.getMm_manager_type())){
//                //县级管理员
//                List<ProvinceObj> listProvinces = new ArrayList<ProvinceObj>();
//                List<CityObj> listCitys = new ArrayList<CityObj>();
//                List<CountryObj> listsCountry = new ArrayList<CountryObj>();
//                map.put("listProvinces", listProvinces);
//                map.put("listCitys", listCitys);
//                map.put("listsCountry", listsCountry);
//
//
//                map.put("listCitysAll", toJSONString(listCitys));
//                map.put("listsCountryAll", toJSONString(listsCountry));
//            }
//            if("2".endsWith(manager.getMm_manager_type())){
//                //市级管理员
//                //查询县区
//                CountryQuery countryQuery = new CountryQuery();
//                countryQuery.setFather(manager.getMm_manager_area_uuid());//市的id
//                List<CountryObj> listsCountry = (List<CountryObj>) countryService.list(countryQuery);//查找这个城市下的县区
//                map.put("listsCountry", listsCountry);
//
//                List<ProvinceObj> listProvinces = new ArrayList<ProvinceObj>();
//                List<CityObj> listCitys = new ArrayList<CityObj>();
//                map.put("listProvinces", listProvinces);
//                map.put("listCitys", listCitys);
//
//
//                map.put("listCitysAll", toJSONString(listCitys));
//                map.put("listsCountryAll", toJSONString(listsCountry));
//            }
//            if("3".endsWith(manager.getMm_manager_type())){
//                //省级管理员
//                //查询地市
//                CityQuery cityQuery = new CityQuery();
//                cityQuery.setFather(manager.getMm_manager_area_uuid());//省份ID
//                List<CityObj> listCitys = (List<CityObj>) cityService.list(cityQuery);//查找这个省份下的市
//                //查询县区
//                CountryQuery countryQuery = new CountryQuery();
//                List<CountryObj> listsCountry = (List<CountryObj>) countryService.list(countryQuery);
//                map.put("listCitys", listCitys);
//                map.put("listsCountry", listsCountry);
//
//                //查询地市all
//                CityQuery cityQueryAll = new CityQuery();
//                List<CityObj> listCitysAll = (List<CityObj>) cityService.list(cityQueryAll);
//                //查询县区all
//                CountryQuery countryQueryAll = new CountryQuery();
//                List<CountryObj> listsCountryAll = (List<CountryObj>) countryService.list(countryQueryAll);
//                map.put("listCitysAll", toJSONString(listCitysAll));
//                map.put("listsCountryAll", toJSONString(listsCountryAll));
//
//
//                List<ProvinceObj> listProvinces = new ArrayList<ProvinceObj>();
//                map.put("listProvinces", listProvinces);
//            }
//        }
        return "/fuwu/addfuwu";
    }

    @RequestMapping("addFuwu")
    @ResponseBody
    public String addPiao(HttpSession session,FuwuObj level){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        if("1".endsWith(manager.getMm_manager_type())){
            //县级
            level.setCountryid(manager.getMm_manager_area_uuid());
        }
        if("2".equals(manager.getMm_manager_type())){
            //市级
            level.setCityid(manager.getMm_manager_area_uuid());
        }
        if("3".equals(manager.getMm_manager_type())){
            //省级
            level.setProvinceid(manager.getMm_manager_area_uuid());
        }
        levelServiceSave.save(level);
        //日志记录
        logoService.save(new LogoObj("添加服务", manager.getMm_manager_id()));
        return toJSONString(SUCCESS);
    }

    @RequestMapping("delete")
    @ResponseBody
    public String delete(HttpSession session,String mm_fuwu_id){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        levelServiceSaveDel.delete(mm_fuwu_id);
        //日志记录
        logoService.save(new LogoObj("删除服务："+mm_fuwu_id, manager.getMm_manager_id()));
        return toJSONString(SUCCESS);
    }

    @RequestMapping("/edit")
    public String toUpdateType(HttpSession session,ModelMap map, String typeId) throws Exception {
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);

        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        //查询省份
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);
//        //查询地市
//        CityQuery cityQuery = new CityQuery();
//        cityQuery.setIs_use("1");
//        List<CityObj> listCitys = (List<CityObj>) cityService.list(cityQuery);
//        //查询县区
//        CountryQuery countryQuery = new CountryQuery();
//        countryQuery.setIs_use("1");
//        List<CountryObj> listsCountry = (List<CountryObj>) countryService.list(countryQuery);
        map.put("listProvinces", listProvinces);
//        map.put("listCitys", listCitys);
//        map.put("listsCountry", listsCountry);
//        //查询地市all
//        CityQuery cityQueryAll = new CityQuery();
//        cityQueryAll.setIs_use("1");
//        List<CityObj> listCitysAll = (List<CityObj>) cityService.list(cityQueryAll);
//        //查询县区all
//        CountryQuery countryQueryAll = new CountryQuery();
//        countryQueryAll.setIs_use("1");
//        List<CountryObj> listsCountryAll = (List<CountryObj>) countryService.list(countryQueryAll);
//
//        map.put("listCitysAll", toJSONString(listCitysAll));
//        map.put("listsCountryAll", toJSONString(listsCountryAll));

        FuwuVO level = (FuwuVO) levelServiceSaveExe.execute(typeId);
        map.put("levelObj", level);
        return "/fuwu/editfuwu";
    }

    /**
     * 更新
     * @param level
     * @return
     */
    @RequestMapping("/editFuwu")
    @ResponseBody
    public String updateGoodsType(HttpSession session,FuwuObj level){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        try {
            levelServiceSaveUpdate.update(level);
            //日志记录
            logoService.save(new LogoObj("编辑服务："+level.getMm_fuwu_nickname(), manager.getMm_manager_id()));
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }



}
