package com.springapp.mvc.service;

import com.springapp.mvc.BaseTest;
import com.springapp.mvc.customer.service.CustomerService;
import com.springapp.mvc.domain.customer.Comment;
import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.domain.customer.DiscussStage;
import com.springapp.mvc.domain.project.Project;
import com.springapp.mvc.domain.project.Task;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Lion on 14-3-7.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class CustomerServiceTest extends BaseTest{

    @Autowired
    private CustomerService customerService;

    @Test
    public void testFuzzySelectCustomer() throws Exception {
        List<Customer> customerList = customerService.fuzzySelectCustomer(1,"t");
        Assert.assertEquals(customerList.size(), 3);
    }

    @Test
    public void testSelectMyCustomerList() throws Exception {
        List<Customer> customerList = customerService.selectMyCustomerList(1);

        Assert.assertEquals(customerList.size(), 4);

        Assert.assertEquals(customerList.get(0).getChineseName(),"客户一");
        Assert.assertEquals(customerList.get(0).getEnglishName(),"one");
        Assert.assertEquals(customerList.get(0).getProjectName(),"至善园6号616项目");
        Assert.assertEquals(customerList.get(0).getTaskName(),null);
//        Assert.assertEquals(customerList.get(3).getChineseName(),"客户四");
    }

    @Test
    public void testSelectSharedCustomerList() throws Exception {
        List<Customer> customerList = customerService.selectSharedCustomerList(1);

        Assert.assertEquals(customerList.size(), 2);

        Assert.assertEquals(customerList.get(0).getChineseName(),"客户七");
        Assert.assertEquals(customerList.get(0).getEnglishName(),"seven");
        Assert.assertEquals(customerList.get(0).getProjectName(),null);
        Assert.assertEquals(customerList.get(0).getTaskName(), "2号床任务");

        Assert.assertEquals(customerList.get(1).getChineseName(),"客户八");
        Assert.assertEquals(customerList.get(1).getEnglishName(),"eight");
        Assert.assertEquals(customerList.get(1).getProjectName(),null);
        Assert.assertEquals(customerList.get(1).getTaskName(),"3号床任务");

    }

    @Test
    public void testSelectCustomerListByDiscussStage() throws Exception {
        List<Customer> customerList = customerService.selectCustomerListByDiscussStage(1, 2);
        Assert.assertEquals(customerList.size(), 1);
        customerList = customerService.selectCustomerListByDiscussStage(2,4);
        Assert.assertEquals(customerList.size(), 2);
    }

    @Test
    public void testInsertCustomer() throws Exception {

    }

    @Test
    public void testSelectOtherSharedUserList() throws Exception {

    }

    @Test
    public void testFuzzySelectUserList() throws Exception {

    }

    @Test
    public void testInsertUserSharedCustomerLink() throws Exception {
        customerService.insertUserSharedCustomerLink(1, 5);
    }

    @Test
    public void testDeleteUserSharedCustomerLink() throws Exception {
        customerService.deleteUserSharedCustomerLink(1, 5);
    }

    @Test
    public void testFuzzySelectProjectBaseInfoList() throws Exception {
        List<Project> projectList = customerService.fuzzySelectProjectBaseInfoList("8");
        Assert.assertEquals(projectList.size(), 1);
        Assert.assertEquals(projectList.get(0).getName(), "至善园6号618项目");
    }

    @Test
    public void testFuzzySelectTaskBaseInfoList() throws Exception {
        List<Task> taskList = customerService.fuzzySelectTaskBaseInfoList(2, "3号");
        Assert.assertEquals(taskList.size(), 1);
        Assert.assertEquals(taskList.get(0).getName(), "3号床任务");
    }

    @Test
    public void testSelectAllDiscussStage() throws Exception {
        List<DiscussStage> discussStageList = customerService.selectAllDiscussStage();
        Assert.assertEquals(discussStageList.size(), 4);
        Assert.assertEquals(discussStageList.get(0).getName(), "未洽谈");
    }

    @Test
    public void testSelectCustomerDetails() throws Exception {
        Customer customer = customerService.selectCustomerDetails(5);
        Assert.assertEquals(customer.getChineseName(),"客户五");
        Assert.assertEquals(customer.getEnglishName(),"five");
        Assert.assertEquals(customer.getGender(),"男");
        Assert.assertEquals(customer.getPhone(),"135");
        Assert.assertEquals(customer.getWechatNum(),"wc5");
        Assert.assertEquals(customer.getQqNum(),"55");
        Assert.assertEquals(customer.getEmail(),"55@qq.com");
        Assert.assertEquals(customer.getOfficeAddress(),"5公司地址");
        Assert.assertEquals(customer.getHouseAddress(),"5街5号");
        Assert.assertEquals(customer.getCustomerValue(),"小鱼");
        Assert.assertEquals(customer.getProjectName(),"至善园6号618项目");
        Assert.assertEquals(customer.getTaskName(),null);
        Assert.assertEquals(customer.getDiscussStageName(),"未洽谈");
    }

    @Test
    public void testIsProjectMember() throws Exception {
//        Assert.assertEquals(customerService.isProjectMember(1,1), true);
//        Assert.assertEquals(customerService.isProjectMember(2,1), false);
//        Assert.assertEquals(customerService.isProjectMember(1,2), true);
//        Assert.assertEquals(customerService.isProjectMember(2,2), false);
    }

    @Test
    public void testSelectProjectIdByTaskId() throws Exception {
        Assert.assertEquals(customerService.selectProjectIdByTaskId(1), 1);
        Assert.assertEquals(customerService.selectProjectIdByTaskId(4), 1);
        Assert.assertEquals(customerService.selectProjectIdByTaskId(5), 2);
        Assert.assertEquals(customerService.selectProjectIdByTaskId(6), 2);
    }

    @Test
    public void testUpdateCustomer() throws Exception {
        Customer customer = customerService.selectCustomerDetails(5);
        customer.setChineseName("VIP客户五");
        customer.setCustomerValue("VIP金龙鱼");
        customer.setProjectId(null);
        customer.setTaskId(1);
        customerService.updateCustomer(customer);
        customer = customerService.selectCustomerDetails(5);
        Assert.assertEquals(customer.getChineseName(), "VIP客户五");
        Assert.assertEquals(customer.getCustomerValue(),"VIP金龙鱼");
        Assert.assertEquals(customer.getTaskName(),"1号床任务");
        customer.setChineseName("客户五");
        customer.setCustomerValue("小鱼");
        customer.setProjectId(1);
        customer.setTaskId(null);
        customerService.updateCustomer(customer);
    }

    @Test
    public void testOpenProjectMemberShare() throws Exception {

    }

    @Test
    public void testCloseProjectMemberShare() throws Exception {

    }

    @Test
    public void testInsertComment() throws Exception {

    }

    @Test
    public void testSelectCommentListByCustomerId() throws Exception {
        List<Comment> commentList = customerService.selectCommentListByCustomerId(1);
        Assert.assertEquals(commentList.size(), 2);
    }
}