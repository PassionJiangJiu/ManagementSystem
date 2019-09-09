package com.dao;

import com.pojo.Users;

public interface UsersMapper {


    Users selectByStaffID(Integer staffid);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);
}