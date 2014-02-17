package com.springapp.mvc.contacts.dao;

import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-2-15.
 */

@Repository
public interface LinkMapper {

    // 插入 成员id 和 收藏联系人id 关联
    public void insertUserIdCollectedContactsIdLink(HashMap<String, Integer> userId_collectedContactsId);

    // 删除 成员id 和 收藏联系人id 关联
    public void deleteUserIdCollectedContactsIdLink(HashMap<String, Integer> userId_collectedContactsId);

    // 根据 成员id 找 收藏联系人id列表
    public List<Integer> selectCollectedContactsIdListByUserId(int userId);

    // 插入 成员id 和 部门id 关联
    public void insertUserIdDepartmentIdLink(HashMap<String, Integer> userId_departmentId);

    // 删除 成员id 和 部门id 关联
    public void deleteUserIdDepartmentIdLink(HashMap<String, Integer> userId_departmentId);

    // 插入 成员id 和 组id 关联
    public void insertUserIdGroupIdLink(HashMap<String, Integer> userId_groupId);

    // 删除 成员id 和 组id 关联
    public void deleteUserIdGroupIdLink(HashMap<String, Integer> userId_groupId);

}
