package com.liangxunwang.unimanager.mvc.admin;

import com.liangxunwang.unimanager.model.*;
import com.liangxunwang.unimanager.model.tip.DataTip;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.query.*;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.Constants;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/emp")
public class EmpController extends ControllerConstants {
    @Autowired
    @Qualifier("empService")
    private ListService empServiceList;

    @Autowired
    @Qualifier("empService")
    private UpdateService empServiceUpdate;
    @Autowired
    @Qualifier("empAllService")
    private UpdateService empAllService;

    @Autowired
    @Qualifier("levelService")
    private ListService levelService;

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
    @Qualifier("empService")
    private ExecuteService empServiceExecute;

    @Autowired
    @Qualifier("logoService")
    private SaveService logoService;

    @RequestMapping("list")
    public String list(HttpSession session,ModelMap map, EmpQuery query, Page page){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());
        //分地区管理
        if("1".equals(manager.getMm_manager_type())){
            query.setMm_emp_countryId(manager.getMm_manager_area_uuid());
        }
        if("2".equals(manager.getMm_manager_type())){
            query.setMm_emp_cityId(manager.getMm_manager_area_uuid());
        }
        if("3".equals(manager.getMm_manager_type())){
            query.setMm_emp_provinceId(manager.getMm_manager_area_uuid());
        }

        Object[] results = (Object[]) empServiceList.list(query);
        map.put("list", results[0]);
        long count = (Long) results[1];
        page.setCount(count);
        page.setPageCount(calculatePageCount(query.getSize(), count));
        map.addAttribute("page", page);
        map.addAttribute("query", query);
        //查询等级
        LevelQuery levelQuery = new LevelQuery();
        List<Level> list = (List<Level>) levelService.list(levelQuery);
        map.put("listLevels", list);

        //是否是顶级管理员 0是  1不是  用于页面是否展示操作功能
        if("0".equals(manager.getMm_manager_type()) || "4".equals(manager.getMm_manager_type())){
            map.put("is_manager", "0");
        }else {
            map.put("is_manager", "1");
        }

        //0经营户 1会员 2特殊会员is_special
        map.put("mm_emp_type", query.getMm_emp_type());

        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);
        map.put("listProvinces", listProvinces);

        return "/emp/list";
    }

    @RequestMapping("/detail")
    public String updateType(ModelMap map, HttpSession session, String mm_emp_id) throws Exception {
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        //查看该会员信息
        EmpVO empVO = (EmpVO) empServiceExecute.execute(mm_emp_id);
        //vip星级
        LevelQuery query = new LevelQuery();
        List<Level> list = (List<Level>) levelService.list(query);
        //查询省份
        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);
        //查询地市
//        CityQuery cityQuery = new CityQuery();
//        cityQuery.setFather(empVO.getMm_emp_provinceId());
//        List<CityObj> listCitys = (List<CityObj>) cityService.list(cityQuery);
//        //查询县区
//        CountryQuery countryQuery = new CountryQuery();
//        countryQuery.setFather(empVO.getMm_emp_cityId());
//        List<CountryObj> listsCountry = (List<CountryObj>) countryService.list(countryQuery);
        map.put("listLevels", list);
        map.put("empVO", empVO);
        map.put("listProvinces", listProvinces);
//        map.put("listCitys", listCitys);
//        map.put("listsCountry", listsCountry);


        return "/emp/detail";
    }


//    @RequestMapping("listArea")
//    public String listArea(HttpSession session,ModelMap map, EmpQuery query, Page page){
//        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
//        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
//        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());
//        //分地区管理
//        if("1".equals(manager.getMm_manager_type())){
//            query.setMm_emp_countryId(manager.getMm_manager_area_uuid());
//        }
//        if("2".equals(manager.getMm_manager_type())){
//            query.setMm_emp_cityId(manager.getMm_manager_area_uuid());
//        }
//        if("3".equals(manager.getMm_manager_type())){
//            query.setMm_emp_provinceId(manager.getMm_manager_area_uuid());
//        }
//
//        Object[] results = (Object[]) empServiceList.list(query);
//        map.put("list", results[0]);
//        long count = (Long) results[1];
//        page.setCount(count);
//        page.setPageCount(calculatePageCount(query.getSize(), count));
//        map.addAttribute("page", page);
//        map.addAttribute("query", query);
//        //查询等级
//        LevelQuery levelQuery = new LevelQuery();
//        List<Level> list = (List<Level>) levelService.list(levelQuery);
//        map.put("listLevels", list);
//
//        //是否是顶级管理员 0是  1不是  用于页面是否展示操作功能
//        if("0".equals(manager.getMm_manager_type()) || "4".equals(manager.getMm_manager_type())){
//            map.put("is_manager", "0");
//        }else {
//            map.put("is_manager", "1");
//        }
//
//        ProvinceQuery provinceQuery = new ProvinceQuery();
//        provinceQuery.setIs_use("1");
//        //查询省份
//        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);
//        //查询地市
//        CityQuery cityQuery = new CityQuery();
//        cityQuery.setIs_use("1");
//        List<CityObj> listCitys = (List<CityObj>) cityService.list(cityQuery);
//        //查询县区
//        CountryQuery countryQuery = new CountryQuery();
//        countryQuery.setIs_use("1");
//        List<CountryObj> listsCountry = (List<CountryObj>) countryService.list(countryQuery);
//        map.put("listProvinces", listProvinces);
//        map.put("listCitys", listCitys);
//        map.put("listsCountry", listsCountry);
//
//
//        //0经营户 1会员
//        map.put("mm_emp_type", query.getMm_emp_type());
//
//        return "/emp/listArea";
//    }

    //更改会员数据1
    @RequestMapping("/updateEmp")
    @ResponseBody
    public String updateEmp( HttpSession session, Emp emp){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        try {
            empAllService.update(emp);
            //日志记录
            logoService.save(new LogoObj("更新会员:："+emp.getMm_emp_mobile()+"的信息", manager.getMm_manager_id()));
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }

    //管理员--添加管理员-搜索会员
    @RequestMapping("listAddManager")
    public String listAddManager(HttpSession session,ModelMap map, EmpQuery query, Page page){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());
        //分地区管理
        if("1".equals(manager.getMm_manager_type())){
            query.setMm_emp_countryId(manager.getMm_manager_area_uuid());
        }
        if("2".equals(manager.getMm_manager_type())){
            query.setMm_emp_cityId(manager.getMm_manager_area_uuid());
        }
        if("3".equals(manager.getMm_manager_type())){
            query.setMm_emp_provinceId(manager.getMm_manager_area_uuid());
        }

        Object[] results = (Object[]) empServiceList.list(query);
        map.put("list", results[0]);
        long count = (Long) results[1];
        page.setCount(count);
        page.setPageCount(calculatePageCount(query.getSize(), count));
        map.addAttribute("page", page);
        map.addAttribute("query", query);
        //查询等级
        LevelQuery levelQuery = new LevelQuery();
        List<Level> list = (List<Level>) levelService.list(levelQuery);
        map.put("listLevels", list);

        return "/admin/add_list";
    }


    @Autowired
    @Qualifier("roleService")
    private ListService roleService;

    //管理员--添加管理员-搜索会员详情
    @RequestMapping("/listAddManager/detail")
    public String listAddManagerDetail(ModelMap map, HttpSession session, String mm_emp_id) throws Exception {
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        //查看该会员信息
        EmpVO empVO = (EmpVO) empServiceExecute.execute(mm_emp_id);
        //vip星级
        LevelQuery query = new LevelQuery();
        List<Level> list = (List<Level>) levelService.list(query);

        map.put("listLevels", list);
        map.put("empVO", empVO);
        //管理员类型  需要判断管理员类型是省市县还是全国
        //当前管理员类型
//        默认0顶级管理员
//        1是县级
//        2是市级
//        3是省级
//        4是全国

        //角色
        List<Role> roles = (List<Role>) roleService.list("");
        List<Role> listRoles = new ArrayList<Role>();
        List<ManagerTypeObj>  managerTypes = new ArrayList<ManagerTypeObj>();
        if("1".equals(manager.getMm_manager_type())){
           //县级
            managerTypes.add(new ManagerTypeObj("1", "县级"));
            for (Role role:roles){
                if(role != null && "1".equals(role.getType())){
                    listRoles.add(role);
                }
            }
        }
        if("2".equals(manager.getMm_manager_type())){
            //市级
            managerTypes.add(new ManagerTypeObj("1", "县级"));
            managerTypes.add(new ManagerTypeObj("2", "市级"));
            for (Role role:roles){
                if("1".equals(role.getType()) || "2".equals(role.getType())){
                    listRoles.add(role);
                }
            }
        }
        if("3".equals(manager.getMm_manager_type())){
            //省级
            managerTypes.add(new ManagerTypeObj("1", "县级"));
            managerTypes.add(new ManagerTypeObj("2", "市级"));
            managerTypes.add(new ManagerTypeObj("3", "省级"));
            for (Role role:roles){
                if("1".equals(role.getType()) || "2".equals(role.getType()) || "3".equals(role.getType())){
                    listRoles.add(role);
                }
            }
        }
        if("0".equals(manager.getMm_manager_type()) || "4".equals(manager.getMm_manager_type())){
            //全国
            managerTypes.add(new ManagerTypeObj("1", "县级"));
            managerTypes.add(new ManagerTypeObj("2", "市级"));
            managerTypes.add(new ManagerTypeObj("3", "省级"));
            managerTypes.add(new ManagerTypeObj("4", "全国"));
            listRoles.addAll(roles);
        }
        map.put("roles", listRoles);//过滤角色 县级管理员只能选择县级角色 市级管理员只能选择市级角色 以此类推
        map.put("managerTypes", managerTypes);
        return "/admin/add_detail";
    }

    @Autowired
    @Qualifier("empRegisterService")
    private SaveService empRegisterService;

    /**
     * 注册功能
     * @param member  会员对象
     * @return
     */
    @RequestMapping("/empReg")
    @ResponseBody
    public String empReg(Emp member){
        try {
            empRegisterService.save(member);
        }catch (ServiceException e){
            String msg = e.getMessage();
            if (msg.equals("MobileIsUse")){
                return toJSONString(ERROR_2);
            }
            if (msg.equals(Constants.SAVE_ERROR)){
                return toJSONString(ERROR_1);
            }

        }
        return toJSONString(SUCCESS);
    }

    @RequestMapping("/toReg")
    public String toReg(ModelMap map, HttpSession session, String mm_emp_id){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        //vip星级
        LevelQuery query = new LevelQuery();
        List<Level> list = (List<Level>) levelService.list(query);
        //查询省份
        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        provinceQuery.setMm_emp_provinceId(manager.getMm_manager_area_uuid());
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);
        //查询地市
//        CityQuery cityQuery = new CityQuery();
//        cityQuery.setIs_use("1");
//        List<CityObj> listCitys = (List<CityObj>) cityService.list(cityQuery);
        //查询县区
//        CountryQuery countryQuery = new CountryQuery();
//        countryQuery.setIs_use("1");
//        List<CountryObj> listsCountry = (List<CountryObj>) countryService.list(countryQuery);
        map.put("listLevels", list);
        map.put("listProvinces", listProvinces);
//        map.put("listCitys", listCitys);
//        map.put("listsCountry", listsCountry);

        return "/emp/addEmp";
    }


    @RequestMapping("/toUpdatePwr")
    public String toUpdatePwr(ModelMap map, HttpSession session, String mm_emp_id) throws Exception {
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        //查看该会员信息
        EmpVO empVO = (EmpVO) empServiceExecute.execute(mm_emp_id);
        map.put("empVO", empVO);
        return "/emp/updatePwr";
    }


    //更改会员数据--密码
    @RequestMapping("/updateEmpPwr")
    @ResponseBody
    public String updateEmpPwr( HttpSession session, Emp emp){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        try {
            empServiceUpdate.update(emp);
            //日志记录
            logoService.save(new LogoObj("更新会员密码："+emp.getMm_emp_nickname()+"的信息", manager.getMm_manager_id()));
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }

    @Autowired
    @Qualifier("empExcelService")
    private ExecuteService empExcelService;

    //导出Excel表格数据
    @RequestMapping("daochuAll")
    @ResponseBody
    public String daochuAll(HttpSession session,String ids, HttpServletRequest request) {
        try {
            Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
            Object[] objects = new Object[2];
            objects[0]=ids;
            objects[1]=request;
            String fileName = (String) empExcelService.execute(objects);

            //日志记录
            logoService.save(new LogoObj("导出excel用户表", manager.getMm_manager_id()));

            DataTip tip = new DataTip();
            tip.setData(fileName);
            return toJSONString(tip);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toJSONString(ERROR_1);
    }

    @Autowired
    @Qualifier("empPshenheService")
    private ExecuteService empPshenheService;

    //批量处理用户--未审0 审核1 未通过2
    @RequestMapping("pShenheAction")
    @ResponseBody
    public String pShenheAction(HttpSession session,String ids,String type) {
        try {
            Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
            Object[] objectses = new Object[2];
            objectses[0]=ids;
            objectses[1]=type;
            empPshenheService.execute(objectses);
            //日志记录
            logoService.save(new LogoObj("批量处理用户数据_审核权限："+ids, manager.getMm_manager_id()));
            return toJSONString(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toJSONString(ERROR_1);
    }


    @Autowired
    @Qualifier("empPLoginService")
    private ExecuteService empPLoginService;
    //批量处理用户--允许登陆0 不允许登陆1
    @RequestMapping("pLoginAction")
    @ResponseBody
    public String pLoginAction(HttpSession session,String ids,String type) {
        try {
            Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
            Object[] objectses = new Object[2];
            objectses[0]=ids;
            objectses[1]=type;
            empPLoginService.execute(objectses);
            //日志记录
            logoService.save(new LogoObj("批量处理用户数据_登陆权限："+ids, manager.getMm_manager_id()));
            return toJSONString(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toJSONString(ERROR_1);
    }

    @Autowired
    @Qualifier("empFabugyService")
    private ExecuteService empFabugyService;

    //批量处理用户--不允许发布供应0 允许发布供应1
    @RequestMapping("pFabugyAction")
    @ResponseBody
    public String pFabugyAction(HttpSession session,String ids,String type) {
        try {
            Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
            Object[] objectses = new Object[2];
            objectses[0]=ids;
            objectses[1]=type;
            empFabugyService.execute(objectses);
            //日志记录
            logoService.save(new LogoObj("批量处理用户数据_发布供应权限："+ids, manager.getMm_manager_id()));
            return toJSONString(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toJSONString(ERROR_1);
    }

    @Autowired
    @Qualifier("empFabuqgService")
    private ExecuteService empFabuqgService;

    //批量处理用户--不允许发布求购0 允许发布求购1
    @RequestMapping("pFabuqgAction")
    @ResponseBody
    public String pFabuqgAction(HttpSession session,String ids,String type) {
        try {
            Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
            Object[] objectses = new Object[2];
            objectses[0]=ids;
            objectses[1]=type;
            empFabuqgService.execute(objectses);
            //日志记录
            logoService.save(new LogoObj("批量处理用户数据_发布求购权限："+ids, manager.getMm_manager_id()));
            return toJSONString(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toJSONString(ERROR_1);
    }

    @RequestMapping("/toPaihang")
    public String toPaihang(ModelMap map, HttpSession session, String mm_emp_id) throws Exception {
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        //查看该会员信息
        EmpVO empVO = (EmpVO) empServiceExecute.execute(mm_emp_id);
        map.put("empVO", empVO);
        return "/paihang/addpaihang";
    }

    //-------------------每天凌晨执行，查询是否有过期的vip会员--------------------------
    public String update(){
        updateEmpVipGuoqi();
        return null;
    }
    //--------每天凌晨执行，查询是否有即将到期的VIP会员-----------
    public String noticeVipEndThree(){
        updateEmpVipThree();
        return null;
    }

    @Autowired
    @Qualifier("empUpdateVipService")
    private UpdateService empUpdateVipService;

    @RequestMapping("/updateEmpVipGuoqi")
    @ResponseBody
    public String updateEmpVipGuoqi(){
        try {
            empUpdateVipService.update("");
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }


    @Autowired
    @Qualifier("empVipEndThreeService")
    private ListService empVipEndThreeService;

    @RequestMapping("/updateEmpVipThree")
    @ResponseBody
    public String updateEmpVipThree(){
        try {
            //查询即将到期的会员--3天之内的
            empVipEndThreeService.list("");
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }
    //-------------------------------------------------

    @Autowired
    @Qualifier("empPDeleteEmpService")
    private ExecuteService empPDeleteEmpService;
    //批量删除用户
    @RequestMapping("pDeleteEmpAction")
    @ResponseBody
    public String pDeleteEmpAction(HttpSession session,String ids) {
        try {
            Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
            empPDeleteEmpService.execute(ids);
            //日志记录
            logoService.save(new LogoObj("批量删除用户："+ids, manager.getMm_manager_id()));
            return toJSONString(SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toJSONString(ERROR_1);
    }


    @Autowired
    @Qualifier("empFabuNoticeService")
    private ExecuteService empFabuNoticeService;
    //批量给用户发布到期通知
    @RequestMapping("pFabuNoticeAction")
    @ResponseBody
    public String pFabuNoticeAction(HttpSession session,String ids) {
        try {
            Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
            if(manager != null){
                Object[] objects = new Object[2];
                objects[0]=ids;
                objects[1]= manager.getMm_manager_id();
                empFabuNoticeService.execute(objects);
                //日志记录
                logoService.save(new LogoObj("批量发布到期通知："+ids, manager.getMm_manager_id()));
                return toJSONString(SUCCESS);
            }else {
                return toJSONString(ERROR_1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return toJSONString(ERROR_1);
    }

    @Autowired
    @Qualifier("empLoginNumService")
    private ListService empLoginNumService;
    //查询用户活跃度
    @RequestMapping("/getEmpLoginNumber")
    public String getEmpLoginNumber(ModelMap map, HttpSession session, EmpLoginNumQuery query, Page page) throws Exception {
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());
        Object[] results = (Object[]) empLoginNumService.list(query);
        map.put("list", results[0]);
        long count = (Long) results[1];
        page.setCount(count);
        page.setPageCount(calculatePageCount(query.getSize(), count));
        map.addAttribute("page", page);
        map.addAttribute("query", query);
        return "/loginNum/list";
    }


    //查询用户活跃度统计
    @Autowired
    @Qualifier("empLoginNumListService")
    private ListService empLoginNumListService;
    @RequestMapping("/getEmpNum")
    public String getEmpNum(ModelMap map, HttpSession session, EmpNumQuery query, Page page) throws Exception {
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());
        Object[] results = (Object[]) empLoginNumListService.list(query);
        map.put("list", results[0]);
        long count = (Long) results[1];
        page.setCount(count);
        page.setPageCount(calculatePageCount(query.getSize(), count));
        map.addAttribute("page", page);
        map.addAttribute("query", query);

        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        //查询省份
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);

        map.put("listProvinces", listProvinces);

        return "/loginNum/listNum";
    }
}
