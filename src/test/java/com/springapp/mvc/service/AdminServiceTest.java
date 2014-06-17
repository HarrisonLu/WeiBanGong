package com.springapp.mvc.service;

import com.springapp.mvc.domain.admin.Administrator;
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

        Administrator administrator = new Administrator();
        administrator.setEmail("GLY@yunnex.com");
        administrator.setPassword("asdf_1234");
        Assert.assertEquals(adminService.hasAccount(administrator.getEmail(), administrator.getPassword()), true);
    }

    @Test
    public void testSelectAdminDetailByAccountNumAndPassword() throws Exception {
        Administrator administrator = new Administrator();
        administrator.setEmail("GLY@yunnex.com");
        administrator.setPassword("asdf_1234");
        Assert.assertEquals(adminService.selectAdminDetailByAccountNumAndPassword(administrator.getEmail(), administrator.getPassword()).getPhoneNum(), "13999999999");
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
        Administrator administrator = new Administrator();
        administrator.setId(99);
        administrator.setEmail("AbilityMan@ability.com");
        administrator.setPassword("qwer_1234");
        administrator.setPhoneNum("13900000000");
        administrator.setCompanyId(2);

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
        Administrator administrator = new Administrator();
        administrator.setId(1);
        administrator.setEmail("GLY@yunnex.com");
        administrator.setPhoneNum("13999999999");
        administrator.setPassword("asdf_1234");
        adminService.updateAdminDetail(administrator);
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
