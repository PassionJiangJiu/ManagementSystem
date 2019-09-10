package com.controller;

import com.pojo.Grades;
import com.pojo.Msg;
import com.service.GradesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class GradeController {
    @Autowired
    private GradesService gradesService;

    /**
     * 返回所有岗位信息
     */
    @RequestMapping("/grades")
    @ResponseBody
    public Msg getJobs(){

        //查出的所有岗位信息
        List<Grades> list = gradesService.getGrades();

        return Msg.success().add("grades",list);
    }
}

