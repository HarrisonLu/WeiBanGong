package com.springapp.mvc.dao.customer;

import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.Customer;

import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-3-6.
 */
public interface CustomerMapper {

    // 插入 客户
    public void insertCustomer(Customer customer);

    // 更新 客户信息
    public void updateCustomerInfo(Customer customer);

    // 根据 字符串 和 成员id 模糊搜索 客户列表
    public List<Customer> fuzzySelectCustomerList(Map<String, String> map);

    // 根据 成员id 找 我的客户基本资料列表
    public List<Customer> selectMyCustomerList(int userId);

    // 根据 成员id 找 共享客户基本资料别表
    public List<Customer> selectSharedCustomerList(int userId);

    // 根据 成员id、客户所处阶段 找 客户基本资料列表
    public List<Customer> selectCustomerListByDiscussStage(Map<String, Integer> map);

    // 根据 客户id 找 客户详细资料
    public Customer selectCustomerDetails(int customerId);
}