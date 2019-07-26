package com.cwz.springboot.classdesign.dao.entity;

public class Admin {
    private String id;

    private String name;

    private String password;


    public Admin(String id, String name, String password) {
        this.id = id;
        this.name = name;
        this.password = password;
    }

    public Admin() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}