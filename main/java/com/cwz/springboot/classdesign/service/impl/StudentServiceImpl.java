package com.cwz.springboot.classdesign.service.impl;

import com.cwz.springboot.classdesign.dao.entity.Course;
import com.cwz.springboot.classdesign.dao.entity.Student;
import com.cwz.springboot.classdesign.dao.mapper.StudentMapper;
import com.cwz.springboot.classdesign.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    public List<Student> findAllStudent(String name, String majornum) {
        return studentMapper.findAllStudent(name, majornum);
    }

    public Student findStudentById(String stu_id) {
        return studentMapper.findStudentById(stu_id);
    }

    public int updateStudent(Student student) {
        return studentMapper.updateStudent(student);
    }

    public int deteleStudent(String stu_id) {
        return studentMapper.deteleStudent(stu_id);
    }

    public int createStudent(Student student) {
        return studentMapper.createStudent(student);
    }

    public List<Course> findStudentCourse(String nameToCourse) {
        return studentMapper.findStudentCourse(nameToCourse);
    }

    public Course findStudentCourseById(String id, String courseno) {
        return studentMapper.findStudentCourseById(id, courseno);
    }

    public int updateStudentCourse(String id, String courseno, Integer grade) {
        return studentMapper.updateStudentCourse(id, courseno, grade);
    }


}
