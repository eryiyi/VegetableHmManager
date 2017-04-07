package com.liangxunwang.unimanager.model;

/**
 * Created by Administrator on 2016/2/14.
 */
public class Record {
    private String mm_msg_id;
    private String mm_emp_id;
    private String mm_msg_type;
    private String mm_msg_title;
    private String mm_msg_content;
    private String mm_msg_picurl;
    private String dateline;
    private String is_del;
    private String is_top;
    private String top_num;
    private String provinceid;
    private String cityid;
    private String countryid;
    private String accessToken;
    private String mm_msg_video;
    private String is_check;//是否审核了 只有审核的才能看到 1已经审核 0没有审核  默认0

    private String mm_emp_msg_num;//允许会员发布的信息数量
    private String is_read;

    public String getIs_check() {
        return is_check;
    }

    public void setIs_check(String is_check) {
        this.is_check = is_check;
    }

    public String getMm_msg_video() {
        return mm_msg_video;
    }

    public void setMm_msg_video(String mm_msg_video) {
        this.mm_msg_video = mm_msg_video;
    }

    public String getIs_read() {
        return is_read;
    }

    public void setIs_read(String is_read) {
        this.is_read = is_read;
    }

    public String getMm_msg_title() {
        return mm_msg_title;
    }

    public void setMm_msg_title(String mm_msg_title) {
        this.mm_msg_title = mm_msg_title;
    }

    public String getMm_emp_msg_num() {
        return mm_emp_msg_num;
    }

    public void setMm_emp_msg_num(String mm_emp_msg_num) {
        this.mm_emp_msg_num = mm_emp_msg_num;
    }

    public String getMm_msg_id() {
        return mm_msg_id;
    }

    public void setMm_msg_id(String mm_msg_id) {
        this.mm_msg_id = mm_msg_id;
    }

    public String getMm_emp_id() {
        return mm_emp_id;
    }

    public void setMm_emp_id(String mm_emp_id) {
        this.mm_emp_id = mm_emp_id;
    }

    public String getMm_msg_type() {
        return mm_msg_type;
    }

    public void setMm_msg_type(String mm_msg_type) {
        this.mm_msg_type = mm_msg_type;
    }

    public String getMm_msg_content() {
        return mm_msg_content;
    }

    public void setMm_msg_content(String mm_msg_content) {
        this.mm_msg_content = mm_msg_content;
    }

    public String getMm_msg_picurl() {
        return mm_msg_picurl;
    }

    public void setMm_msg_picurl(String mm_msg_picurl) {
        this.mm_msg_picurl = mm_msg_picurl;
    }

    public String getDateline() {
        return dateline;
    }

    public void setDateline(String dateline) {
        this.dateline = dateline;
    }

    public String getIs_del() {
        return is_del;
    }

    public void setIs_del(String is_del) {
        this.is_del = is_del;
    }

    public String getIs_top() {
        return is_top;
    }

    public void setIs_top(String is_top) {
        this.is_top = is_top;
    }

    public String getTop_num() {
        return top_num;
    }

    public void setTop_num(String top_num) {
        this.top_num = top_num;
    }

    public String getProvinceid() {
        return provinceid;
    }

    public void setProvinceid(String provinceid) {
        this.provinceid = provinceid;
    }

    public String getCityid() {
        return cityid;
    }

    public void setCityid(String cityid) {
        this.cityid = cityid;
    }

    public String getCountryid() {
        return countryid;
    }

    public void setCountryid(String countryid) {
        this.countryid = countryid;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }
}
