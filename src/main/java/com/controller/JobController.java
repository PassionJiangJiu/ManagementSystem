package com.controller;

import com.pojo.Jobs;
import com.pojo.Msg;
import com.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理岗位有关的请求
 */
@Controller
public class JobController {

    @Autowired
    private JobService jobService;

    /**
     * 返回所有岗位信息
     */
    @RequestMapping("/jobs")
    @ResponseBody
    public Msg getJobs(){

        //查出的所有岗位信息
        List<Jobs> list = jobService.getJobs();

        return Msg.success().add("jobs",list);
    }

}
