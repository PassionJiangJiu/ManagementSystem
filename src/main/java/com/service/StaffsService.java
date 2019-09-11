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

    /**
     * 按照员工id查询员工
     * @param staffid
     * @return
     */
    public Staffs getStaff(String staffid) {
        Staffs staffs = staffsMapper.selectOneByStaffIDWithAll(staffid);
        return staffs;
    }

    /**
     * 员工更新
     * @param staffs
     */
    public void updateStaff(Staffs staffs) {
        staffsMapper.updateByStaffIDSelective(staffs);
    }

    /**
     * 员工删除
     * @param staffid
     */
    public void deleteStaff(String staffid) {
        staffsMapper.deleteByStaffID(staffid);
    }
}
