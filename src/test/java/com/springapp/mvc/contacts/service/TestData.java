package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;

/**
 * Created by Lion on 14-2-11.
 */

public class TestData {
    // 用户测试数据
    private User user_1 = new User();
    private User user_2 = new User();
    private User user_3 = new User();
    public  void printUserInfo(User user){
        System.out.println("id = " + user.getId());
        System.out.println("email = " + user.getEmail());
        System.out.println("password = " + user.getPassword());
        System.out.println("chineseName = " + user.getChineseName());
        System.out.println("englishName = " + user.getEnglishName());
        System.out.println("positionTitle = " + user.getPositionTitle());
        System.out.println("weChatNum = " + user.getWeChatNum());
        System.out.println("qqNum = " + user.getQqNum());
        System.out.println("phoneNum = " + user.getPhoneNum());
        System.out.println();
    }

    // 部门测试数据
    private Department department_1 = new Department();
    //private Department department_2 = new Department();

    // 模糊搜索测试数据
    public String fuzzyStr_fe = "fe";
    public String fuzzyStr_lu = "fe";
    public String fuzzyStr_s = "fe";
    public String fuzzyStr_lalala = "lalala";

    public TestData(){
        initUser_1();
        initUser_2();
        initUser_3();
        initDepartment_1();
    }

    public void initUser_1(){
        user_1.setId(1);
        user_1.setPassword("12345678_abcd");
        user_1.setChineseName("卢煌");
        user_1.setEnglishName("luhuang");
        user_1.setEmail("luhuang@qq.com");
        user_1.setPositionTitle("newHand");
        user_1.setWeChatNum("luhuanglalala");
        user_1.setQqNum("1212121212");
        user_1.setPhoneNum("13888888888");
    }
    public void initUser_2(){
        user_2.setId(2);
        user_2.setPassword("12345678_dcba");
        user_2.setChineseName("奋进");
        user_2.setEnglishName("fenjin");
        user_2.setEmail("fenjin@qq.com");
        user_2.setPositionTitle("engineer");
        user_2.setWeChatNum("fenjiang");
        user_2.setQqNum("170843737");
        user_2.setPhoneNum("13999999999");
    }
    public void initUser_3(){
        user_3.setId(3);
        user_3.setPassword("1234_dcba");
        user_3.setChineseName("烧猪");
        user_3.setEnglishName("shaozhu");
        user_3.setEmail("shaozhu@qq.com");
        user_3.setPositionTitle("engineer");
        user_3.setWeChatNum("shaozhuWeChat");
        user_3.setQqNum("170843722");
        user_3.setPhoneNum("13777777777");
    }
    public void initDepartment_1(){
        department_1.setId(1);
        department_1.setName("Technology");
    }

    public User getUser_1() {
        return user_1;
    }
    public void setUser_1(User user_1) {
        this.user_1 = user_1;
    }

    public User getUser_2() {
        return user_2;
    }
    public void setUser_2(User user_2) {
        this.user_2 = user_2;
    }

    public User getUser_3() {
        return user_3;
    }
    public void setUser_3(User user_3) {
        this.user_3 = user_3;
    }

    public Department getDepartment_1() {
        return department_1;
    }
    public void setDepartment_1(Department department_1) {
        this.department_1 = department_1;
    }
}
