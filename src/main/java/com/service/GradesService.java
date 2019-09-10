package com.service;

import com.dao.GradesMapper;
import com.pojo.Grades;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradesService {

    @Autowired
    private GradesMapper gradesMapper;
    public List<Grades> getGrades() {
        List<Grades> list = gradesMapper.selectAll();
        return list;
    }
}
