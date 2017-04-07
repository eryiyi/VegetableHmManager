package com.liangxunwang.unimanager.model;

public class Role {
    private String id;
    private String name;
    private String permissions;
    private String type;
//    默认0顶级管理员
//    1是县级
//    2是市级
//    3是省级
//    4是全国

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }
}
