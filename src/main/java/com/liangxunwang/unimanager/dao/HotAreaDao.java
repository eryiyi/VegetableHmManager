package com.liangxunwang.unimanager.dao;

import com.liangxunwang.unimanager.model.CityObj;
import com.liangxunwang.unimanager.model.CountryObj;
import com.liangxunwang.unimanager.mvc.vo.CountryVO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 */
@Repository("hotAreaDao")
public interface HotAreaDao {

    /**
     * 查询县区
     */
    List<CountryVO> lists(Map<String, Object> map);

    //保存热门县区
    void save(CountryObj cityObj);


    //根据id删除热门县区
    void delete(String id);

}
