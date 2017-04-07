package com.liangxunwang.unimanager.mvc.wwwnet;

import com.liangxunwang.unimanager.model.AboutUs;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.RecordQuery;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.util.ControllerConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by zhl on 2015/8/12.
 */
@Controller
@RequestMapping("/netAboutUsController")
public class NetAboutUsController extends ControllerConstants {

    @Autowired
    @Qualifier("aboutUsService")
    private ListService feiyongServiceList;


    @Autowired
    @Qualifier("appRecordTopService")
    private ListService appRecordTopService;

    @RequestMapping("toAboutUs")
    public String toLogin(ModelMap map){
        List<AboutUs> list = (List<AboutUs>) feiyongServiceList.list("");
        if(list != null && list.size() > 0){
            map.put("aboutUs", list.get(0));
        }
        //查询热点信息
        RecordQuery recordQuery = new RecordQuery();
        recordQuery.setIndex(1);
        recordQuery.setSize(10);
        List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
        map.put("listsHot", listsHot);
        return "../../hmt/aboutus";
    }

    @RequestMapping("toXieyie")
    public String toXieyie(ModelMap map){
        //查询热点信息
        RecordQuery recordQuery = new RecordQuery();
        recordQuery.setIndex(1);
        recordQuery.setSize(10);
        List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
        map.put("listsHot", listsHot);
        return "../../hmt/xieyi";
    }

    @RequestMapping("toLegal")
    public String toLegal(ModelMap map){
        //查询热点信息
        RecordQuery recordQuery = new RecordQuery();
        recordQuery.setIndex(1);
        recordQuery.setSize(10);
        List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
        map.put("listsHot", listsHot);
        return "../../hmt/legal";
    }

    @RequestMapping("toLink")
    public String toLink(ModelMap map){
        //查询热点信息
        RecordQuery recordQuery = new RecordQuery();
        recordQuery.setIndex(1);
        recordQuery.setSize(10);
        List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
        map.put("listsHot", listsHot);
        return "../../hmt/link";
    }
    @RequestMapping("toPrivacy")
    public String toPrivacy(ModelMap map){
        //查询热点信息
        RecordQuery recordQuery = new RecordQuery();
        recordQuery.setIndex(1);
        recordQuery.setSize(10);
        List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
        map.put("listsHot", listsHot);
        return "../../hmt/privacy";
    }

}
