package com.liangxunwang.unimanager.mvc.vo;

import com.liangxunwang.unimanager.model.Emp;

/**
 * Created by Administrator on 2016/2/14.
 */
public class EmpVO extends Emp{
    private String levelName;
    private String mm_level_num;
    private String provinceName;
    private String cityName;
    private String areaName;
    private String countLoginNum;//登录次数统计

    public String getCountLoginNum() {
        return countLoginNum;
    }

    public void setCountLoginNum(String countLoginNum) {
        this.countLoginNum = countLoginNum;
    }

    private String is_dq;//是否即将到期  1是  其他否

    public String getIs_dq() {
        return is_dq;
    }

    public void setIs_dq(String is_dq) {
        this.is_dq = is_dq;
    }

    public String getMm_level_num() {
        return mm_level_num;
    }

    public void setMm_level_num(String mm_level_num) {
        this.mm_level_num = mm_level_num;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

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
