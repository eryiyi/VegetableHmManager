package com.liangxunwang.unimanager.mvc.admin;

import com.liangxunwang.unimanager.model.*;
import com.liangxunwang.unimanager.mvc.vo.KefuVO;
import com.liangxunwang.unimanager.query.CityQuery;
import com.liangxunwang.unimanager.query.CountryQuery;
import com.liangxunwang.unimanager.query.KefuQuery;
import com.liangxunwang.unimanager.query.ProvinceQuery;
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
@RequestMapping("/kefu")
public class KefuController extends ControllerConstants {
    @Autowired
    @Qualifier("kefuTelService")
    private ListService levelService;

    @Autowired
    @Qualifier("kefuTelService")
    private SaveService levelServiceSave;

    @Autowired
    @Qualifier("kefuTelService")
    private UpdateService levelServiceSaveUpdate;

    @Autowired
    @Qualifier("kefuTelService")
    private ExecuteService levelServiceSaveExe;

    @Autowired
    @Qualifier("kefuTelService")
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
    public String list(HttpSession session,ModelMap map, KefuQuery query){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);

        //分地区管理
        if("1".equals(manager.getMm_manager_type())){
            query.setMm_emp_countryId(manager.getMm_manager_area_uuid());
        }
        if("2".equals(manager.getMm_manager_type())) {
            query.setMm_emp_cityId(manager.getMm_manager_area_uuid());
        }
        if("3".equals(manager.getMm_manager_type())){
            query.setMm_emp_provinceId(manager.getMm_manager_area_uuid());
        }

        List<KefuVO> list = (List<KefuVO>) levelService.list(query);
        map.put("list", list);
        return "/kefu/list";
    }

    //添加客服(总管理员)
    @RequestMapping("add")
    public String add(ModelMap map, KefuQuery query){
        //查询省份
        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);

        map.put("listProvinces", listProvinces);

        return "/kefu/addkefu";
    }

    @RequestMapping("addKefu")
    @ResponseBody
    public String addKefu(HttpSession session,KefuTel level){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        levelServiceSave.save(level);
        return toJSONString(SUCCESS);
    }

    //添加客服(地区管理员)
    @RequestMapping("addArea")
    public String addArea(ModelMap map, KefuQuery query){

        return "/kefu/addkefuArea";
    }

    @RequestMapping("addKefuArea")
    @ResponseBody
    public String addKefuArea(HttpSession session,KefuTel level){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        //只有电话和类别，需要省市县

        levelServiceSave.save(level);
        //日志记录
        logoService.save(new LogoObj("添加客服", manager.getMm_manager_id()));
        return toJSONString(SUCCESS);
    }



    @RequestMapping("/edit")
    public String toUpdateType(HttpSession session,ModelMap map, String typeId) throws Exception {
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        KefuVO level = (KefuVO) levelServiceSaveExe.execute(typeId);
        map.put("levelObj", level);
        //查询省份
        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);

        map.put("listProvinces", listProvinces);

        return "/kefu/editkefu";
    }

    /**
     * 更新
     * @param kefuTel
     * @return
     */
    @RequestMapping("/editKefu")
    @ResponseBody
    public String editKefu(HttpSession session,KefuTel kefuTel){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        try {
            levelServiceSaveUpdate.update(kefuTel);
            //日志记录
            logoService.save(new LogoObj("编辑客服："+kefuTel.getMm_tel_id(), manager.getMm_manager_id()));
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }

    @RequestMapping("delete")
    @ResponseBody
    public String delete(HttpSession session,String mm_tel_id, String mm_tel){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        levelServiceDelete.delete(mm_tel_id);
        //日志记录
        logoService.save(new LogoObj("删除客服："+ mm_tel, manager.getMm_manager_id()));
        return toJSONString(SUCCESS);
    }

}
