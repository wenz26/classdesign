package com.cwz.springboot.classdesign.dao.mapper;

import com.cwz.springboot.classdesign.dao.BeanMapper;
import com.cwz.springboot.classdesign.dao.entity.Course;
import com.cwz.springboot.classdesign.dao.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface StudentMapper extends BeanMapper<Student> {
    public List<Student> findAllStudent(@Param("name") String name,
                                        @Param("majornum") String majornum);

    public Student findStudentById(@Param("stu_id") String stu_id);

    public int updateStudent(Student student);

    public int deteleStudent(@Param("stu_id") String stu_id);

    public int createStudent(Student student);

    public List<Course> findStudentCourse(@Param("nameToCourse") String nameToCourse);

    public Course findStudentCourseById(@Param("id") String id,
                                        @Param("courseno") String courseno);

    public int updateStudentCourse(@Param("id")String id,
                                   @Param("courseno") String courseno,
                                   @Param("grade") Integer grade);
}