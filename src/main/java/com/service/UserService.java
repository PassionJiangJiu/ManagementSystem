package com.service;
import com.pojo.Users;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserService {

    public Users selectByStaffID(String staffid);

}
