package com.springapp.mvc.dao.contacts;

import com.springapp.mvc.domain.contacts.Group;
import org.springframework.stereotype.Repository;

/**
 * Created by Lion on 14-2-15.
 */

@Repository
public interface GroupMapper {

    /// 插入 组
    public void insertGroup(Group group);

    /// 修改 组
    public void updateGroup(Group group);

    /// 删除 组
    public void deleteGroupById(int groupId);

    // 根据 组id 找 组详细信息
    public Group selectGroupDetailsByGroupId(int groupId);

}
