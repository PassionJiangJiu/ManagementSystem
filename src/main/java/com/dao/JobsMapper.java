package com.dao;

import com.pojo.Jobs;

import java.util.List;

public interface JobsMapper {
    int deleteByPrimaryKey(String jobid);

    int insert(Jobs record);

    int insertSelective(Jobs record);

    Jobs selectByPrimaryKey(String jobid);
    List<Jobs> selectAll();

    int updateByPrimaryKeySelective(Jobs record);

    int updateByPrimaryKey(Jobs record);
}