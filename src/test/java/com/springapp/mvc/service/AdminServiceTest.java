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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lion on 14-6-9.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class AdminServiceTest {

    @Autowired
    AdminService adminService;

//    @Test
//    public void testHasAccount() throws Exception {
//        User user_1 = new User();
//        user_1.setEmail("luhuang@qq.com");
//        user_1.setPassword("mima1");
//        Assert.assertEquals(adminService.hasAccount(user_1.getEmail(), user_1.getPassword()), true);
//
//        Administrator administrator = new Administrator();
//        administrator.setEmail("GLY@yunnex.com");
//        administrator.setPassword("asdf_1234");
//        Assert.assertEquals(adminService.hasAccount(administrator.getEmail(), administrator.getPassword()), true);
//    }
//
//    @Test
//    public void testSelectAdminDetailByAccountNumAndPassword() throws Exception {
//        Administrator administrator = new Administrator();
//        administrator.setEmail("GLY@yunnex.com");
//        administrator.setPassword("asdf_1234");
//        Assert.assertEquals(adminService.selectAdminDetailByAccountNumAndPassword(administrator.getEmail(), administrator.getPassword()).getPhoneNum(), "13999999999");
//    }
//
//    @Test
//    public void testSelectUserDetailByAccountNumAndPassword() throws Exception {
//        User user_1 = new User();
//        user_1.setEmail("luhuang@qq.com");
//        user_1.setPassword("mima1");
//        Assert.assertEquals(adminService.selectUserDetailByAccountNumAndPassword(user_1.getEmail(), user_1.getPassword()).getChineseName(), "卢煌");
//    }

    @Test
    public void testRegister() throws Exception {

        Company company = new Company();
        company.setName("金钱有限公司");
        company.setUserAccountPostfix("money.com");

        Administrator administrator = new Administrator();
        administrator.setEmail("moneyMan@money.com");
        administrator.setPassword("qwer_1234");
        administrator.setPhoneNum("13900000000");

//        Assert.assertEquals(adminService.register(administrator, company), true);
    }

    @Test
    public void testLogin() throws Exception {
        Map<String, Integer> map = new HashMap<String, Integer>();

        map = adminService.login("luhuang@qq.com", "mima1");
        Assert.assertEquals(map.get("accountType") == 2, true);

        map = adminService.login("GLY@yunnex.com", "asdf_1234");
        Assert.assertEquals(map.get("accountType") == 1, true);

        map = adminService.login("lalalala", "hahahahah");
        Assert.assertEquals(map.get("accountType") == 0, true);
    }

//    @Test
//    public void testInsertCompany() throws Exception {
//        Company company = new Company();
//        company.setName("能力有限公司");
//        company.setUserAccountPostfix("ability.com");
//
////        Assert.assertEquals(adminService.insertCompany(company), true);
//    }

//    @Test
//    public void testInsertAdmin() throws Exception {
//        Administrator administrator = new Administrator();
//        administrator.setId(99);
//        administrator.setEmail("AbilityMan@ability.com");
//        administrator.setPassword("qwer_1234");
//        administrator.setPhoneNum("13900000000");
//        administrator.setCompanyId(2);
//
////        Assert.assertEquals(adminService.insertAdmin(admin), true);
//    }

    @Test
    public void testUpdateUserDetail() throws Exception {
        User user = new User();
        user.setId(1);
        user.setTelephoneNum("88886666");
        user.setMobilePhoneNum("13430325317");
        user.setQqNum("623360317");
        user.setEmail("luhuang@qq.com");
        user.setWechatNum("luhuanglh");
        adminService.updateUserDetail(user);
    }

    @Test
    public void testUpdateUserPassword() throws Exception {
        User user = new User();
        user.setId(1);
        user.setPassword("mima1");
        adminService.updateUserPassword(user);
    }

    @Test
    public void testUpdateAdminDetail() throws Exception {
        Administrator administrator = new Administrator();
        administrator.setId(1);
        administrator.setEmail("GLY@yunnex.com");
        administrator.setPhoneNum("13999999999");
        adminService.updateAdminDetail(administrator);
    }

    @Test
    public void testUpdateAdminPassword() throws Exception {
        Administrator administrator = new Administrator();
        administrator.setId(1);
        administrator.setPassword("asdf_1234");
        adminService.updateAdminPassword(administrator);
    }

    @Test
    public void testInsertDepartment() throws Exception {
        Department department = new Department();
        department.setId(99);
        department.setName("微生物");
        department.setCompanyId(2);

        Assert.assertEquals(adminService.insertDepartment(department), true);
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
        Assert.assertEquals(adminService.deleteUser(18), true);
    }

    @Test
    public void testHasUserAccountPostfix() throws Exception {
        Assert.assertEquals(adminService.hasUserAccountPostfix(1), true);
    }

    @Test
    public void testSetUserAccountPostfix() throws Exception {
        Assert.assertEquals(adminService.setUserAccountPostfix(1, "lalala"), true);
    }

    @Test
    public void testFuzzySelectUserBaseInfoListByString() throws Exception {
        List<User> userList = adminService.fuzzySelectUserBaseInfoListByString("卢", 1);
        Assert.assertEquals(userList.size(), 1);
    }

    @Test
    public void testSelectAdminDetailsByAdminId() throws Exception {
        Administrator administrator = adminService.selectAdminDetailsByAdminId(1);
        Assert.assertEquals(administrator.getPhoneNum(), "13999999999");
    }

    @Test
    public void selectCompanyDetailsByCompanyId() throws Exception {
        Company company = adminService.selectCompanyDetailsByCompanyId(1);
        Assert.assertEquals(company.getName(), "云移有限公司");
    }

    @Test
    public void testInsertRightsForCreateProject() throws Exception {
//        Assert.assertEquals(adminService.insertRightsForCreateProject(1, 1), true);
    }

    @Test
    public void testDeleteRightsForCreateProject() throws Exception {
//        Assert.assertEquals(adminService.deleteRightsForCreateProject(1), true);
    }

    @Test
    public void testHasRightsForCreateProject() throws Exception {
        Assert.assertEquals(adminService.hasRightsForCreateProject(1), true);
    }

    @Test
    public void testInsertUserIdDepartmentIdLink() throws Exception {
        adminService.insertUserIdDepartmentIdLink(3, 2);
    }

    @Test
    public void testDeleteUserIdDepartmentIdLink() throws Exception {
        adminService.deleteUserIdDepartmentIdLink(3, 2);
    }

    @Test
    public void testInsertUserIdGroupIdLink() throws Exception {
        adminService.insertUserIdGroupIdLink(3, 3);
    }

    @Test
    public void testDeleteUserIdGroupIdLink() throws Exception {
        adminService.deleteUserIdGroupIdLink(3, 3);
    }
}
