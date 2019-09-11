package com.service;


import com.pojo.Dept;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface DeptService {
    //根据机构名字查询机构信息
    public Dept selectByDeptName(String deptname);
    //删除机构信息
    int deleteByDeptID(Integer id);
    //添加机构信息
    public int insert(Dept dept);
    public int insertSelective(Dept dept);
    //编辑机构信息
    public int edit(Dept dept);
    public List<Dept> findList(String deptname);

}
