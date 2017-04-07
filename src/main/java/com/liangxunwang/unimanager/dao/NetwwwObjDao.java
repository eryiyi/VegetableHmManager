package com.liangxunwang.unimanager.dao;

import com.liangxunwang.unimanager.model.AdObj;
import com.liangxunwang.unimanager.model.NetwwwObj;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by zhl on 2015/1/29.
 */
@Repository("netwwwObjDao")
public interface NetwwwObjDao {

    /**
     * 查询
     */
    List<NetwwwObj> lists(Map<String, Object> map);

    //保存
    void save(NetwwwObj adObj);

    //删除
    void delete(String id);

    /**
     * 根据ID查找
     * @return
     */
    public NetwwwObj findById(String id);

    /**
     * 更新
     */
    public void update(NetwwwObj adObj);
}
