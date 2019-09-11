package com.controller;

import com.github.pagehelper.Page;
import com.pojo.Dept;
import com.pojo.Msg;
import com.pojo.Users;
import com.service.DeptService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping(value = "/dept")
@Controller
public class DeptController {
    @Autowired
    public DeptService deptService;
//
//    @RequestMapping(value = "/message",method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String,Object> getList(
//            @RequestParam(value="deptname",required=true) String deptname,
//            HttpServletRequest request
//    ){
//        Map<String, Object> ret = new HashMap<String, Object>();
//        ret.put("rows", deptService.findList(deptname));
//        return ret;
//    }

//    @RequestMapping(value = "/message",method=RequestMethod.POST)
//    @ResponseBody
//    public Map<String, String> login(
//            @RequestParam(value="deptname",required=true) String deptname,
//            HttpServletRequest request
//    ){
//        Map<String, String> ret = new HashMap<String, String>();
//        if(StringUtils.isEmpty(deptname)){
//            ret.put("type", "error");
//            ret.put("msg", "usernameError");
//            return ret;
//        }
//        if(StringUtils.isEmpty(deptname)){
//            ret.put("type", "error");
//            ret.put("msg", "passwordErro");
//            return ret;
//        }
//
//        //从数据库中去查找用户
//        //管理员
//        Dept dept = deptService.selectByDeptName(deptname);
//        if (dept == null) {
//            ret.put("type", "error");
//            ret.put("msg", "inexistence ");
//            return ret;
//        }
//        if (!deptname.equals(dept.getDeptname())) {
//            ret.put("type", "error");
//            ret.put("msg", "right!");
//            return ret;
//        }
//        ret.put("type", "success");
//        ret.put("msg", "dept");
//        return ret;
//    }

    @RequestMapping(value = "/message",method=RequestMethod.POST)
    @ResponseBody
    public Dept message(
            @RequestParam(value="deptname",required=true) String deptname,
            HttpServletRequest request
    ){
        Dept dept = deptService.selectByDeptName(deptname);
        return dept;
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Integer add(@RequestParam(value="deptname",required=true) String deptname,
                       @RequestParam(value="deptstyle",required=true) String deptstyle,
                       @RequestParam(value="deptmoney",required=true) String deptmoney,
                       @RequestParam(value="deptcode",required=true) String deptcode,
                       HttpServletRequest request
                       ){
        Dept dept = new Dept();
        dept.setDeptname(deptname);
        dept.setDeptstyle(deptstyle);
        dept.setDeptmoney(deptmoney);
        dept.setDeptcode(deptcode);
        deptService.insert(dept);
        return 0;
    }
}
