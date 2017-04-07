package com.liangxunwang.unimanager.mvc.wwwnet;

import com.liangxunwang.unimanager.model.Notice;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.mvc.vo.RecordVO;
import com.liangxunwang.unimanager.query.NoticeQuery;
import com.liangxunwang.unimanager.query.RecordQuery;
import com.liangxunwang.unimanager.service.ExecuteService;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.util.ControllerConstants;
import com.liangxunwang.unimanager.util.Page;
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
@RequestMapping("/netNoticeController")
public class NetNoticeController extends ControllerConstants {

    @Autowired
    @Qualifier("noticeService")
    private ListService noticeServiceList;

    @Autowired
    @Qualifier("noticeService")
    private ExecuteService noticeServiceExe;

    @Autowired
    @Qualifier("appRecordTopService")
    private ListService appRecordTopService;

    @RequestMapping("list")
    public String list(HttpSession session, ModelMap map, NoticeQuery query, Page page){
        EmpVO emp = (EmpVO) session.getAttribute(MEMBER_KEY);
        query.setIndex(page.getPage() == 0 ? 1 : page.getPage());
        query.setSize(query.getSize() == 0 ? page.getDefaultSize() : query.getSize());
        try {
            Object[] results = (Object[]) noticeServiceList.list(query);
            map.put("list", results[0]);
            long count = (Long) results[1];
            page.setCount(count);
            page.setPageCount(calculatePageCount(query.getSize(), count));
            map.addAttribute("page", page);
            map.addAttribute("query", query);
            if(emp != null){
                //说明已经登陆
                map.put("is_login", "1");
                map.put("emp", emp);
            }else{
                //说明没有登陆
                map.put("is_login", "0");
            }
            //查询热点信息
            RecordQuery recordQuery = new RecordQuery();
            recordQuery.setIndex(1);
            recordQuery.setSize(10);
            List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
            map.put("listsHot", listsHot);
            return "../../hmt/notice";
        }catch (ServiceException e){
            String msg = e.getMessage();
            return "../../hmt/login";
        }
    }

//    toDetail

    @RequestMapping("toDetail")
    public String toDetail(HttpSession session, ModelMap map,String id) throws Exception {
        EmpVO empVO = (EmpVO) session.getAttribute(MEMBER_KEY);
        if(empVO != null) {
            Notice notice = (Notice)noticeServiceExe.execute(id);
            map.put("notice", notice);

            //查询热点信息
            RecordQuery recordQuery = new RecordQuery();
            recordQuery.setIndex(1);
            recordQuery.setSize(10);
            List<RecordVO> listsHot = (List<RecordVO>) appRecordTopService.list(recordQuery);
            map.put("listsHot", listsHot);

            return "../../hmt/noticeDetail";
        }else {
            return "../../hmt/login";
        }

    }

}
