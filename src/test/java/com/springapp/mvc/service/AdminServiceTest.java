package com.springapp.mvc.service;

import com.springapp.mvc.domain.admin.Admin;
import com.springapp.mvc.domain.admin.Company;
import com.springapp.mvc.domain.contacts.Department;
import com.springapp.mvc.domain.contacts.Group;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.service.admin.AdminService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by lion on 14-6-9.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class AdminServiceTest {

    @Autowired
    AdminService adminService;

    @Test
    public void testHasAccount() throws Exception {
        User user_1 = new User();
        user_1.setEmail("luhuang@qq.com");
        user_1.setPassword("mima1");
        Assert.assertEquals(adminService.hasAccount(user_1.getEmail(), user_1.getPassword()), true);

        Admin admin = new Admin();
        admin.setEmail("GLY@yunnex.com");
        admin.setPassword("asdf_1234");
        Assert.assertEquals(adminService.hasAccount(admin.getEmail(), admin.getPassword()), true);
    }

    @Test
    public void testSelectAdminDetailByAccountNumAndPassword() throws Exception {
        Admin admin = new Admin();
        admin.setEmail("GLY@yunnex.com");
        admin.setPassword("asdf_1234");
        Assert.assertEquals(adminService.selectAdminDetailByAccountNumAndPassword(admin.getEmail(), admin.getPassword()).getPhoneNum(), "13999999999");
    }

    @Test
    public void testSelectUserDetailByAccountNumAndPassword() throws Exception {
        User user_1 = new User();
        user_1.setEmail("luhuang@qq.com");
        user_1.setPassword("mima1");
        Assert.assertEquals(adminService.selectUserDetailByAccountNumAndPassword(user_1.getEmail(), user_1.getPassword()).getChineseName(), "卢煌");
    }

    @Test
    public void testInsertCompany() throws Exception {
        Company company = new Company();
        company.setName("能力有限公司");
        company.setUserAccountPostfix("ability.com");

//        Assert.assertEquals(adminService.insertCompany(company), true);
    }

    @Test
    public void testInsertAdmin() throws Exception {
        Admin admin = new Admin();
        admin.setId(99);
        admin.setEmail("AbilityMan@ability.com");
        admin.setPassword("qwer_1234");
        admin.setPhoneNum("13900000000");
        admin.setCompanyId(2);

//        Assert.assertEquals(adminService.insertAdmin(admin), true);
    }

    @Test
    public void testUpdateUserDetail() throws Exception {
        User user = new User();
        user.setId(1);
        user.setPassword("mima1");
        user.setTelephoneNum("88886666");
        user.setMobilePhoneNum("13430325317");
        user.setQqNum("623360317");
        user.setEmail("luhuang@qq.com");
        user.setWechatNum("luhuanglh");
        adminService.updateUserDetail(user);
    }

    @Test
    public void testUpdateAdminDetail() throws Exception {
        Admin admin = new Admin();
        admin.setId(1);
        admin.setEmail("GLY@yunnex.com");
        admin.setPhoneNum("13999999999");
        admin.setPassword("asdf_1234");
        adminService.updateAdminDetail(admin);
    }

    @Test
    public void testInsertDepartment() throws Exception {
        Department department = new Department();
        department.setId(99);
        department.setName("微生物");
        department.setCompanyId(1);

//        Assert.assertEquals(adminService.insertDepartment(department), true);
    }

    @Test
    public void testInsertGroup() throws Exception {
        Group group = new Group();
        group.setId(99);
        group.setName("保密部");
        group.setDepartmentId(1);
        group.setCompanyId(1);

//        Assert.assertEquals(adminService.insertGroup(group), true);
    }

    @Test
    public void testInsertUser() throws Exception {
        User user = new User();
        user.setId(18);
        user.setPassword("mima18");
        user.setChineseName("成员十八");
        user.setEnglishName("eighteen");
        user.setEmail("eighteen@yunnex.com");
        user.setWechatNum("eighteenWechat");
        user.setCompanyId(1);

//        Assert.assertEquals(adminService.insertUser(user), true);
    }

    @Test
    public void testDeleteDepartment() throws Exception {
//        Assert.assertEquals(adminService.deleteDepartment(99), true);
    }

    @Test
    public void testDeleteGroup() throws Exception {
//        Assert.assertEquals(adminService.deleteGroup(99), true);
    }

    @Test
    public void testDeleteUser() throws Exception {
//        Assert.assertEquals(adminService.deleteUser(18), true);
    }

    @Test
    public void testHasUserAccountPostfix() throws Exception {
        Assert.assertEquals(adminService.hasUserAccountPostfix(1), false);
    }

    @Test
    public void testFuzzySelectUserBaseInfoListByString() throws Exception {
        List<User> userList = adminService.fuzzySelectUserBaseInfoListByString("卢", 1);
        Assert.assertEquals(userList.size(), 1);
    }
}
