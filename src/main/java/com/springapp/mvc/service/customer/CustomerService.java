package com.springapp.mvc.service.customer;

import com.springapp.mvc.dao.LinkMapper;
import com.springapp.mvc.dao.contacts.UserMapper;
import com.springapp.mvc.dao.customer.CommentCustomerMapper;
import com.springapp.mvc.dao.customer.CustomerMapper;
import com.springapp.mvc.dao.customer.DiscussStageMapper;
import com.springapp.mvc.dao.project.ModuleMapper;
import com.springapp.mvc.dao.project.ProjectMapper;
import com.springapp.mvc.dao.project.TaskMapper;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.CommentCustomer;
import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.domain.customer.DiscussStage;
import com.springapp.mvc.domain.project.Project;
import com.springapp.mvc.domain.project.Task;
import com.tool.ChineseToPinyin;
import com.tool.DateHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
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
    private ModuleMapper moduleMapper;
    @Autowired
    private TaskMapper taskMapper;
    @Autowired
    private DiscussStageMapper discussStageMapper;
    @Autowired
    private CommentCustomerMapper commentCustomerMapper;

    // 根据 英文字符串 和 成员id 模糊搜索 客户列表
    public List<Customer> fuzzySelectCustomer(int userId, String str) {
        Integer companyId = userMapper.selectUserDetailsById(userId).getCompanyId();
        Map<String, String> map = new HashMap<String, String>();
        map.put("userId", Integer.toString(userId));
        map.put("str", str);
        map.put("companyId", Integer.toString(companyId));
        return customerMapper.fuzzySelectCustomerList(map);
    }

    // 根据 成员id 找 我的客户基本资料列表
    @Cacheable(value = "customerMyListCache")
    public List<Customer> selectMyCustomerList(int userId) {
        Integer companyId = userMapper.selectUserDetailsById(userId).getCompanyId();
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("companyId", companyId);
        return customerMapper.selectMyCustomerList(map);
    }

    // 根据 成员id 找 共享客户基本资料别表
    @Cacheable(value = "customerSharedListCache")
    public List<Customer> selectSharedCustomerList(int userId) {
        Integer companyId = userMapper.selectUserDetailsById(userId).getCompanyId();
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("companyId", companyId);
        return customerMapper.selectSharedCustomerList(map);
    }

    // 判断 客户是否为我的客户
    public boolean isMyCustomer(int userId, int customerId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("customerId", customerId);

        return customerMapper.isMyCustomer(map).equals(1);
    }

    // 根据 成员id、客户所处阶段 找 我的客户基本资料列表
    @Cacheable(value = "customerMyFilterListCache")
    public List<Customer> selectMyCustomerListByDiscussStage(int userId, int discussStageId) {
        Integer companyId = userMapper.selectUserDetailsById(userId).getCompanyId();
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("discussStageId", discussStageId);
        map.put("companyId", companyId);
        return customerMapper.selectMyCustomerListByDiscussStage(map);
    }

    // 根据 成员id、客户所处阶段 找 共享客户基本资料列表
    @Cacheable(value = "customerSharedFilterListCache")
    public List<Customer> selectSharedCustomerListByDiscussStage(int userId, int discussStageId) {
        Integer companyId = userMapper.selectUserDetailsById(userId).getCompanyId();
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("discussStageId", discussStageId);
        map.put("companyId", companyId);
        return customerMapper.selectSharedCustomerListByDiscussStage(map);
    }

    // 插入 客户
//    @CacheEvict(value = {"customerMyListCache", "customerSharedListCache", "customerMyFilterListCache", "customerSharedFilterListCache"})
    public Integer insertCustomer(Customer customer) {
        String chineseName = customer.getChineseName();
        if (chineseName != null) {
            String chineseNamePinyin = ChineseToPinyin.getStringPinYin(chineseName);
            if (chineseNamePinyin != null) {
                customer.setChineseNamePinyin(chineseNamePinyin);
            }
        }

        return customerMapper.insertCustomer(customer);
    }

    // 根据 字符串 模糊搜索 成员基本资料列表
    public List<User> fuzzySelectUserList(String str, int companyId) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("str", str);
        map.put("companyId", Integer.toString(companyId));
        return userMapper.fuzzySelectUserBaseInfoListByString(map);
    }

    // 插入 成员-客户共享关系
    public Integer insertUserSharedCustomerLink(int userId, int customerId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("customerId", customerId);
        map.put("companyId", companyId);
        return linkMapper.insertUserSharedCustomerLink(map);
    }

    // 删除 成员-客户共享关系
    public Integer deleteUserSharedCustomerLink(int userId, int customerId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("customerId", customerId);
        return linkMapper.deleteUserSharedCustomerLink(map);
    }

    // 根据 字符串 模糊搜索 项目基本资料列表
    public List<Project> fuzzySelectProjectBaseInfoList(String str, int companyId) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("str", str);
        map.put("companyId", Integer.toString(companyId));
        return projectMapper.fuzzySelectProjectBaseInfoList(map);
    }

    // 根据 字符串 和 模块id 模糊搜索 任务基本资料列表
    public List<Task> fuzzySelectTaskBaseInfoList(int moduleId, String str, int companyId) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("moduleId", Integer.toString(moduleId));
        map.put("str", str);
        map.put("companyId", Integer.toString(companyId));
        return linkMapper.fuzzySelectTaskBaseInfoList(map);
    }

    // 找 所有 所处阶段列表
    public List<DiscussStage> selectAllDiscussStage() {
        return discussStageMapper.selectAllDiscussStage();
    }

    // 根据 客户id 找 客户详细资料
    @Cacheable(value = "customerDetailCache")
    public Customer selectCustomerDetails(int customerId) {
        Customer customer = customerMapper.selectCustomerDetails(customerId);
        if (customer.getBirthday() != null) {
            String dateString = DateHelper.dateToString(customer.getBirthday());
            customer.setBirthdayString(dateString);
        }
        return customer;
    }

    // 根据 任务id 找 模块id
    public int selectModuleIdByTaskId(int taskId) {
        return linkMapper.selectModuleIdByTaskId(taskId);
    }

    // 更新 客户
    public void updateCustomer(Customer customer) {
        String chineseName = customer.getChineseName();
        if (chineseName != null) {
            String chineseNamePinyin = ChineseToPinyin.getStringPinYin(chineseName);
            if (chineseNamePinyin != null) {
                customer.setChineseNamePinyin(chineseNamePinyin);
            }
        }

        customerMapper.updateCustomerInfo(customer);
    }

    // 插入 客户评论
    public Integer insertCommentCustomer(CommentCustomer commentCustomer) {
        return commentCustomerMapper.insertCommentCustomer(commentCustomer);
    }

    // 根据 客户id 找 评论列表
    @Cacheable(value = "customerCommentCache")
    public List<CommentCustomer> selectCommentCustomerListByCustomerId(int customerId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("customerId", customerId);
        map.put("companyId", companyId);
        List<CommentCustomer> commentCustomerList = commentCustomerMapper.selectCommentCustomerListByCustomerId(map);
        for (CommentCustomer commentCustomer : commentCustomerList) {
            if (commentCustomer.getTime() != null) {
                String displayString = DateHelper.getShortTime(commentCustomer.getTime());
                if (displayString != null) {
                    commentCustomer.setDisplayTime(displayString);
                }
            }
        }
        return commentCustomerList;
    }
}
