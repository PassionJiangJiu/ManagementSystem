package com.dao;

import com.pojo.EduBackgrounds;

public interface EduBackgroundsMapper {
    int deleteByPrimaryKey(Integer edubackgroundid);

    int insert(EduBackgrounds record);

    int insertSelective(EduBackgrounds record);

    EduBackgrounds selectByPrimaryKey(Integer edubackgroundid);

    int updateByPrimaryKeySelective(EduBackgrounds record);

    int updateByPrimaryKey(EduBackgrounds record);
}