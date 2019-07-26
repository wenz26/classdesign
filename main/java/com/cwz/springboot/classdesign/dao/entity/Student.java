package com.cwz.springboot.classdesign.dao.entity;

import java.util.List;

public class Student {
    private String id;
    private String name;
    private String phone;
    private Integer age;
    private Integer grade;
    private String majornum;
    private Major major;
    private List<Course> courses;

    public Student(){}

    public Student(String id, String name, String phone, Integer age,
                   Integer grade, String majornum, Major major, List<Course> courses) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.age = age;
        this.grade = grade;
        this.majornum = majornum;
        this.major = major;
        this.courses = courses;
    }

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public Integer getAge() {
        return age;
    }
    public void setAge(Integer age) {
        this.age = age;
    }
    public Integer getGrade() {
        return grade;
    }
    public void setGrade(Integer grade) {
        this.grade = grade;
    }
    public String getMajornum() {
        return majornum;
    }
    public void setMajornum(String majornum) {
        this.majornum = majornum;
    }
    public Major getMajor() {
        return major;
    }
    public void setMajor(Major major) {
        this.major = major;
    }
    public List<Course> getCourses() {
        return courses;
    }
    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }
}