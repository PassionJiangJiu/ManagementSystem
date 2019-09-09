package com.dao;

import com.pojo.Jobs;

public interface JobsMapper {
    int deleteByPrimaryKey(String jobid);

    int insert(Jobs record);

    int insertSelective(Jobs record);

    Jobs selectByPrimaryKey(String jobid);

    int updateByPrimaryKeySelective(Jobs record);

    int updateByPrimaryKey(Jobs record);
}