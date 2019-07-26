package com.cwz.springboot.classdesign;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@MapperScan(basePackages = "com.cwz.springboot.classdesign.dao.mapper")
@SpringBootApplication
public class ClassdesignApplication {

    public static void main(String[] args) {
        SpringApplication.run(ClassdesignApplication.class, args);
    }

}
