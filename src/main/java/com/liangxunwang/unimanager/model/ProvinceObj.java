package com.liangxunwang.unimanager.model;

/**
 * Created by Administrator on 2016/2/16.
 */
public class ProvinceObj {
    private String id;
    private String provinceID;
    private String province;
    private String pronum;
    private String msgNum;
    private String is_use;

    public String getIs_use() {
        return is_use;
    }

    public void setIs_use(String is_use) {
        this.is_use = is_use;
    }

    public String getMsgNum() {
        return msgNum;
    }

    public void setMsgNum(String msgNum) {
        this.msgNum = msgNum;
    }

    public String getPronum() {
        return pronum;
    }

    public void setPronum(String pronum) {
        this.pronum = pronum;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(String provinceID) {
        this.provinceID = provinceID;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }
}
