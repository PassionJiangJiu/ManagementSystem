package com.service;

import com.dao.StaffsMapper;
import com.pojo.Msg;
import com.pojo.Staffs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffsService {
    @Autowired
    StaffsMapper staffsMapper;
    public List<Staffs> getAll() {
        return staffsMapper.selectByStaffIDWithALL();
    }
//员工保存
    public Msg saveStaff(Staffs staffs) {
        staffsMapper.insertSelective(staffs);
        return Msg.success();
    }
}
