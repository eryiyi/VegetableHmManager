package com.liangxunwang.unimanager.service.account;

import com.liangxunwang.unimanager.dao.EmpDao;
import com.liangxunwang.unimanager.dao.NoticeDao;
import com.liangxunwang.unimanager.model.Emp;
import com.liangxunwang.unimanager.model.Notice;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import com.liangxunwang.unimanager.query.EmpQuery;
import com.liangxunwang.unimanager.service.ExecuteService;
import com.liangxunwang.unimanager.service.ListService;
import com.liangxunwang.unimanager.service.ServiceException;
import com.liangxunwang.unimanager.service.UpdateService;
import com.liangxunwang.unimanager.util.*;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * vip即将到期  凌晨执行
 */
@Service("empVipEndThreeService")
public class EmpVipEndThreeService implements ListService{
    @Autowired
    @Qualifier("empDao")
    private EmpDao empDao;

    @Autowired
    @Qualifier("noticeDao")
    private NoticeDao noticeDao;

    @Override
    public Object list(Object object) throws ServiceException {
        Map<String, Object> map = new HashMap<String, Object>();

        //判断三天之内的即将到期的，需要传递当前日期的毫秒值和三天之后的毫秒值
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        DateTimeFormatter timeFormatter = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm");
        String today = String.valueOf(df.format(new Date())) +" 23:59";//今天
        DateTime dateTime = DateTime.parse(today, timeFormatter);

        Object[] objects = DateUtil.getDayInterval(dateTime.getMillis(), -3);//3天之后
        String startDay = (String) objects[2];

        DateTime dateTimeStart = DateTime.parse(startDay, timeFormatter);
        if (!StringUtil.isNullOrEmpty(String.valueOf(dateTimeStart.getMillis()))){
            map.put("end", String.valueOf(dateTimeStart.getMillis()));
        }
        if (!StringUtil.isNullOrEmpty(String.valueOf(dateTime.getMillis()))){
            map.put("start", String.valueOf(dateTime.getMillis()));
        }
        List<Emp> lists = empDao.listAllVipEndThree(map);
        //查询这些即将到期的用户  发送通知
        for(int i=0;i<lists.size();i++){
            //批量发布到期通知
            Emp empVO = lists.get(i);//查询到期的用户
            Notice notice = new Notice();
            notice.setMm_notice_id(UUIDFactory.random());
            notice.setMm_manager_id("");
            notice.setMm_notice_title("VIP会员到期提醒");
            notice.setMm_notice_content("您的VIP会员将于" + DateUtil.getDate(empVO.getMm_emp_endtime(), "yyyy-MM-dd") + "到期，为了不影响您的正常使用，请及时联系客服！");
            notice.setDateline(DateUtil.getDateAndTime());
            notice.setIs_del("0");
            notice.setMm_emp_id(empVO.getMm_emp_id());
            noticeDao.save(notice);//添加公告--针对个人的
//                (Notice notice,String channelId)
            if(!StringUtil.isNullOrEmpty(empVO.getDeviceType())){
                BaiduPush.PushMsgToSingleDevice(notice, (empVO.getChannelId()==null?"":empVO.getChannelId()), empVO.getDeviceType());
            }

        }
        return lists;
    }

}
