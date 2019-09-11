package com.controller;
import com.pojo.Users;
import com.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/system")
public class UserController {
    @Autowired
    public UserService userService;

    @RequestMapping(value = "/index",method=RequestMethod.GET)
    public ModelAndView index(ModelAndView model){
        model.setViewName("system/index");
        return model;
    }


    /**
     * 登录表单提交
     * @return
     */
    @RequestMapping(value = "/login",method=RequestMethod.POST)
    @ResponseBody
    public Map<String, String> login(
            @RequestParam(value="username",required=true) String staffid,
            @RequestParam(value="password",required=true) String password,
            HttpServletRequest request
    ){
        Map<String, String> ret = new HashMap<String, String>();
        if(StringUtils.isEmpty(staffid)){
            ret.put("type", "error");
            ret.put("msg", "usernameError");
            return ret;
        }
        if(StringUtils.isEmpty(password)){
            ret.put("type", "error");
            ret.put("msg", "passwordErro");
            return ret;
        }

        //从数据库中去查找用户
            //管理员
        Users user = userService.selectByStaffID(staffid);
        System.out.println(staffid);
        if (user == null) {
            ret.put("type", "error");
            ret.put("msg", "不存在该用户!");
            return ret;
        }
        if (!password.equals(user.getPassword())) {
            ret.put("type", "error");
            ret.put("msg", "密码错误!");
            return ret;
        }
        request.getSession().setAttribute("user", user);
        ret.put("type", "success");
        ret.put("msg", "登录成功!");
        if(user.getUsertype()==1){
            ret.put("usertype","staff");
        }
        else if(user.getUsertype()==2){
            ret.put("usertype","adm");
        }
        else if(user.getUsertype()==3){
            ret.put("usertype","superadm");
        }
        return ret;
    }



}
