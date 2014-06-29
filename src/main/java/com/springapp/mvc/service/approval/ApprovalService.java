package com.springapp.mvc.service.approval;

import com.springapp.mvc.dao.approval.*;
import com.springapp.mvc.dao.contacts.DepartmentMapper;
import com.springapp.mvc.dao.contacts.UserMapper;
import com.springapp.mvc.domain.approval.*;
import com.springapp.mvc.domain.contacts.Department;
import com.springapp.mvc.domain.contacts.User;
import com.tool.DateHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by lion on 14-6-26.
 */

@Service
@Transactional
public class ApprovalService {

    @Autowired
    private ApprovalMapper approvalMapper;
    @Autowired
    private ApprovalTypeMapper approvalTypeMapper;
    @Autowired
    private ClaimItemMapper claimItemMapper;
    @Autowired
    private ClaimTypeMapper claimTypeMapper;
    @Autowired
    private FundsItemMapper fundsItemMapper;
    @Autowired
    private FundsTypeMapper fundsTypeMapper;
    @Autowired
    private GoodsItemMapper goodsItemMapper;
    @Autowired
    private GoodsTypeMapper goodsTypeMapper;
    @Autowired
    private LeaveTypeMapper leaveTypeMapper;
    @Autowired
    private CommentApprovalMapper commentApprovalMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private DepartmentMapper departmentMapper;

    // 根据 用户id 找 我的审批列表
    public List<Approval> getMyApprovalList(int userId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("companyId", companyId);
        List<Approval> approvalList = approvalMapper.getMyApprovalList(map);
        for (Approval approval : approvalList){
            String displaySubmitTime = DateHelper.timestampToStr2(approval.getSubmitTime());
            if (displaySubmitTime != null)
                approval.setDisplaySubmitTime(displaySubmitTime);
        }
        return approvalList;
    }
    // 根据 用户id 找 我的待审审批列表
    public List<Approval> getMyWaitingApprovalList(int userId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("companyId", companyId);
        List<Approval> approvalList = approvalMapper.getMyWaitingApprovalList(map);
        for (Approval approval : approvalList){
            String displaySubmitTime = DateHelper.timestampToStr2(approval.getSubmitTime());
            if (displaySubmitTime != null)
                approval.setDisplaySubmitTime(displaySubmitTime);
        }
        return approvalList;
    }
    // 插入 审批
    public boolean insertApproval(Approval approval){
        return approvalMapper.insertApproval(approval).equals(1);
    }
    // 根据 字符串 模糊搜索 成员基本信息列表
    public List<User> fuzzySelectUserBaseInfoListByString(String str, int companyId){
        Map<String, String> map = new HashMap<String, String>();
        map.put("str", str);
        map.put("companyId", Integer.toString(companyId));
        return userMapper.fuzzySelectUserBaseInfoListByString(map);
    }
    // 插入 费用明细
    public boolean insertClaimItem(ClaimItem claimItem){
        return claimItemMapper.insertClaimItem(claimItem).equals(1);
    }
    // 根据 审批id 得到 费用明细金额
    public double getClaimItemAmountByApprovalId(int approvalId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("approvalId", approvalId);
        map.put("companyId", companyId);
        List<ClaimItem> claimItemList = claimItemMapper.selectClaimItemByApprovalId(map);
        double sum = 0;
        for (ClaimItem claimItem : claimItemList) {
            Double amount = claimItem.getAmount();
            if (amount != null)
                sum += amount;
        }
        return sum;
    }
    // 插入 经费预估
    public boolean insertFundsItem(FundsItem fundsItem){
        return fundsItemMapper.insertFundsItem(fundsItem).equals(1);
    }
    // 根据 审批id 得到 经费预估金额
    public double getFundsItemAmountByApprovalId(int approvalId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("approvalId", approvalId);
        map.put("companyId", companyId);
        List<FundsItem> fundsItemList = fundsItemMapper.selectFundsItemByApprovalId(map);
        double sum = 0;
        for (FundsItem fundsItem : fundsItemList) {
            Double amount = fundsItem.getAmount();
            if (amount != null)
                sum += amount;
        }
        return sum;
    }
    // 插入 物品清单
    public boolean insertGoodsItem(GoodsItem goodsItem){
        return goodsItemMapper.insertGoodsItem(goodsItem).equals(1);
    }
    // 根据 物品审批id 得到 物品清单金额
    public double getGoodsItemAmountByApprovalId(int approvalId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("approvalId", approvalId);
        map.put("companyId", companyId);
        List<GoodsItem> goodsItemList = goodsItemMapper.selectGoodsItemByApprovalId(map);
        double sum = 0;
        for (GoodsItem goodsItem : goodsItemList) {
            Double price = goodsItem.getPrice();
            Integer num = goodsItem.getNum();
            double amount = 0;
            if (price != null && num != null)
                amount = price * num;
            sum += amount;
        }
        return sum;
    }
    // 根据 开始时间 和 结束时间 得到 出差时数
    // 根据 开始时间 和 结束时间 得到 加班时数
    // 根据 开始时间 和 结束时间 得到 休假时数
    // 得到所有休假类型
    public List<LeaveType> getAllLeaveType(){
        return leaveTypeMapper.getAllLeaveType();
    }
    // 得到所有费用类型
    public List<ClaimType> getAllClaimType(){
        return claimTypeMapper.getAllClaimType();
    }
    // 得到所有经费类型
    public List<FundsType> getAllFundsType(){
        return fundsTypeMapper.getAllFundsType();
    }
    // 得到所有物品类型
    public List<GoodsType> getAllGoodsType(){
        return goodsTypeMapper.getAllGoodsType();
    }
    // 删除 费用明细
    public boolean deleteClaimItem(int claimItemId){
        return claimItemMapper.deleteClaimItem(claimItemId).equals(1);
    }
    // 删除 经费预估
    public boolean deleteFundsItem(int fundsItemId){
        return fundsItemMapper.deleteFundsItem(fundsItemId).equals(1);
    }
    // 删除 物品清单
    public boolean deleteGoodsItem(int goodsItemId){
        return goodsItemMapper.deleteGoodsItem(goodsItemId).equals(1);
    }
    // 根据 审批id 找 费用明细列表
    public List<ClaimItem> selectClaimItemByApprovalId(int approvalId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("approvalId", approvalId);
        map.put("companyId", companyId);
        return claimItemMapper.selectClaimItemByApprovalId(map);
    }
    // 根据 审批id 找 经费预估列表
    public List<FundsItem> selectFundsItemByApprovalId(int approvalId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("approvalId", approvalId);
        map.put("companyId", companyId);
        return fundsItemMapper.selectFundsItemByApprovalId(map);
    }
    // 根据 审批id 找 物品清单列表
    public List<GoodsItem> selectGoodsItemByApprovalId(int approvalId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("approvalId", approvalId);
        map.put("companyId", companyId);
        return goodsItemMapper.selectGoodsItemByApprovalId(map);
    }
    // 得到 所有审批类型列表
    public List<ApprovalType> getAllApprovalType(){
        return approvalTypeMapper.getAllApprovalType();
    }
    // 根据 用户id 找 草稿审批列表
    public List<Approval> selectDraftApprovalListByUserId(int userId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("companyId", companyId);
        List<Approval> approvalList = approvalMapper.selectDraftApprovalListByUserId(map);
        for (Approval approval : approvalList){
            String displaySubmitTime = DateHelper.timestampToStr2(approval.getSubmitTime());
            if (displaySubmitTime != null)
                approval.setDisplaySubmitTime(displaySubmitTime);
        }
        return approvalList;
    }
    // 删除 草稿审批
    public boolean deleteDraftApproval(int approvalId){
        claimItemMapper.deleteAllClaimItemByApprovalId(approvalId);
        fundsItemMapper.deleteAllFundsItemByApprovalId(approvalId);
        goodsItemMapper.deleteAllGoodsItemByApprovalId(approvalId);
        return approvalMapper.deleteApproval(approvalId).equals(1);
    }
    // 根据 用户id 删除 所有草稿审批
    public void deleteAllDraftApprovalByUserId(int userId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("companyId", companyId);
        List<Approval> approvalList = approvalMapper.selectDraftApprovalListByUserId(map);
        for (Approval approval : approvalList) {
            deleteDraftApproval(approval.getId());
        }
    }
    // 更新 审批
    public void updateApproval(Approval approval){
        approvalMapper.updateApproval(approval);
    }
//    // 得到 近六个月的时间字符串列表
//    public List<String> getRecentMonthsString(){
//
//    }
    // 根据 用户id 和 月份时间 找 归档审批列表
    public List<Approval> selectArchiveApprovalListByUserIdAndMonth(int userId, int month, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("companyId", companyId);
        List<Approval> approvalList = approvalMapper.selectArchiveApprovalListByUserId(map);
        List<Approval> approvalWithMonthList = new LinkedList<Approval>();
        for (Approval approval : approvalList){
            if (approval.getSubmitTime().getMonth() + 1 == month){
                approvalWithMonthList.add(approval);
            }
        }
        for (Approval approval : approvalWithMonthList){
            String displaySubmitTime = DateHelper.timestampToStr2(approval.getSubmitTime());
            if (displaySubmitTime != null)
                approval.setDisplaySubmitTime(displaySubmitTime);
        }
        return approvalWithMonthList;
    }
    // 根据 审批id 找 审批详细资料
    public Approval getApprovalDetailByApprovalId(int approvalId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("approvalId", approvalId);
        map.put("companyId", companyId);
        Approval approval = approvalMapper.getApprovalDetailByApprovalId(map);

        if (approval.getSubmitTime() != null)
            approval.setDisplaySubmitTime(DateHelper.timestampToStr2(approval.getSubmitTime()));

        if (approval.getApplicantId() != null){
            String applicantName = userMapper.selectUserDetailsById(approval.getApplicantId()).getChineseName();
            if (applicantName != null)
                approval.setApplicantName(applicantName);
        }
        if (approval.getDepartmentId() != null){
            String departmentName = departmentMapper.selectDepartmentDetailsByDepartmentId(approval.getDepartmentId()).getName();
            if (departmentName != null)
                approval.setDepartmentName(departmentName);
        }

        if (approval.getFirstApprovalUserId() != null){
            String firstApprovalUserName = userMapper.selectUserDetailsById(approval.getFirstApprovalUserId()).getChineseName();
            if (firstApprovalUserName != null)
                approval.setFirstApprovalUserName(firstApprovalUserName);
        }

        if (approval.getSecondApprovalUserId() != null){
            String secondApprovalUserName = userMapper.selectUserDetailsById(approval.getSecondApprovalUserId()).getChineseName();
            if (secondApprovalUserName != null)
                approval.setSecondApprovalUserName(secondApprovalUserName);
        }

        if (approval.getBeCarbonCopyUserId() != null){
            String beCarbonCopyUserName = userMapper.selectUserDetailsById(approval.getBeCarbonCopyUserId()).getChineseName();
            if (beCarbonCopyUserName != null)
                approval.setBeCarbonCopyUserName(beCarbonCopyUserName);
        }

        if (approval.getCurrentApprovalUserId() != null){
            String currentApprovalUserName = userMapper.selectUserDetailsById(approval.getCurrentApprovalUserId()).getChineseName();
            if (currentApprovalUserName != null)
                approval.setCurrentApprovalUserName(currentApprovalUserName);
        }

        if (approval.getClaimTypeId() != null) {
            String claimTypeName = claimTypeMapper.selectClaimTypeByClaimTypeId(approval.getClaimTypeId()).getName();
            if (claimTypeName != null)
                approval.setClaimTypeName(claimTypeName);
        }
        else if (approval.getFundsTypeId() != null) {
            String fundsTypeName = fundsTypeMapper.selectFundsTypeByFundsTypeId(approval.getFundsTypeId()).getName();
            if (fundsTypeName != null)
                approval.setFundsTypeName(fundsTypeName);
        }
        else if (approval.getGoodsTypeId() != null) {
            String goodsTypeName = goodsTypeMapper.selectGoodsTypeByGoodsTypeId(approval.getGoodsTypeId()).getName();
            if (goodsTypeName != null)
                approval.setGoodsTypeName(goodsTypeName);
        }
        else if (approval.getLeaveTypeId() != null) {
            String leaveTypeName = leaveTypeMapper.selectLeaveTypeByLeaveTypeId(approval.getLeaveTypeId()).getName();
            if (leaveTypeName != null)
                approval.setLeaveTypeName(leaveTypeName);
        }

        if (approval.getStartTime() != null)
            approval.setDisplayStartTime(DateHelper.timestampToStr2(approval.getStartTime()));
        if (approval.getEndTime() != null)
            approval.setDisplayEndTime(DateHelper.timestampToStr2(approval.getEndTime()));

        return approval;
    }
    // 插入 审批评论
    public boolean insertCommentApproval(CommentApproval commentApproval){
        return commentApprovalMapper.insertCommentApproval(commentApproval).equals(1);
    }
    // 删除 审批评论
    public boolean deleteCommentApproval(int commentApprovalId){
        return commentApprovalMapper.deleteCommentApproval(commentApprovalId).equals(1);
    }
    // 根据 审批id 得到 审批评论列表
    public List<CommentApproval> selectCommentApprovalListByApprovalId(int approvalId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("approvalId", approvalId);
        map.put("companyId", companyId);
        List<CommentApproval> commentApprovalList = commentApprovalMapper.selectCommentApprovalListByApprovalId(map);
        for (CommentApproval commentApproval : commentApprovalList){
            if (commentApproval.getCreateTime() != null)
                commentApproval.setDisplayCreateTime(DateHelper.getShortTime(commentApproval.getCreateTime()));

            if (commentApproval.getIsPass() == 1)
                commentApproval.setDisplayIsPass("通过");
            else if(commentApproval.getIsPass() == 0)
                commentApproval.setDisplayIsPass("驳回");
        }

        return commentApprovalList;
    }

    // 根据 用户id 得到 用户部门
    public Department selectDepartmentByUserId(int userId){
        User user = userMapper.selectUserDetailsById(userId);
        List<Department> departmentList = user.getDepartmentList();
        return departmentList.get(0);
    }

    // 插入 抄送审批
    public boolean insertCarbonCopyApproval(int approvalId, int beCarbonCopyId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("approvalId", approvalId);
        map.put("beCarbonCopyId", beCarbonCopyId);
        map.put("companyId", companyId);
        return approvalMapper.insertCarbonCopyApproval(map).equals(1);
    }
    // 删除 抄送审批
    public boolean deleteCarbonCopyApproval(int carbonCopyApprovalId){
        return approvalMapper.deleteCarbonCopyApproval(carbonCopyApprovalId).equals(1);
    }
    // 根据 用户id 得到 抄送审批列表
    public List<Approval> selectCarbonCopyApprovalListByUserId(int userId, int companyId){
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("companyId", companyId);
        List<Approval> approvalList = approvalMapper.selectCarbonCopyApprovalListByUserId(map);
        for (Approval approval : approvalList){
            String displaySubmitTime = DateHelper.timestampToStr2(approval.getSubmitTime());
            if (displaySubmitTime != null)
                approval.setDisplaySubmitTime(displaySubmitTime);
        }
        return approvalList;
    }
}
