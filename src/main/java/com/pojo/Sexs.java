package com.pojo;

public class Sexs {
    private Integer sexid;

    private String sexname;

    public Integer getSexid() {
        return sexid;
    }

    public void setSexid(Integer sexid) {
        this.sexid = sexid;
    }

    public String getSexname() {
        return sexname;
    }

    public void setSexname(String sexname) {
        this.sexname = sexname == null ? null : sexname.trim();
    }
}