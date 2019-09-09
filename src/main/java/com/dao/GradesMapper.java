package com.dao;

import com.pojo.Grades;

public interface GradesMapper {
    int deleteByPrimaryKey(String gradeid);

    int insert(Grades record);

    int insertSelective(Grades record);

    Grades selectByPrimaryKey(String gradeid);

    int updateByPrimaryKeySelective(Grades record);

    int updateByPrimaryKey(Grades record);
}