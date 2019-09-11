package com.service.impl;

import com.dao.DeptMapper;
import com.pojo.Dept;
import com.service.DeptService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class DeptServiceImpl implements DeptService {
    @Resource
    public DeptMapper deptMapper;
    @Override
    public Dept selectByDeptName(String deptname) {
        return deptMapper.selectByDeptName(deptname);
    }

    @Override
    public int deleteByDeptID(Integer id) {
        return deptMapper.deleteByDeptID(id);
    }

    @Override
    public int insert(Dept dept) {
        return deptMapper.insert(dept);
    }

    @Override
    public int insertSelective(Dept dept) {
        return deptMapper.insertSelective(dept);
    }

    @Override
    public int edit(Dept dept) {
        return deptMapper.edit(dept);
    }

    @Override
    public List<Dept> findList(String deptname) {
        return deptMapper.findList(deptname);
    }

}
