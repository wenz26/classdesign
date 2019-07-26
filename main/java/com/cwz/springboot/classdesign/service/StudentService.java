package com.cwz.springboot.classdesign.service;

import com.cwz.springboot.classdesign.dao.entity.Course;
import com.cwz.springboot.classdesign.dao.entity.Student;

import java.util.List;

public interface StudentService {
    public List<Student> findAllStudent(String name, String majornum);

    public Student findStudentById(String stu_id);

    public int updateStudent(Student student);

    public int deteleStudent(String stu_id);

    public int createStudent(Student student);

    public List<Course> findStudentCourse(String nameToCourse);

    public Course findStudentCourseById(String id, String courseno);

    public int updateStudentCourse(String id, String courseno, Integer grade);
}
