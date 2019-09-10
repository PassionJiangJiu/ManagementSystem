package com.service;

import com.dao.JobsMapper;
import com.pojo.Jobs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobService {

    @Autowired
    private JobsMapper jobsMapper;

    public List<Jobs> getJobs(){
        //查出的所有部门信息
        List<Jobs> list = jobsMapper.selectAll();
        return list;
    }

}
