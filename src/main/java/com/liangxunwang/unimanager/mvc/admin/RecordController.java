package com.liangxunwang.unimanager.mvc.admin;

import com.liangxunwang.unimanager.model.*;
import com.liangxunwang.unimanager.model.tip.DataTip;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.CityQuery;
import com.liangxunwang.unimanager.query.CountryQuery;
import com.liangxunwang.unimanager.query.ProvinceQuery;
import com.liangxunwang.unimanager.query.RecordQuery;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by zhl on 2015/8/12.
 */
@Controller
@RequestMapping("/record")
public class RecordController extends ControllerConstants {
    @Autowired
    @Qualifier("recordService")
    private ListService recordService;
    @Autowired
    @Qualifier("logoService")
    private SaveService logoService;

    @Autowired
    @Qualifier("recordService")
    private DeleteService recordServiceDele;


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
    @Qualifier("recordService")
    private ExecuteService recordServiceExer;

    @Autowired
    @Qualifier("recordService")
    private UpdateService recordServiceUpdate;

    @RequestMapping("listQiugou")
    public String listQiugou(HttpSession session,ModelMap map, RecordQuery query, Page page){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());
        query.setMm_msg_type("0");

        //根据后台管理者类别定义查询范围
//        默认0顶级管理员
//        1是县级
//        2是市级
//        3是省级
//        4是全国
        switch (Integer.parseInt(manager.getMm_manager_type())){
            case 1:
                    query.setMm_emp_countryId(manager.getMm_manager_area_uuid());
                break;
            case 2:
                    query.setMm_emp_cityId(manager.getMm_manager_area_uuid());
                break;
            case 3:
                    query.setMm_emp_provinceId(manager.getMm_manager_area_uuid());
                break;
            case 0:
            case 4:
                break;
        }

        Object[] results = (Object[]) recordService.list(query);
        map.put("list", results[0]);
        long count = (Long) results[1];
        page.setCount(count);
        page.setPageCount(calculatePageCount(query.getSize(), count));
        map.addAttribute("page", page);
        map.addAttribute("query", query);
        map.addAttribute("mm_msg_type", "0");
        //日志记录
        logoService.save(new LogoObj("查看求购信息", manager.getMm_manager_id()));

        //查询省份
        ProvinceQuery provinceQuery = new ProvinceQuery();
        provinceQuery.setIs_use("1");
        List<ProvinceObj> listProvinces = (List<ProvinceObj>) provinceService.list(provinceQuery);

        map.put("listProvinces", listProvinces);

        return "record/list";
    }
    @RequestMapping("listGongying")
    public String listGongying(HttpSession session,ModelMap map, RecordQuery query, Page page){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());
        query.setMm_msg_type("1");

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

        Object[] results = (Object[]) recordService.list(query);
        map.put("list", results[0]);
        long count = (Long) results[1];
        page.setCount(count);
        page.setPageCount(calculatePageCount(query.getSize(), count));
        map.addAttribute("page", page);
        map.addAttribute("query", query);
        map.addAttribute("mm_msg_type", "1");
        //日志记录
        logoService.save(new LogoObj("查看供应信息", manager.getMm_manager_id()));
        return "record/list";
    }

    @RequestMapping("delete")
    @ResponseBody
    public String delete(HttpSession session,String mm_msg_id){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        recordServiceDele.delete(mm_msg_id);
        //日志记录
        logoService.save(new LogoObj("删除发布的信息："+mm_msg_id, manager.getMm_manager_id()));
        return toJSONString(SUCCESS);
    }


    @RequestMapping("toDetail")
    public String add(ModelMap map, String mm_msg_id) throws Exception {
        RecordVO recordVO = (RecordVO) recordServiceExer.execute(mm_msg_id);
        map.put("recordVO", recordVO);
        //处理图片
        if(!StringUtil.isNullOrEmpty(recordVO.getMm_msg_picurl())){
            String[] arrPics = recordVO.getMm_msg_picurl().split(",");
            map.put("arrPics", arrPics);
        }
        return "/record/detail";
    }

    //更改数据
    @RequestMapping("/update")
    @ResponseBody
    public String updateEmp( HttpSession session, Record record){
        Admin manager = (Admin) session.getAttribute(ACCOUNT_KEY);
        try {
            recordServiceUpdate.update(record);
            //日志记录
            logoService.save(new LogoObj("更新信息："+record.getMm_msg_id(), manager.getMm_manager_id()));
            return toJSONString(SUCCESS);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }


    @Autowired
    @Qualifier("recordExcelService")
    private ExecuteService recordExcelService;

    @RequestMapping("daochuAll")
    @ResponseBody
    public String daochuAll(HttpSession session,String ids, HttpServletRequest request) {
        try {
            Object[] objects = new Object[2];
            objects[0]=ids;
            objects[1]=request;

            String fileName = (String) recordExcelService.execute(objects);
            DataTip tip = new DataTip();
            tip.setData(fileName);
            return toJSONString(tip);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return toJSONString(ERROR_1);

    }
}
