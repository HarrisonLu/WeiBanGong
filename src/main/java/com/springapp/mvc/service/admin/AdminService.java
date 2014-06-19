package com.springapp.mvc.service.admin;

import com.springapp.mvc.dao.admin.AdministratorMapper;
import com.springapp.mvc.dao.admin.CompanyMapper;
import com.springapp.mvc.dao.contacts.DepartmentMapper;
import com.springapp.mvc.dao.contacts.GroupMapper;
import com.springapp.mvc.dao.contacts.UserMapper;
import com.springapp.mvc.domain.admin.Administrator;
import com.springapp.mvc.domain.admin.Company;
import com.springapp.mvc.domain.contacts.Department;
import com.springapp.mvc.domain.contacts.Group;
import com.springapp.mvc.domain.contacts.User;
import com.tool.ChineseToPinyin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lion on 14-6-8.
 */
@Service
@Transactional
public class AdminService {

    @Autowired
    UserMapper userMapper;
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    GroupMapper groupMapper;
    @Autowired
    AdministratorMapper administratorMapper;
    @Autowired
    CompanyMapper companyMapper;

    /* 账号登录
       返回：账户类型（0为登录失败，1为管理员账户，2为用户账户），公司id，账户id
    */
    public Map<String, Integer> login(String accountNum, String password) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("accountNum", accountNum);
        map.put("password", password);

        Integer accountType = 0;
        Integer companyId = 0;
        Integer accountId = 0;

        // 登录成功
        // 为管理员账户
        if (administratorMapper.hasAccountWithAdmin(map).equals(1)) {
            Administrator administrator = administratorMapper.selectAdminDetailByAccountNumAndPassword(map);
            accountType = 1;
            companyId = administrator.getCompanyId();
            accountId = administrator.getId();
        }
        // 为用户账户
        else if (userMapper.hasAccountWithUser(map).equals(1)) {
            User user = userMapper.selectUserDetailByAccountNumAndPassword(map);
            accountType = 2;
            companyId = user.getCompanyId();
            accountId = user.getId();
        }

        Map<String, Integer> returnMap = new HashMap<String, Integer>();
        returnMap.put("accountType", accountType);
        returnMap.put("companyId", companyId);
        returnMap.put("accountId", accountId);

        return returnMap;
    }

//    // 判断 账号 是否 存在
//    public boolean hasAccount(String accountNum, String password){
//        Map<String, String> map= new HashMap<String, String>();
//        map.put("accountNum", accountNum);
//        map.put("password", password);
//        return administratorMapper.hasAccountWithAdmin(map).equals(1) || userMapper.hasAccountWithUser(map).equals(1);
//    }
//
//    // 根据 账号和密码 找 管理员详细资料
//    public Administrator selectAdminDetailByAccountNumAndPassword(String accountNum, String password){
//        Map<String, String> map= new HashMap<String, String>();
//        map.put("accountNum", accountNum);
//        map.put("password", password);
//        return administratorMapper.selectAdminDetailByAccountNumAndPassword(map);
//    }
//
//    // 根据 账号和密码 找 成员详细资料
//    public User selectUserDetailByAccountNumAndPassword(String accountNum, String password){
//        Map<String, String> map= new HashMap<String, String>();
//        map.put("accountNum", accountNum);
//        map.put("password", password);
//        return userMapper.selectUserDetailByAccountNumAndPassword(map);
//    }

    // 插入 公司
    public boolean insertCompany(Company company) {
        return companyMapper.insertCompany(company).equals(1);
    }

    // 插入 管理员
    public boolean insertAdmin(Administrator administrator) {
        return administratorMapper.insertAdmin(administrator).equals(1);
    }

    // 更新 成员 详细信息
    public void updateUserDetail(User user) {
        userMapper.updateUserInfo(user);
    }

    // 修改 成员 密码
    public void updateUserPassword(User user) {
        userMapper.updateUserPassword(user);
    }

    // 更新 管理员 详细信息
    public boolean updateAdminDetail(Administrator administrator) {
        return administratorMapper.updateAdminDetail(administrator).equals(1);
    }

    // 修改 管理员 密码
    public void updateAdminPassword(Administrator administrator) {
        administratorMapper.updateAdminPassword(administrator);
    }

    // 插入 部门
    public boolean insertDepartment(Department department) {
        return departmentMapper.insertDepartment(department).equals(1);
    }

    // 插入 组
    public boolean insertGroup(Group group) {
        return groupMapper.insertGroup(group).equals(1);
    }

    // 插入 成员
    public boolean insertUser(User user) {
        String chineseNamePinYin = ChineseToPinyin.getStringPinYin(user.getChineseName());
        user.setChineseNamePinyin(chineseNamePinYin);
        boolean bool = userMapper.insertUser(user).equals(1);

        return bool;
    }

    // 删除 部门
    public boolean deleteDepartment(int departmentId) {
        Department department = departmentMapper.selectDepartmentDetailsByDepartmentId(departmentId);
        List<Group> groupList = department.getGroupList();
        for (Group group : groupList) {
            deleteGroup(group.getId());
        }
        return departmentMapper.deleteDepartmentById(departmentId).equals(1);
    }

    // 删除 组
    public boolean deleteGroup(int groupId) {
        Group group = groupMapper.selectGroupDetailsByGroupId(groupId);
        List<User> userList = group.getUserList();
        for (User user : userList) {
            deleteUser(user.getId());
        }
        return groupMapper.deleteGroupById(groupId).equals(1);
    }

    // 删除 成员
    public boolean deleteUser(int userId) {
        return userMapper.deleteUserById(userId).equals(1);
    }

    // 判断 是否设置员工账号后缀
    public boolean hasUserAccountPostfix(int companyId) {
        return companyMapper.hasUserAccountPostfix(companyId).equals(1);
    }

    // 设置 员工账号后缀
    public boolean setUserAccountPostfix(Integer companyId, String userAccountPostfix) {
        if (hasUserAccountPostfix(companyId) == false) {
            Company company = new Company();
            company.setId(companyId);
            company.setSetUserAccountPostfix(true);
            company.setUserAccountPostfix(userAccountPostfix);
            companyMapper.setUserAccountPostfix(company);

            return true;
        } else {
            return false;
        }
    }

    // 根据 字符串 模糊搜索 成员基本信息列表
    public List<User> fuzzySelectUserBaseInfoListByString(String str, Integer companyId) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("str", str);
        map.put("companyId", Integer.toString(companyId));
        return userMapper.fuzzySelectUserBaseInfoListByString(map);
    }
}