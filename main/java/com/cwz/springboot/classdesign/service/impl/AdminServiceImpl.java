package com.cwz.springboot.classdesign.service.impl;

import com.cwz.springboot.classdesign.dao.entity.Admin;
import com.cwz.springboot.classdesign.dao.mapper.AdminMapper;
import com.cwz.springboot.classdesign.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public Admin findAdminById(String id) {
        return adminMapper.findAdminById(id);
    }
}
