package com.liangxunwang.unimanager.dao;

import com.liangxunwang.unimanager.model.ShenheRecordObj;
import com.liangxunwang.unimanager.model.ShenheTypeObj;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 */
@Repository("shenheRecordDao")
public interface ShenheRecordDao {

    /**
     * 查询
     */
    List<ShenheRecordObj> lists(Map<String, Object> map);

    //保存
    void save(ShenheRecordObj shenheTypeObj);


    /**
     * 更新
     * @param shenheTypeObj
     */
    public void update(ShenheRecordObj shenheTypeObj);

}
