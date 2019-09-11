package com.service;
import com.pojo.Staffs;
import com.pojo.Users;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    public Users selectByStaffID(String staffid);
    //根据id删除用户
    int deleteByPrimaryKey(Integer userid);

    int insert(Users record);

    int insertSelective(Users record);

    void insertUser(Staffs staffs);

}
