package com.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Msg;
import com.pojo.Staffs;
import com.service.StaffsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class StaffsConroller {
    @Autowired
    StaffsService staffsService;


    @ResponseBody
    @RequestMapping(value = "staff/{staffid}")
    public Msg deleteStaffById(@PathVariable("staffid") String staffid){
        staffsService.deleteStaff(staffid);

        return Msg.success();
    }

    /**
     * 员工更新方法
     * @param staffs
     * @return
     */
    @RequestMapping(value = "/staff/{staffid}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateStaff(Staffs staffs){
        staffsService.updateStaff(staffs);

        return Msg.success();
    }


    /**
     * 根据id查询员工
     * @param staffid
     * @return
     */
    @RequestMapping(value = "/staff/{staffid}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getStaff(@PathVariable("staffid") String staffid){

        Staffs staffs = staffsService.getStaff(staffid);
        return Msg.success().add("staff",staffs);

    }


    @RequestMapping(value = "staff",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveStaff(Staffs staffs){
        staffsService.saveStaff(staffs);
        return null;
    }

    @RequestMapping("/staffs")
    @ResponseBody
    public Msg getStaffsWithjson(@RequestParam(value="pn", defaultValue = "1") Integer pn ){
        //在查询之前只需要调用，传入页码以及每页的大小
        PageHelper.startPage(pn,5);
        List<Staffs> staffs = staffsService.getAll();
        //使用PageInfo包装查询后的结果，只需将PageInfo交给页面就行
        //封装了详细的分页信息，包括我们查询出来的数据,传入连续显示的页数
        PageInfo page = new PageInfo(staffs,5);
        return Msg.success().add("PageInfo",page);
    }

//    @RequestMapping("/staffs")
    public String getStaffs(@RequestParam(value="pn", defaultValue = "1") Integer pn , Model model){
        //在查询之前只需要调用，传入页码以及每页的大小
        PageHelper.startPage(pn,5);
        List<Staffs> staffs = staffsService.getAll();
        //使用PageInfo包装查询后的结果，只需将PageInfo交给页面就行
        //封装了详细的分页信息，包括我们查询出来的数据,传入连续显示的页数
        PageInfo page = new PageInfo(staffs,5);
        model.addAttribute("pageInfo", page);

        return "list";
    }
}
