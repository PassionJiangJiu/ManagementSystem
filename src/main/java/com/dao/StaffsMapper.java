package com.dao;

import com.pojo.Staffs;

import java.util.List;

public interface StaffsMapper {
    int deleteByStaffID(String staffid);

    int insert(Staffs record);

    int insertSelective(Staffs record);


    int updateByStaffIDSelective(Staffs record);

    int updateByStaffID(Staffs record);

    List<Staffs> selectByStaffIDWithALL();

    Staffs selectOneByStaffIDWithAll(String staffsid);


}