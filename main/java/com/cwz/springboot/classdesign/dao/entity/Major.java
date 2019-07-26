package com.cwz.springboot.classdesign.dao.entity;

import java.util.List;

public class Major {
    private String majornum;

    private String major;

    private List<Student> students;

    public Major(String majornum, String major, List<Student> students) {
        this.majornum = majornum;
        this.major = major;
        this.students = students;
    }

    public Major() {
        super();
    }

    public String getMajornum() {
        return majornum;
    }

    public void setMajornum(String majornum) {
        this.majornum = majornum == null ? null : majornum.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
}