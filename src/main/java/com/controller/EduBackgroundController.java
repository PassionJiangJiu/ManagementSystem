package com.controller;

import com.pojo.EduBackgrounds;
import com.pojo.Msg;
import com.service.EduBackgroundsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class EduBackgroundController {
    @Autowired
    private EduBackgroundsService eduBackgroundsService;

    /**
     * 返回所有岗位信息
     */
    @RequestMapping("/eduBackgrounds")
    @ResponseBody
    public Msg getJobs(){

        //查出的所有岗位信息
        List<EduBackgrounds> list = eduBackgroundsService.getEduBackgrounds();

        return Msg.success().add("eduBackgrounds",list);
    }
}
