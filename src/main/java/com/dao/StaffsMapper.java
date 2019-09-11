package com.dao;

import com.pojo.Staffs;

import java.util.List;

public interface StaffsMapper {
    int deleteByStaffID(Integer id);

    int insert(Staffs record);

    int insertSelective(Staffs record);

    int updateByStaffIDSelective(Staffs record);

    int updateByStaffID(Staffs record);

    List<Staffs> selectByStaffIDWithALL();

    Staffs selectOneByStaffIDWithAll(Staffs staffsid);

}