package com.service.impl;

import com.dao.UsersMapper;
import com.pojo.Users;
import com.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    public UsersMapper usersMapper;
    @Override
    public Users selectByStaffID(String staffid) {
        return usersMapper.selectByStaffID(staffid);
    }

}
