package com.dao;

import com.pojo.Sexs;

public interface SexsMapper {
    int deleteByPrimaryKey(Integer sexid);

    int insert(Sexs record);

    int insertSelective(Sexs record);

    Sexs selectByPrimaryKey(Integer sexid);

    int updateByPrimaryKeySelective(Sexs record);

    int updateByPrimaryKey(Sexs record);
}