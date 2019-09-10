package com.dao;

import com.pojo.Staffs;
import com.pojo.Users;

public interface UsersMapper {


    Users selectByStaffID(Integer staffid);
    int insertUser(Staffs record);
}