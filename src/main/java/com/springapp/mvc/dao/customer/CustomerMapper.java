package com.springapp.mvc.dao.customer;

import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.Customer;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-3-6.
 */
@Repository
public interface CustomerMapper {

    // 插入 客户
    public Integer insertCustomer(Customer customer);

    // 更新 客户信息
    public void updateCustomerInfo(Customer customer);

    // 根据 字符串 和 成员id 模糊搜索 客户列表
    public List<Customer> fuzzySelectCustomerList(Map<String, String> map);

    // 根据 成员id 找 我的客户基本资料列表
    public List<Customer> selectMyCustomerList(int userId);

    // 根据 成员id 找 共享客户基本资料别表
    public List<Customer> selectSharedCustomerList(int userId);

    // 根据 成员id、客户所处阶段 找 我的客户基本资料列表
    public List<Customer> selectMyCustomerListByDiscussStage(Map<String, Integer> map);

    // 根据 成员id、客户所处阶段 找 共享客户基本资料列表
    public List<Customer> selectSharedCustomerListByDiscussStage(Map<String, Integer> map);

    // 根据 客户id 找 客户详细资料
    public Customer selectCustomerDetails(int customerId);

    // 根据 成员id 和 客户id 判断 客户是否为我的客户
    public Integer isMyCustomer(Map<String, Integer> map);

    // 模糊搜索 客户 列表
    public List<Customer> fuzzySelectCustomer(String str);

    // 根据 项目id 找 项目关联客户基本资料 列表
    public List<Customer> selectProjectCustomerListByProjectId(int projectId);

    // 根据 模块id 找 模块关联客户基本资料 列表
    public List<Customer> selectModuleCustomerListByModuleId(int moduleId);

    // 根据 任务id 找 任务关联客户基本资料 列表
    public List<Customer> selectTaskCustomerListByTaskId(int taskId);
}
