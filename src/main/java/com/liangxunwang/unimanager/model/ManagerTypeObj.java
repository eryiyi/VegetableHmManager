package com.liangxunwang.unimanager.model;

/**
 * Created by zhl on 2016/6/18.
 */
public class ManagerTypeObj {
    private  String typeId;
    private String typeName;

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public ManagerTypeObj(String typeId, String typeName) {
        this.typeId = typeId;
        this.typeName = typeName;
    }
}
