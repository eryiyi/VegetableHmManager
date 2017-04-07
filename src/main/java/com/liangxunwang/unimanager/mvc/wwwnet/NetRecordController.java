package com.liangxunwang.unimanager.mvc.wwwnet;

import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.RecordQuery;
import com.liangxunwang.unimanager.service.ExecuteService;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.util.ControllerConstants;
import com.liangxunwang.unimanager.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by zhl on 2015/8/12.
 */
@Controller
@RequestMapping("/netRecordController")
public class NetRecordController extends ControllerConstants {
    @Autowired
    @Qualifier("webVRecordService")
    private ExecuteService webVRecordService;

    @Autowired
    @Qualifier("webVRecordService")
    private ListService recordService;

    @Autowired
    @Qualifier("appRecordTopService")
    private ListService appRecordTopService;

    @RequestMapping("toDetail")
    public String toDetail(HttpSession session,String mm_msg_id,ModelMap map) throws Exception {
        EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);
        RecordVO recordVO = (RecordVO) webVRecordService.execute(mm_msg_id);
        String[] pics = new String[]{};
        if(!StringUtil.isNullOrEmpty(recordVO.getMm_msg_picurl())){
            //处理图片URL链接
            if(recordVO!=null && recordVO.getMm_msg_picurl()!=null){
                pics = recordVO.getMm_msg_picurl().split(",");
            }
        }
        map.put("pics", pics);
        map.put("recordVO", recordVO);

        if(emp != null){
            //说明已经登陆
            map.put("is_login", "1");
            map.put("emp", emp);
        }else{
            //说明没有登陆
            map.put("is_login", "0");
        }

        //查询该用户的其他信息
        RecordQuery query = new RecordQuery();
        query.setSize(10);
        query.setIndex(1);
        query.setMm_emp_id(recordVO.getMm_emp_id());
        Object[] results = (Object[]) recordService.list(query);
        map.put("listRelate", results[0]);

        //查询热点信息
        RecordQuery recordQuery = new RecordQuery();
        recordQuery.setIndex(1);
        recordQuery.setSize(10);
        List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
        map.put("listsHot", listsHot);
        //处理图片
        if(!StringUtil.isNullOrEmpty(recordVO.getMm_msg_picurl())){
            String[] arrs = recordVO.getMm_msg_picurl().split(",");
            map.put("picArr", arrs);
        }
        return "../../hmt/detailRecord";
    }


}
