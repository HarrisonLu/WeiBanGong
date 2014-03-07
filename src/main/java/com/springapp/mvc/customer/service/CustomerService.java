package com.springapp.mvc.customer.service;

import com.springapp.mvc.dao.LinkMapper;
import com.springapp.mvc.dao.contacts.UserMapper;
import com.springapp.mvc.dao.customer.CommentMapper;
import com.springapp.mvc.dao.customer.CustomerMapper;
import com.springapp.mvc.dao.customer.DiscussStageMapper;
import com.springapp.mvc.dao.project.ProjectMapper;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.Comment;
import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.domain.customer.DiscussStage;
import com.springapp.mvc.domain.project.Project;
import com.springapp.mvc.domain.project.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-3-6.
 */
@Service
@Transactional
public class CustomerService {

    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private LinkMapper linkMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private DiscussStageMapper discussStageMapper;
    @Autowired
    private CommentMapper commentMapper;

    // 根据 英文字符串 和 成员id 模糊搜索 客户列表
    public List<Customer> fuzzySelectCustomer(int userId, String str){
        Map<String, String> map = new HashMap<String, String>();
        map.put("userId", Integer.toString(userId));
        map.put("str", str);
        return customerMapper.fuzzySelectCustomerList(map);
    }

    // 根据 成员id 找 我的客户基本资料列表
    public List<Customer> selectMyCustomerList(int userId){
        return customerMapper.selectMyCustomerList(userId);
    }

    // 根据 成员id 找 共享客户基本资料别表
    public List<Customer> selectSharedCustomerList(int userId){
        return customerMapper.selectSharedCustomerList(userId);
    }

    // 根据 成员id、客户所处阶段 找 客户基本资料列表
    public List<Customer> selectCustomerListByDiscussStage(int userId, int discussStageId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("discussStageId", discussStageId);
        return customerMapper.selectCustomerListByDiscussStage(map);
    }

    // 插入 客户
    public void insertCustomer(Customer custoemr){
        customerMapper.insertCustomer(custoemr);
    }

    // 根据 客户id 和 项目id 找 非项目成员的成员基本资料列表
    public List<User> selectOtherSharedUserList(int customerId, int projectId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("customerId", customerId);
        map.put("projectId", projectId);
        return linkMapper.selectOtherSharedUserList(map);
    }

    // 根据 字符串 模糊搜索 成员基本资料列表
    public List<User> fuzzySelectUserList(String str){
        return userMapper.fuzzySelectUserBaseInfoListByString(str);
    }

    // 插入 成员-客户共享关系
    public void insertUserSharedCustomerLink(int userId, int customerId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("customerId", customerId);
        linkMapper.insertUserSharedCustomerLink(map);
    }

    // 删除 成员-客户共享关系
    public void deleteUserSharedCustomerLink(int userId,int customerId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("customerId", customerId);
        linkMapper.deleteUserSharedCustomerLink(map);
    }

    // 根据 字符串 模糊搜索 项目基本资料列表
    public List<Project> fuzzySelectProjectBaseInfoList(String str){
        return projectMapper.fuzzySelectProjectBaseInfoList(str);
    }

    // 根据 字符串 和 项目id 模糊搜索 任务基本资料列表
    public List<Task> fuzzySelectTaskBaseInfoList(int projectId, String str){
        Map<String, String> map = new HashMap<String, String>();
        map.put("projectId", Integer.toString(projectId));
        map.put("str", str);
        return linkMapper.fuzzySelectTaskBaseInfoList(map);
    }

    // 找 所有 所处阶段列表
    public List<DiscussStage> selectAllDiscussStage(){
        return discussStageMapper.selectAllDiscussStage();
    }

    // 根据 客户id 找 客户详细资料
    public Customer selectCustomerDetails(int customerId){
        return customerMapper.selectCustomerDetails(customerId);
    }

    // 根据 项目id 和 用户id 判断 用户是否为项目成员
    public boolean isProjectMember(int userId, int projectId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("projectId", projectId);
        return linkMapper.isProjectMember(map);
    }

    // 根据 任务id 找 项目id
    public int selectProjectIdByTaskId(int taskId){
        return linkMapper.selectProjectIdByTaskId(taskId);
    }

    // 更新 客户
    public void updateCustomer(Customer customer){
        customerMapper.updateCustomerInfo(customer);
    }

    // 开启 与项目成员共享客户信息
    public void openProjectMemberShare(int customerId, int projectId){

    }

    // 关闭 与项目成员共享客户信息
    public void closeProjectMemberShare(int customerId, int projectId){

    }

    // 插入 评论
    public void insertComment(Comment comment){
        commentMapper.insertComment(comment);
    }

    // 根据 客户id 找 评论列表
    public List<Comment> selectCommentListByCustomerId(int customerId){
        return linkMapper.selectCommentListByCustomerId(customerId);
    }
}
