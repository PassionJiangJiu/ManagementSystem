package com.service;

import com.dao.EduBackgroundsMapper;
import com.pojo.EduBackgrounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EduBackgroundsService {

    @Autowired
    private EduBackgroundsMapper eduBackgroundsMapper;
    public List<EduBackgrounds> getEduBackgrounds() {
        List<EduBackgrounds> list = eduBackgroundsMapper.selectAll();
        return list;
    }
}
