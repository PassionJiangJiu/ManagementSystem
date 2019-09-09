package com.pojo;

public class EduBackgrounds {
    private Integer edubackgroundid;

    private String edubackgroundname;

    public Integer getEdubackgroundid() {
        return edubackgroundid;
    }

    public void setEdubackgroundid(Integer edubackgroundid) {
        this.edubackgroundid = edubackgroundid;
    }

    public String getEdubackgroundname() {
        return edubackgroundname;
    }

    public void setEdubackgroundname(String edubackgroundname) {
        this.edubackgroundname = edubackgroundname == null ? null : edubackgroundname.trim();
    }
}