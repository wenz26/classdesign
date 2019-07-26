package com.cwz.springboot.classdesign.service.impl;

import com.cwz.springboot.classdesign.dao.entity.Major;
import com.cwz.springboot.classdesign.dao.mapper.MajorMapper;
import com.cwz.springboot.classdesign.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("majorService")
public class MajorServiceImpl implements MajorService {

    @Autowired
    private MajorMapper majorMapper;

    public List<Major> selectAll() {
        return majorMapper.selectAll();
    }
}
