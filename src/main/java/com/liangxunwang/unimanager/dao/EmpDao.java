package com.liangxunwang.unimanager.dao;

import com.liangxunwang.unimanager.model.Emp;
import com.liangxunwang.unimanager.mvc.vo.EmpVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("empDao")
public interface EmpDao {
    /**
     * @param list
     */
    void saveList(List<Emp> list);

    /**
     * 查询所有的会员信息
     */
    List<EmpVO> listMemberByName(Map<String, Object> map);

    /**
     * 查询所有的会员信息--统计登录信息
     */
    List<EmpVO> listCountLoginNum(Map<String, Object> map);
    long countLoginNumOne(Map<String, Object> map);

    //查询VIP 3天内到期的所有会员
    List<Emp> listAllVipEndThree(Map<String, Object> map);

    long count(Map<String, Object> map);
    //今日注册会员数量
    long countDay(Map<String, Object> map);

    //更新会员数据
    void update(Emp emp);

    //上传公司经纬度
    void updateCompanyLocation(Emp emp);

    //更新头像
    void updateCover(Emp emp);

    //更新名片
    void updateAd(Emp emp);

    //根据用户ID查询用户信息
    EmpVO findById(String mm_emp_id);

    /**
     * 根据手机号查找会员
     * @param mm_emp_mobile
     * @return
     */
    EmpVO findByMobile(String mm_emp_mobile);
    //查询身份证号
    EmpVO findByCard(String mm_emp_card);

    //保存会员信息
    void save(Emp emp);

    //更新会员数据--经纬度
    void updateLoacation(Emp emp);

    //修改用户密码
    void updatePwr(Emp emp);

    //审核用户
    void updateCheck(Map<String, Object> map);

    /**
     * 查询附近商家
     */
    List<EmpVO> listsLocation(Map<String, Object> map);
    long countLocation(Map<String, Object> map);

    /**
     * 根据手机号和身份证号查找会员
     * @return
     */
    EmpVO findByMobileAndCard(Map<String, Object> map);

    //用户登陆状态修改
    void updateLogin(Map<String, Object> map);

    //用户发布供应权限
    void updateFabugy(Map<String, Object> map);

    //发布求购权限
    void updateFabuqg(Map<String, Object> map);

    //补充资料
    void updateProfileMember(Emp emp);

    /**
     * 根据过期时间去禁用VIP
     * @param nowTime
     */
    public void updateOverTime(String nowTime);


    //删除用户
    void deleteEmp(String mm_emp_id);

    /**
     * 根据ID更新pushId
     * {id, userId, channelId, type}
     */
    void updatePushId(@Param(value = "id") String id, @Param(value = "userId") String userId, @Param(value = "channelId") String channelId, @Param(value = "type") String type);

    //更新头像
    void updateCoverByEmpId(@Param(value = "mm_emp_id") String id, @Param(value = "mm_emp_cover") String type);

}
