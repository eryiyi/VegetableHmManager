package com.liangxunwang.unimanager.dao;

import com.liangxunwang.unimanager.model.DayValueObj;
import com.liangxunwang.unimanager.model.NearbyDistanceObj;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by zhl on 2015/1/29.
 */
@Repository("dayValueObjDao")
public interface DayValueObjDao {
    /**
     * 查询
     */
    List<DayValueObj> lists(Map<String, Object> map);

    //保存
    void save(DayValueObj dayValueObj);

    /**
     * 更新
     * @param dayValueObj
     */
    public void update(DayValueObj dayValueObj);

}
