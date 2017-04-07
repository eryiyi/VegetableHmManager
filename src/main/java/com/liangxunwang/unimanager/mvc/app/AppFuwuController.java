package com.liangxunwang.unimanager.mvc.app;

import com.liangxunwang.unimanager.model.FuwuObj;
import com.liangxunwang.unimanager.model.Record;
import com.liangxunwang.unimanager.model.tip.DataTip;
import com.liangxunwang.unimanager.mvc.vo.FuwuVO;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.FuwuQuery;
import com.liangxunwang.unimanager.query.RecordQuery;
import com.liangxunwang.unimanager.service.FindService;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.SaveService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.ControllerConstants;
import com.liangxunwang.unimanager.util.Page;
import com.liangxunwang.unimanager.util.StringUtil;
import com.liangxunwang.unimanager.util.UUIDFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhl on 2015/2/2.
 */
@Controller
public class AppFuwuController extends ControllerConstants {

    @Autowired
    @Qualifier("appRecordService")
    private ListService recordListService;

    @Autowired
    @Qualifier("appFuwuLocationService")
    private ListService appFuwuService;
    @Autowired
    @Qualifier("appFuwuLocationService")
    private ListService appFuwuLocationService;

    //服务信息列表
    @RequestMapping(value = "/getFuwuByLocationAndType", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String getFuwuByLocationAndType(FuwuQuery query,Page page){
        query.setIndex(page.getIndex()==0?1:page.getIndex());
        query.setSize(query.getSize()==0?page.getDefaultSize():query.getSize());
        try {
            Object[] results = (Object[])appFuwuService.list(query);
            DataTip tip = new DataTip();
            tip.setData(results[0]);
            return toJSONString(tip);
        }catch (ServiceException e){
            String msg = e.getMessage();
            if (msg.equals("accessTokenNull")){
                return toJSONString(ERROR_9);
            }else{
                return toJSONString(ERROR_1);
            }
        }
    }

    //服务信息列表   附近的 按照区域查询
    @RequestMapping(value = "/getFuwuType", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String getFuwuType(FuwuQuery query,Page page){
        query.setIndex(page.getIndex()==0?1:page.getIndex());
        query.setSize(query.getSize()==0?page.getDefaultSize():query.getSize());
        try {
            Object[] results = (Object[])appFuwuLocationService.list(query);
            DataTip tip = new DataTip();
            tip.setData(results[0]);
            return toJSONString(tip);
        }catch (ServiceException e){
            String msg = e.getMessage();
            if (msg.equals("accessTokenNull")){
                return toJSONString(ERROR_9);
            }else{
                return toJSONString(ERROR_1);
            }
        }
    }

}
