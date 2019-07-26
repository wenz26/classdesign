package com.cwz.springboot.classdesign.dao.mapper;

import com.cwz.springboot.classdesign.dao.BeanMapper;
import com.cwz.springboot.classdesign.dao.entity.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminMapper extends BeanMapper<Admin> {
    public Admin findAdminById(@Param("id") String id);
}