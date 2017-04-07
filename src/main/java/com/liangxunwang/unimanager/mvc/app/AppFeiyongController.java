package com.liangxunwang.unimanager.mvc.app;

import com.liangxunwang.unimanager.model.FeiyongObj;
import com.liangxunwang.unimanager.model.FuwuObj;
import com.liangxunwang.unimanager.model.tip.DataTip;
import com.liangxunwang.unimanager.mvc.vo.FeiyongVO;
import com.liangxunwang.unimanager.query.FeiyongQuery;
import com.liangxunwang.unimanager.query.FuwuQuery;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.ControllerConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by zhl on 2015/2/2.
 */
@Controller
public class AppFeiyongController extends ControllerConstants {

    @Autowired
    @Qualifier("feiyongService")
    private ListService feiyongServiceList;

    //vip列表
    @RequestMapping(value = "/getVipList", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String getVipList( FeiyongQuery query){
        try {
            List<FeiyongVO> list = (List<FeiyongVO>) feiyongServiceList.list(query);
            DataTip tip = new DataTip();
            tip.setData(list);
            return toJSONString(tip);
        }catch (ServiceException e){
            return toJSONString(ERROR_1);
        }
    }

}
