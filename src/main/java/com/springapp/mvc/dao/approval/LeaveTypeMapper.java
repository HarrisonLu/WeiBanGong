package com.springapp.mvc.dao.approval;

import com.springapp.mvc.domain.approval.LeaveType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lion on 14-6-27.
 */
@Repository
public interface LeaveTypeMapper {
    // 得到所有休假类型
    public List<LeaveType> getAllLeaveType();

    // 根据 休假类型id 找 休假类型
    public LeaveType selectLeaveTypeByLeaveTypeId(int leaveTypeId);
}
