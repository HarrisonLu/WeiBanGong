package com.springapp.mvc.domain.contacts;

import com.springapp.mvc.domain.BaseDomain;

import java.util.List;

public class User extends BaseDomain {

    // id
    private Integer id;

    // 密码
    private String password;

    // 中文名称
    private String chineseName;

    // 中文名称拼音
    private String chineseNamePinyin;

    // 英文名称
    private String englishName;

    // 邮箱
    private String email;

    // 组别地位
    private String status;

    // 职位
    private String position;

    // 职位级别
    private String positionLevel;

    // 微信
    private String wechatNum;

    // QQ
    private String qqNum;

    // 座机号码
    private String telephoneNum;

    // 手机号码
    private String mobilePhoneNum;

    // 部门列表
    private List<Department> departmentList;

    // 组列表
    private List<Group> groupList;

    // 公司id
    private Integer companyId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPositionLevel() {
        return positionLevel;
    }

    public void setPositionLevel(String positionLevel) {
        this.positionLevel = positionLevel;
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

    public String getTelephoneNum() {
        return telephoneNum;
    }

    public void setTelephoneNum(String telephoneNum) {
        this.telephoneNum = telephoneNum;
    }

    public String getMobilePhoneNum() {
        return mobilePhoneNum;
    }

    public void setMobilePhoneNum(String mobilePhoneNum) {
        this.mobilePhoneNum = mobilePhoneNum;
    }

    public List<Department> getDepartmentList() {
        return departmentList;
    }

    public void setDepartmentList(List<Department> departmentList) {
        this.departmentList = departmentList;
    }

    public List<Group> getGroupList() {
        return groupList;
    }

    public void setGroupList(List<Group> groupList) {
        this.groupList = groupList;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }
}

