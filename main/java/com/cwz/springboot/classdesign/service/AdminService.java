package com.cwz.springboot.classdesign.service;

import com.cwz.springboot.classdesign.dao.entity.Admin;

public interface AdminService {
    public Admin findAdminById(String id);
}
