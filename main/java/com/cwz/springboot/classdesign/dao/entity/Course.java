package com.cwz.springboot.classdesign.dao.entity;

import java.util.List;

public class Course {
    private String courseno;

    private String coursename;

    private String teacher;

    private List<Student> students;

    public Course(String courseno, String coursename, String teacher, List<Student> students) {
        this.courseno = courseno;
        this.coursename = coursename;
        this.teacher = teacher;
        this.students = students;
    }

    public Course() {
        super();
    }

    public String getCourseno() {
        return courseno;
    }

    public void setCourseno(String courseno) {
        this.courseno = courseno == null ? null : courseno.trim();
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename == null ? null : coursename.trim();
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher == null ? null : teacher.trim();
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
}