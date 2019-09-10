package com.pojo;

import java.util.Date;

public class Staffs {
    private Integer id;

    private String staffid;

    private String staffname;

    private Integer sexid;

    private Sexs sexs;

    private String jobid;

    private Jobs jobs;

    private String gradeid;

    private Grades grades;

    private String edubackgroundid;

    private EduBackgrounds eduBackgrounds;

    private String birthday;

    private String nativeplace;

    private String familyaddress;

    private String idcard;

    private String tel;

    private String major;

    private String employeddate;

    private String salary;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStaffid() {
        return staffid;
    }

    public void setStaffid(String staffid) {
        this.staffid = staffid == null ? null : staffid.trim();
    }

    public String getStaffname() {
        return staffname;
    }

    public void setStaffname(String staffname) {
        this.staffname = staffname == null ? null : staffname.trim();
    }

    public Integer getSexid() {
        return sexid;
    }

    public void setSexid(Integer sexid) {
        this.sexid = sexid;
    }

    public String getJobid() {
        return jobid;
    }

    public void setJobid(String jobid) {
        this.jobid = jobid == null ? null : jobid.trim();
    }

    public String getGradeid() {
        return gradeid;
    }

    public void setGradeid(String gradeid) {
        this.gradeid = gradeid == null ? null : gradeid.trim();
    }

    public String getEdubackgroundid() {
        return edubackgroundid;
    }

    public void setEdubackgroundid(String edubackgroundid) {
        this.edubackgroundid = edubackgroundid;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public String getNativeplace() {
        return nativeplace;
    }

    public void setNativeplace(String nativeplace) {
        this.nativeplace = nativeplace == null ? null : nativeplace.trim();
    }

    public String getFamilyaddress() {
        return familyaddress;
    }

    public void setFamilyaddress(String familyaddress) {
        this.familyaddress = familyaddress == null ? null : familyaddress.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }


    public String getEmployeddate() {
        return employeddate;
    }

    public void setEmployeddate(String employeddate) {
        this.employeddate = employeddate;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary == null ? null : salary.trim();
    }

    public Sexs getSexs() {
        return sexs;
    }

    public void setSexs(Sexs sexs) {
        this.sexs = sexs;
    }

    public Jobs getJobs() {
        return jobs;
    }

    public void setJobs(Jobs jobs) {
        this.jobs = jobs;
    }

    public Grades getGrades() {
        return grades;
    }

    public void setGrades(Grades grades) {
        this.grades = grades;
    }

    public EduBackgrounds getEduBackgrounds() {
        return eduBackgrounds;
    }

    public void setEduBackgrounds(EduBackgrounds eduBackgrounds) {
        this.eduBackgrounds = eduBackgrounds;
    }
}