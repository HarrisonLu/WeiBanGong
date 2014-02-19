package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.User;
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
    public void insertUserIdCollectedContactsIdLink(Map<String, Integer> map);

    // 删除 成员id 和 收藏联系人id 关联
    public void deleteUserIdCollectedContactsIdLink(Map<String, Integer> map);

    // 根据 成员id 找 收藏联系人基本资料列表
    public List<User> selectCollectedContactsBaseInfoListByUserId(int userId);

    /// 插入 成员id 和 部门id 关联
    public void insertUserIdDepartmentIdLink(Map<String, Integer> map);

    /// 删除 成员id 和 部门id 关联
    public void deleteUserIdDepartmentIdLink(Map<String, Integer> map);

    /// 插入 成员id 和 组id 关联
    public void insertUserIdGroupIdLink(Map<String, Integer> map);

    /// 删除 成员id 和 组id 关联
    public void deleteUserIdGroupIdLink(Map<String, Integer> map);

    // 根据 成员id 找 所在组成员基本信息列表
    public List<User> searchGroupUserBaseInfoListByUserId(int userId);
}
