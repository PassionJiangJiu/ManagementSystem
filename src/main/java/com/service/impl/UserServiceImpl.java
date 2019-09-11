package com.service.impl;

import com.dao.UsersMapper;
import com.pojo.Staffs;
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

    @Override
    public int deleteByPrimaryKey(Integer userid) {
        return usersMapper.deleteByPrimaryKey(userid);
    }

    @Override
    public int insert(Users record) {
        return usersMapper.insert(record);
    }

    @Override
    public int insertSelective(Users record) {
        return usersMapper.insertSelective(record);
    }

    @Override
    public void insertUser(Staffs staffs) {

    }

}
