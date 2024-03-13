package com.fpt.prj301.model;

import java.io.Serializable;

public class User implements Serializable {

    private static final long serialVersionUID = 1387799847911863264L;

    private int id;
    private String email;
    private String name;
    private String avatar;
    private int mobile;
    private String address;
    private String password;
    private int code;
    private int role;
    private int discountId;

    public User() {
    }

    public User(int id, String email, String name, String avatar, int mobile, String address, String password, int code, int role, int discountId) {
        super();
        this.id = id;
        this.email = email;
        this.name = name;
        this.avatar = avatar;
        this.mobile = mobile;
        this.address = address;
        this.password = password;
        this.code = code;
        this.role = role;
        this.discountId = discountId;
    }

    public User(String email, String name, String avatar, int role) {
        super();
        this.email = email;
        this.name = name;
        this.avatar = avatar;
        this.role = role;
    }

    public User(int id) {
        this.id = id;
    }

    public User(String email, String password) {
        super();
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getMobile() {
        return mobile;
    }

    public void setMobile(int mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", email=" + email + ", name=" + name + ", avatar=" + avatar + ", mobile=" + mobile + ", address=" + address + ", password=" + password + ", code=" + code + ", role=" + role + ", discountId=" + discountId + '}';
    }
}
