package com.liangxunwang.unimanager.mvc.vo;

import com.liangxunwang.unimanager.model.FuwuObj;

/**
 * Created by zhl on 2016/5/8.
 */
public class FuwuVO extends FuwuObj {
    private String provinceName;
    private String cityName;
    private String areaName;

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }
}
