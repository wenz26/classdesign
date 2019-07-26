package com.cwz.springboot.classdesign.dao.mapper;

import com.cwz.springboot.classdesign.dao.BeanMapper;
import com.cwz.springboot.classdesign.dao.entity.Course;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CourseMapper extends BeanMapper<Course> {

}