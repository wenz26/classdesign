package com.cwz.springboot.classdesign.controller;

import com.cwz.springboot.classdesign.dao.entity.Course;
import com.cwz.springboot.classdesign.dao.entity.Major;
import com.cwz.springboot.classdesign.dao.entity.Student;
import com.cwz.springboot.classdesign.service.MajorService;
import com.cwz.springboot.classdesign.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private MajorService majorService;

    @RequestMapping("/main")
    public String main(String name, String majornum, Model model,
                       @RequestParam(name="currentPage",defaultValue = "1") Integer pageNum,
                       @RequestParam(name="pageSize",defaultValue = "10") Integer pageSize) {

        PageHelper.startPage(pageNum, pageSize);
        List<Student> students = studentService.findAllStudent(name, majornum);
        PageInfo<Student> pageInfo = new PageInfo<>(students,6);
        model.addAttribute("pageInfo", pageInfo);

        List<Major> majors = majorService.selectAll();
        model.addAttribute("majors", majors);
        model.addAttribute("name", name);
        model.addAttribute("majornum", majornum);
        return "main";
    }

    @RequestMapping("/getStudentInfo")
    @ResponseBody
    public Student getStudentInfo(String stu_id) {
        Student student = studentService.findStudentById(stu_id);
        return student;
    }

    @RequestMapping("/updateStudent")
    @ResponseBody
    public String updateStudent(Student student) {
        try {
            int row = studentService.updateStudent(student);
            if(row > 0) {
                return "OK";
            }else {
                return "FALL";
            }
        }catch (Exception e){
            e.printStackTrace();
            return  "FALL";
        }
    }
    @RequestMapping("/deteleStudent")
    @ResponseBody
    public String deteleStudent(String stu_id) {
        try{
            int row = studentService.deteleStudent(stu_id);
            if(row > 0) {
                return "OK";
            }else {
                return "FALL";
            }
        }catch (Exception e){
            e.printStackTrace();
            return  "FALL";
        }
    }

    @RequestMapping("/createStudent")
    @ResponseBody
    public String createStudent(Student student) {
        try{
            int row = studentService.createStudent(student);
            if(row > 0) {
                return "OK";
            }else {
                return "FALL";
            }
        }catch (Exception e){
            e.printStackTrace();
            return  "FALL";
        }
    }

    @RequestMapping("/getAllStudentCourse")
    public String getAllStudentCourse(String name, String majornum, String nameToCourse,
        Model model, @RequestParam(name="currentPage",defaultValue = "1") Integer pageNum,
        @RequestParam(name="pageSize",defaultValue = "5") Integer pageSize){

        List<Course> courses = studentService.findStudentCourse(nameToCourse);
        PageHelper.startPage(pageNum, pageSize);
        PageInfo<Course> pageInfo = new PageInfo<>(courses,6);

        List<Major> majors = majorService.selectAll();
        model.addAttribute("majors", majors);
        model.addAttribute("majornum", majornum);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("sourcename", nameToCourse);
        return "course";
    }

    @RequestMapping("/getStudentCourse")
    @ResponseBody
    public Course getStudentCourse(String id, String courseno) {
        Course course = studentService.findStudentCourseById(id, courseno);
        return course;
    }

    @RequestMapping("/updateStudentCourse")
    @ResponseBody
    public String updateStudentCourse(String id, String courseno, Integer grade) {
        try {
            int row = studentService.updateStudentCourse(id, courseno, grade);
            if(row > 0) {
                return "OK";
            }else {
                return "FALL";
            }
        }catch (Exception e){
            e.printStackTrace();
            return "FALL";
        }
    }
}
