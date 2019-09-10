package com.dao;

import com.pojo.Grades;

import java.util.List;

public interface GradesMapper {
    int deleteByPrimaryKey(String gradeid);

    int insert(Grades record);

    int insertSelective(Grades record);

    List<Grades> selectAll();

    int updateByPrimaryKeySelective(Grades record);

    int updateByPrimaryKey(Grades record);
}