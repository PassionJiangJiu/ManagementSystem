package com.dao;

import com.pojo.Staffs;
import com.pojo.Users;
import org.apache.ibatis.annotations.Param;

public interface UsersMapper {

    //根据id查询用户s
    Users selectByStaffID(String staffid);

    //根据id删除用户
    int deleteByPrimaryKey(Integer userid);

    int insert(Users record);

    int insertSelective(Users record);

    void insertUser(Staffs staffs);
}