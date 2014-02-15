package com.springapp.mvc.contacts.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-2-15.
 */

@Repository
public interface LinkMapper {

    // 插入 成员id 和 收藏联系人id 关联
    public void insertUserIdCollectedContactsIdLink(int userId, int collectedContactsId);

    // 删除 成员id 和 收藏联系人id 关联
    public void deleteUserIdCollectedContactsIdLink(int userId, int collectedContactsId);

    // 根据 成员id 找 收藏联系人id列表
    public List<Integer> selectCollectedContactsIdListByUserId(int userId);

    // 插入 成员id 和 部门id 关联
    public void insertUserIdDepartmentIdLink(int userId, int departmentId);

    // 删除 成员id 和 部门id 关联
    public void deleteUserIdDepartmentIdLink(int userId, int departmentId);

    // 插入 成员id 和 组id 关联
    public void insertUserIdGroupIdLink(int userId, int groupId);

    // 删除 成员id 和 组id 关联
    public void deleteUserIdGroupIdLink(int userId, int groupId);

}
