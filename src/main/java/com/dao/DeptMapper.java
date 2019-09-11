package com.dao;

import com.pojo.Dept;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface DeptMapper {
    //根据机构名字查询机构信息
    public Dept selectByDeptName(String deptname);
    //删除机构信息
    int deleteByDeptID(Integer id);
    //添加机构信息
    public int insert(Dept dept);
    int insertSelective(Dept dept);
    //编辑机构信息
    public int edit(Dept dept);
    //
    public List<Dept> findList(String deptname);
}
