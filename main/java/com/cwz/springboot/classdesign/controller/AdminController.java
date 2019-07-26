package com.cwz.springboot.classdesign.controller;

import com.cwz.springboot.classdesign.dao.entity.Admin;
import com.cwz.springboot.classdesign.dao.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminMapper adminMapper;

    @RequestMapping("/admin")
    public String admin(String id, Model model){
        Admin admin = adminMapper.findAdminById(id);
        model.addAttribute("admin", admin);
        return "index";
    }

    @RequestMapping("/getAdminInfo")
    public String getAdminInfo(String id, Model model){
        Admin admin = adminMapper.findAdminById(id);
        model.addAttribute("admin", admin);
        return "admin";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }
}
