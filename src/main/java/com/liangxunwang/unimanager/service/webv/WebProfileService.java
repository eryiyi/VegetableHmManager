package com.liangxunwang.unimanager.service.webv;

import com.liangxunwang.unimanager.dao.EmpDao;
import com.liangxunwang.unimanager.dao.ShenheTypeDao;
import com.liangxunwang.unimanager.model.Emp;
import com.liangxunwang.unimanager.model.ShenheTypeObj;
import com.liangxunwang.unimanager.service.*;
import com.liangxunwang.unimanager.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhl on 2015/1/29.
 */
@Service("webProfileService")
public class WebProfileService implements SaveService,UpdateService{
    @Autowired
    @Qualifier("empDao")
    private EmpDao memberDao;

    @Autowired
    @Qualifier("shenheTypeDao")
    private ShenheTypeDao shenheTypeDao;

    @Override
    public Object save(Object object) {
        Emp member = (Emp) object;
        Emp checkMember = memberDao.findByMobile(member.getMm_emp_mobile());
        Emp checkMemberT = memberDao.findByCard(member.getMm_emp_card());
        if (checkMember != null){
            throw new ServiceException("MobileIsUse");
        }
        if (checkMemberT != null){
            throw new ServiceException("CardIsUse");
        }
        //查询身份证号是否使用

        member.setMm_emp_id(UUIDFactory.random());//设置ID
        member.setMm_emp_regtime(DateUtil.getDateAndTime());//时间戳
        if(!StringUtil.isNullOrEmpty(member.getMm_emp_cover())){
            //
        }else{
            member.setMm_emp_cover(Constants.COVER_DEFAULT);//头像
        }
        member.setMm_emp_password(new MD5Util().getMD5ofStr(member.getMm_emp_password()));//密码加密
        member.setMm_level_id("358b1e94e2274685b0badf41e22b85c8");//默认VIP1
//        member.setMm_emp_msg_num("1");//允许发布信息数量  默认0
//        member.setIs_login("0");//允许登陆 默认0允许
//        member.setIs_fabugongying("1");//发布供应信息权限  0默认不允许
//        member.setIs_fabuqiugou("1");//发布求购信息权限 0默认不允许
//        member.setIs_fabugongying_see("0");//查看供应信息权限 0默认允许
//        member.setIs_fabuqiugou_see("0");//查看求购信息权限 0默认允许
//        member.setIs_see_all("0");//1	查看所有信息权限 0默认不允许
//        member.setIs_pic("0");//照片发布权限默认0不允许
//        member.setIs_chengxin("0");//诚信单位 0默认否
//        member.setIs_miaomu("0");//蔬菜协会  0默认否
//        member.setIs_use("0");//是否禁用 0默认否
//        member.setMm_emp_beizhu("");
//        member.setMm_emp_company_detail("");
//        member.setIs_upate_profile("0");//是否补充资料 默认否

        member.setMm_emp_msg_num("10");//允许发布信息数量  默认0
        member.setIs_login("0");//允许登陆 默认0允许
        member.setIs_fabugongying("1");//发布供应信息权限  0默认不允许
        member.setIs_fabuqiugou("1");//发布求购信息权限 0默认不允许
        member.setIs_fabugongying_see("0");//查看供应信息权限 0默认允许
        member.setIs_fabuqiugou_see("0");//查看求购信息权限 0默认允许
        member.setIs_see_all("0");//1	查看所有信息权限 0默认不允许
        member.setIs_pic("3");//照片发布权限默认0不允许
        member.setIs_chengxin("0");//诚信单位 0默认否
        member.setIs_miaomu("0");//蔬菜协会  0默认否
        member.setIs_use("0");//是否禁用 0默认否
        member.setMm_emp_beizhu("");
        member.setMm_emp_company_detail("");
        member.setIs_upate_profile("0");//是否补充资料 默认否
        member.setIs_video("1");//0否  1是  发布视频
        member.setMm_msg_length("120");

        //判断审核方式
        Map<String, Object> map = new HashMap<String, Object>();
        List<ShenheTypeObj> listsShenheType = shenheTypeDao.lists(map);
        if(listsShenheType != null && listsShenheType.size()>0){
            ShenheTypeObj shenheTypeObj = listsShenheType.get(0);
            if(shenheTypeObj != null){
                if("0".equals(shenheTypeObj.getMm_shenhe_type())){
                    //自动审核
                    member.setIscheck("1");//是否审核  0默认否  1已审核
                }else{
                    //需要管理员手动审核
                    member.setIscheck("0");//是否审核  0默认否  1已审核
                }
            }

        }else {
            member.setIscheck("1");//是否审核  0默认否  1已审核
        }

        try {
            memberDao.save(member);
        }catch (Exception e){
            throw new ServiceException(Constants.SAVE_ERROR);
        }
        return member;
    }


    //完善个人资料 app
    @Override
    public Object update(Object object) {
        Emp member = (Emp) object;
        member.setIs_upate_profile("1");
        try {
            memberDao.updateProfileMember(member);
        }catch (Exception e){
            throw new ServiceException(Constants.SAVE_ERROR);
        }
        return member;
    }
}
