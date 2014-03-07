package com.springapp.mvc.domain.customer;

/**
 * Created by Lion on 14-3-6.
 */
public class Customer {
    private int id;
    private String chineseName;
    private String chineseNamePinyin;
    private String englishName;
    private String gender;
    private String phone;
    private String wechatNum;
    private String qqNum;
    private String email;
    private String officeAddress;
    private String houseAddress;
    private String customerValue;
    private String projectName;
    private String taskName;
    private String discussStageName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getChineseName() {
        return chineseName;
    }

    public void setChineseName(String chineseName) {
        this.chineseName = chineseName;
    }

    public String getChineseNamePinyin() {
        return chineseNamePinyin;
    }

    public void setChineseNamePinyin(String chineseNamePinyin) {
        this.chineseNamePinyin = chineseNamePinyin;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWechatNum() {
        return wechatNum;
    }

    public void setWechatNum(String wechatNum) {
        this.wechatNum = wechatNum;
    }

    public String getQqNum() {
        return qqNum;
    }

    public void setQqNum(String qqNum) {
        this.qqNum = qqNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOfficeAddress() {
        return officeAddress;
    }

    public void setOfficeAddress(String officeAddress) {
        this.officeAddress = officeAddress;
    }

    public String getHouseAddress() {
        return houseAddress;
    }

    public void setHouseAddress(String houseAddress) {
        this.houseAddress = houseAddress;
    }

    public String getCustomerValue() {
        return customerValue;
    }

    public void setCustomerValue(String customerValue) {
        this.customerValue = customerValue;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getDiscussStageName() {
        return discussStageName;
    }

    public void setDiscussStageName(String discussStageName) {
        this.discussStageName = discussStageName;
    }
}