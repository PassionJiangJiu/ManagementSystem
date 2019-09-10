package com.dao;

import com.pojo.EduBackgrounds;

import java.util.List;

public interface EduBackgroundsMapper {
    int deleteByPrimaryKey(Integer edubackgroundid);

    int insert(EduBackgrounds record);

    int insertSelective(EduBackgrounds record);

    List<EduBackgrounds> selectAll();

    int updateByPrimaryKeySelective(EduBackgrounds record);

    int updateByPrimaryKey(EduBackgrounds record);
}