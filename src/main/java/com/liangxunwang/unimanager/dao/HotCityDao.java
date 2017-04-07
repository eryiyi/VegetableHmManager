package com.liangxunwang.unimanager.dao;

import com.liangxunwang.unimanager.model.CityObj;
import com.liangxunwang.unimanager.model.KefuTel;
import com.liangxunwang.unimanager.mvc.vo.CityVO;
import com.liangxunwang.unimanager.mvc.vo.KefuVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 */
@Repository("hotCityDao")
public interface HotCityDao {

    /**
     * 查询城市
     */
    List<CityVO> lists(Map<String, Object> map);

    //保存热门城市
    void save(CityObj cityObj);


    //根据id删除热门城市
    void delete(String id);

}
