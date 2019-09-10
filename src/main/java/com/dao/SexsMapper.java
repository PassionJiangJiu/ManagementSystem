package com.dao;

import com.pojo.Sexs;

import java.util.List;

public interface SexsMapper {
    int deleteByPrimaryKey(Integer sexid);

    int insert(Sexs record);

    int insertSelective(Sexs record);

    List<Sexs> selectAll();

    int updateByPrimaryKeySelective(Sexs record);

    int updateByPrimaryKey(Sexs record);
}