package com.springapp.mvc.domain.admin;

/**
 * Created by lion on 14-6-8.
 */
public class Company {

    // id
    private Integer id;
    // 名称
    private String name;
    // 员工账号后缀
    private String userAccountPostfix;
    // 是否设置员工账号后缀
    private boolean isSetUserAccountPostfix;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserAccountPostfix() {
        return userAccountPostfix;
    }

    public void setUserAccountPostfix(String userAccountPostfix) {
        this.userAccountPostfix = userAccountPostfix;
    }

    public boolean isSetUserAccountPostfix() {
        return isSetUserAccountPostfix;
    }

    public void setSetUserAccountPostfix(boolean isSetUserAccountPostfix) {
        this.isSetUserAccountPostfix = isSetUserAccountPostfix;
    }
}
