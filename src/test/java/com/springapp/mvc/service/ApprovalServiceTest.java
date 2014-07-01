package com.springapp.mvc.service;

import com.springapp.mvc.domain.approval.*;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.service.approval.ApprovalService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by lion on 14-6-27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ApprovalServiceTest {
    @Autowired
    private ApprovalService approvalService;

    @Test
    public void testGetMyApprovalList() throws Exception {
        List<Approval> approvalList = approvalService.getMyApprovalList(1, 1);
        Assert.assertEquals(approvalList.size(), 4);
    }

    @Test
    public void testGetMyWaitingApprovalList() throws Exception {
        List<Approval> approvalList = approvalService.getMyWaitingApprovalList(2, 1);
        Assert.assertEquals(approvalList.size(), 1);
    }

    @Test
    public void testInsertApproval() throws Exception {
        Approval approval = new Approval();
        approval.setId(99);
        approval.setApplicantId(2);
        approval.setDepartmentId(1);
        approval.setReasons("insertTest");
        approval.setCompanyId(1);

//        approvalService.insertApproval(approval);
    }

    @Test
    public void testFuzzySelectUserBaseInfoListByString() throws Exception {
        List<User> userList = approvalService.fuzzySelectUserBaseInfoListByString("卢", 1);
        Assert.assertEquals(userList.size(), 1);
    }

    @Test
    public void testInsertClaimItem() throws Exception {
        ClaimItem claimItem = new ClaimItem();
        claimItem.setId(99);
        claimItem.setApprovalId(3);
        claimItem.setInfo("insertTest");
        claimItem.setAmount(1.2);
        claimItem.setCompanyId(1);

//        approvalService.insertClaimItem(claimItem);
    }

    @Test
    public void testGetClaimItemAmountByApprovalId() throws Exception {
        double sum = approvalService.getClaimItemAmountByApprovalId(3, 1);
        Assert.assertEquals(sum == 500006.1, true);
    }

    @Test
    public void testInsertFundsItem() throws Exception {
        FundsItem fundsItem = new FundsItem();
        fundsItem.setId(99);
        fundsItem.setApprovalId(5);
        fundsItem.setInfo("insertTest");
        fundsItem.setAmount(1.2);
        fundsItem.setCompanyId(1);

//        approvalService.insertFundsItem(fundsItem);
    }

    @Test
    public void testGetFundsItemAmountByApprovalId() throws Exception {
        double sum = approvalService.getFundsItemAmountByApprovalId(5, 1);
        Assert.assertEquals(sum == 1000022.25, true);
    }

    @Test
    public void testInsertGoodsItem() throws Exception {
        GoodsItem goodsItem = new GoodsItem();
        goodsItem.setId(99);
        goodsItem.setApprovalId(4);
        goodsItem.setName("test");
        goodsItem.setNum(1);
        goodsItem.setPrice(2.5);
        goodsItem.setCompanyId(1);

//        approvalService.insertGoodsItem(goodsItem);
    }

    @Test
    public void testGetGoodsItemAmountByApprovalId() throws Exception {
        double sum = approvalService.getGoodsItemAmountByApprovalId(4, 1);
        Assert.assertEquals(sum == 25 + 120 + 2.4, true);
    }

    @Test
    public void testGetAllLeaveType() throws Exception {
        List<LeaveType> leaveTypeList = approvalService.getAllLeaveType();
        Assert.assertEquals(leaveTypeList.size(), 4);
    }

    @Test
    public void testGetAllClaimType() throws Exception {
        List<ClaimType> claimTypeList = approvalService.getAllClaimType();
        Assert.assertEquals(claimTypeList.size(), 5);
    }

    @Test
    public void testGetAllFundsType() throws Exception {
        List<FundsType> fundsTypeList = approvalService.getAllFundsType();
        Assert.assertEquals(fundsTypeList.size(), 5);
    }

    @Test
    public void testGetAllGoodsType() throws Exception {
        List<GoodsType> goodsTypeList = approvalService.getAllGoodsType();
        Assert.assertEquals(goodsTypeList.size(), 3);
    }

    @Test
    public void testDeleteClaimItem() throws Exception {
//        approvalService.deleteClaimItem(4);
    }

    @Test
    public void testDeleteFundsItem() throws Exception {
//        approvalService.deleteFundsItem(4);
    }

    @Test
    public void testDeleteGoodsItem() throws Exception {
//        approvalService.deleteGoodsItem(4);
    }

    @Test
    public void testSelectClaimItemByApprovalId() throws Exception {
        List<ClaimItem> claimItemList = approvalService.selectClaimItemByApprovalId(3, 1);
        Assert.assertEquals(claimItemList.size(), 3);
    }

    @Test
    public void testSelectFundsItemByApprovalId() throws Exception {
        List<FundsItem> fundsItemList = approvalService.selectFundsItemByApprovalId(5, 1);
        Assert.assertEquals(fundsItemList.size(), 3);
    }

    @Test
    public void testSelectGoodsItemByApprovalId() throws Exception {
        List<GoodsItem> goodsItemList = approvalService.selectGoodsItemByApprovalId(4, 1);
        Assert.assertEquals(goodsItemList.size(), 3);
    }

    @Test
    public void testGetAllApprovalType() throws Exception {
        List<ApprovalType> approvalTypeList = approvalService.getAllApprovalType();
        Assert.assertEquals(approvalTypeList.size(), 7);
    }

    @Test
    public void testSelectDraftApprovalListByUserId() throws Exception {
        List<Approval> approvalList = approvalService.selectDraftApprovalListByUserId(1, 1);
        Assert.assertEquals(approvalList.size(), 1);
    }

    @Test
    public void testDeleteDraftApproval() throws Exception {
        approvalService.deleteDraftApproval(8);
    }

    @Test
    public void testDeleteAllDraftApprovalByUserId() throws Exception {
//        approvalService.deleteAllDraftApprovalByUserId(2, 1);
    }

    @Test
    public void testUpdateApproval() throws Exception {
//        approvalService.updateApproval();
    }

    @Test
    public void testSelectArchiveApprovalListByUserIdAndMonth() throws Exception {
        List<Approval> approvalList = approvalService.selectArchiveApprovalListByUserIdAndMonth(1, 6, 6, 1);
        Assert.assertEquals(approvalList.size(), 1);
    }

    @Test
    public void testGetApprovalDetailByApprovalId() throws Exception {
        Approval approval = approvalService.getApprovalDetailByApprovalId(1, 1);
        Assert.assertEquals(approval.getReasons(), "休假");
    }

    @Test
    public void testInsertCommentApproval() throws Exception {
        CommentApproval commentApproval = new CommentApproval();
        commentApproval.setId(99);
        commentApproval.setDetails("insertTest");
        commentApproval.setUserId(2);
        commentApproval.setApprovalId(6);
        commentApproval.setIsPass(1);
        commentApproval.setCompanyId(1);

//        approvalService.insertCommentApproval(commentApproval);
    }

    @Test
    public void testDeleteCommentApproval() throws Exception {
//        approvalService.deleteCommentApproval(5);
    }

    @Test
    public void testSelectCommentApprovalListByApprovalId() throws Exception {
        List<CommentApproval> commentApprovalList = approvalService.selectCommentApprovalListByApprovalId(6, 1);
        Assert.assertEquals(commentApprovalList.size(), 2);
    }

    @Test
    public void testInsertCarbonCopyApproval() throws Exception {
//        approvalService.insertCarbonCopyApproval(4, 2, 1);
    }

    @Test
    public void testDeleteCarbonCopyApproval() throws Exception {
//        approvalService.deleteCarbonCopyApproval(1);
    }

    @Test
    public void testSelectCarbonCopyApprovalListByUserId() throws Exception {
        List<Approval> approvalList = approvalService.selectCarbonCopyApprovalListByUserId(2, 1);
        Assert.assertEquals(approvalList.size(), 1);
    }
}
