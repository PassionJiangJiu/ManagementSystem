package com.service;

import com.dao.StaffsMapper;
import com.dao.UsersMapper;
import com.pojo.Msg;
import com.pojo.Staffs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffsService {
    @Autowired
    StaffsMapper staffsMapper;
    @Autowired
    UsersMapper usersMapper;
    public List<Staffs> getAll() {
        return staffsMapper.selectByStaffIDWithALL();
    }
//员工保存
    public Msg saveStaff(Staffs staffs) {
        staffsMapper.insertSelective(staffs);
        usersMapper.insertUser(staffs);
        return Msg.success();
    }
}
