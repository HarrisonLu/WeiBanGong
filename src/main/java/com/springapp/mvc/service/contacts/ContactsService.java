package com.springapp.mvc.service.contacts;

import com.springapp.mvc.dao.contacts.DepartmentMapper;
import com.springapp.mvc.dao.contacts.GroupMapper;
import com.springapp.mvc.dao.LinkMapper;
import com.springapp.mvc.dao.contacts.UserMapper;
import com.springapp.mvc.domain.contacts.Department;
import com.springapp.mvc.domain.contacts.Group;
import com.springapp.mvc.domain.contacts.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-2-9.
 */
@Service
@Transactional
public class ContactsService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private GroupMapper groupMapper;
    @Autowired
    private LinkMapper linkMapper;

    // 根据 字符串 模糊搜索 成员基本信息列表
    public List<User> fuzzySelectUserBaseInfoListByString(String str){
        return userMapper.fuzzySelectUserBaseInfoListByString(str);
    }

    // 根据 成员id 找 收藏联系人基本资料列表
    public List<User> selectCollectedContactsBaseInfoListByUserId(int userId){
        return linkMapper.selectCollectedContactsBaseInfoListByUserId(userId);
    }

    // 根据 成员id 找 所在组成员基本信息列表
    public List<User> searchGroupUserBaseInfoListByUserId(int userId){
        return linkMapper.searchGroupUserBaseInfoListByUserId(userId);
    }

    // 根据 成员id和联系人id 增加收藏联系人
    public void insertCollectedContacts(int userId, int collectedContactsId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("user_id", userId);
        map.put("collectedcontacts_id", collectedContactsId);
        linkMapper.insertUserIdCollectedContactsIdLink(map);
    }

    // 根据 成员id和联系人id 删除收藏联系人
    public void deleteCollectedContacts(int userId, int collectedContactsId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("user_id", userId);
        map.put("collectedcontacts_id", collectedContactsId);
        linkMapper.deleteUserIdCollectedContactsIdLink(map);
    }

    /// 判断 成员和联系人 是否为 收藏联系人关系
    public Boolean isCollectedContacts(int userId, int collectedContactsId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("user_id", userId);
        map.put("collectedcontacts_id", collectedContactsId);
        return userMapper.isCollectedContacts(map);
    }

    // 得到 所有部门基本信息
    public List<Department> selectAllDepartmentBaseInfo() {
        return departmentMapper.selectAllDepartmentBaseInfo();
    }

    // 根据 成员id 找 成员详细信息
    public User selectUserDetailsById(int userId){
        return userMapper.selectUserDetailsById(userId);
    }

    // 修改 成员信息
    public void updateUserInfo(User user) {
        userMapper.updateUserInfo(user);
    }

    // 根据 部门id 找 部门详细信息
    public Department selectDepartmentDetailsByDepartmentId(int departmentId){
        return departmentMapper.selectDepartmentDetailsByDepartmentId(departmentId);
    }

    // 根据 组id 找 组详细信息
    public Group selectGroupDetailsByGroupId(int groupId) {
        return groupMapper.selectGroupDetailsByGroupId(groupId);
    }

}
