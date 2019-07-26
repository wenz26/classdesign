package com.cwz.springboot.classdesign.service;

import com.cwz.springboot.classdesign.dao.entity.Major;

import java.util.List;

public interface MajorService {
    public List<Major> selectAll();
}
