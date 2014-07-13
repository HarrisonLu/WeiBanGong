package com.springapp.mvc.web;

import com.springapp.mvc.domain.approval.Approval;
import com.springapp.mvc.domain.approval.CommentApproval;
import com.springapp.mvc.domain.contacts.Group;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.service.approval.ApprovalService;
import com.springapp.mvc.service.contacts.ContactsService;
import com.tool.DateHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/approval")
public class ApprovalController extends BaseController {

    @Autowired
    private ContactsService contactsService;

    @Autowired
    private ApprovalService approvalService;

    @RequestMapping(method = RequestMethod.GET)
    public String showApprovalIndex(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;
        if (isAdminRole(request))
            return adminDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        List<Approval> myApprovals = approvalService.getMyApprovalList(userId, companyId);
        List<Approval> myWaitingApprovals = approvalService.getMyWaitingApprovalList(userId, companyId);
        model.addAttribute("myApprovals", myApprovals);
        model.addAttribute("myWaitingApprovals", myWaitingApprovals);
        return "approval/approval_index";
    }

    @RequestMapping(value = "/info/{approvalId}", method = RequestMethod.GET)
    public String showApprovalInfo(HttpServletRequest request, ModelMap model, @PathVariable int approvalId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Approval approval = approvalService.getApprovalDetailByApprovalId(approvalId, companyId);
        List<CommentApproval> commentApprovals = approvalService.selectCommentApprovalListByApprovalId(approvalId, companyId);
        User user = contactsService.selectUserDetailsById(approval.getApplicantId());
        List<Group> groups = user.getGroupList();
        Group group = groups.get(0);
        model.addAttribute("approval", approval);
        model.addAttribute("commentApprovals", commentApprovals);
        model.addAttribute("group", group);
        return "approval/approval_info";
    }

    @RequestMapping(value = "/info/add/{approvalId}", method = RequestMethod.GET)
    public String showApprovalInfoAdd(HttpServletRequest request, ModelMap model, @PathVariable int approvalId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Approval approval = approvalService.getApprovalDetailByApprovalId(approvalId, companyId);
        List<CommentApproval> commentApprovals = approvalService.selectCommentApprovalListByApprovalId(approvalId, companyId);
        User user = contactsService.selectUserDetailsById(approval.getApplicantId());
        List<Group> groups = user.getGroupList();
        Group group = groups.get(0);
        model.addAttribute("approval", approval);
        model.addAttribute("commentApprovals", commentApprovals);
        model.addAttribute("group", group);
        return "approval/approval_info";
    }


    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showApprovalCreate(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "approval/approval_create";
    }

    @RequestMapping(value = "/create/1", method = RequestMethod.GET)
    public String showApprovalCreateLeave(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "approval/approval_create_leave";
    }

    @RequestMapping(value = "/create/2", method = RequestMethod.GET)
    public String showApprovalCreateTravel(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "approval/approval_create_travel";
    }

    @RequestMapping(value = "/create/3", method = RequestMethod.GET)
    public String showApprovalCreateClaim(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "approval/approval_create_claim";
    }

    @RequestMapping(value = "/create/4", method = RequestMethod.GET)
    public String showApprovalCreateGoods(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "approval/approval_create_goods";
    }

    @RequestMapping(value = "/create/5", method = RequestMethod.GET)
    public String showApprovalCreateFunds(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "approval/approval_create_funds";
    }

    @RequestMapping(value = "/create/6", method = RequestMethod.GET)
    public String showApprovalCreateOvertime(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "approval/approval_create_overtime";
    }

    @RequestMapping(value = "/create/7", method = RequestMethod.GET)
    public String showApprovalCreateOthers(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "approval/approval_create_others";
    }

    @RequestMapping(value = "/create/approver/{level}", method = RequestMethod.GET)
    public String showApprovalCreateApprover(HttpServletRequest request, ModelMap model, @PathVariable int level) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        model.addAttribute("level", level);
        return "approval/approval_create_approver";
    }

    @RequestMapping(value = "/draft", method = RequestMethod.GET)
    public String showApprovalDraft(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "approval/approval_draft";
    }

    @RequestMapping(value = "/archive", method = RequestMethod.GET)
    public String showApprovalArchive(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "approval/approval_archive";
    }

    @RequestMapping(value = "/archive/{archiveId}", method = RequestMethod.GET)
    public String showApprovalArchiveTime(HttpServletRequest request, ModelMap model, @PathVariable int archiveId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        model.addAttribute("archiveId", archiveId);
        return "approval/approval_archive_time";
    }

    @RequestMapping(value = "/archive/{archiveId}/{month}", method = RequestMethod.GET)
    public String showApprovalArchiveTimeDetail(HttpServletRequest request, ModelMap model, @PathVariable int archiveId, @PathVariable int month) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        List<Approval> approvals = approvalService.selectArchiveApprovalListByUserIdAndMonth(userId, month, archiveId, companyId);
        model.addAttribute("month", month);
        model.addAttribute("approvals", approvals);
        return "approval/approval_archive_detail";
    }

    @RequestMapping(value = "/create/{approvalTypeId}", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doApplyLeave(HttpServletRequest request, @PathVariable int approvalTypeId) {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);

        Approval approval = new Approval();
        approval.setApprovalTypeId(approvalTypeId);
        approval.setApplicantId(userId);
        approval.setCompanyId(companyId);
        approval.setApprovalStageId(1);
        approval.setApprovalStatusId(2);
        approval.setReasons(request.getParameter("reason"));

        if (approvalTypeId == 1) {
            approval.setLeaveTypeId(Integer.parseInt(request.getParameter("type")));
        } else if (approvalTypeId == 3) {
            approval.setClaimTypeId(Integer.parseInt(request.getParameter("type")));
        } else if (approvalTypeId == 4) {
            approval.setGoodsTypeId(Integer.parseInt(request.getParameter("type")));
        } else if (approvalTypeId == 5) {
            approval.setFundsTypeId(Integer.parseInt(request.getParameter("type")));
        }

        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String departure = request.getParameter("departure");
        String destination = request.getParameter("destination");
        String amount = request.getParameter("amount");
        String secondApprover = request.getParameter("secondApprover");
        String firstApprover = request.getParameter("firstApprover");

        if (startTime != null && !startTime.equals("")) {
            approval.setStartTime(new Timestamp(DateHelper.getDateByString(startTime).getTime()));
        }
        if (endTime != null && !endTime.equals("")) {
            approval.setEndTime(new Timestamp(DateHelper.getDateByString(endTime).getTime()));
        }
        if (departure != null && !departure.equals("")) {
            approval.setTravelFrom(departure);
        }
        if (destination != null && !destination.equals("")) {
            approval.setTravelTo(destination);
        }
        if (amount != null && !amount.equals("")) {
            approval.setAmount(Double.parseDouble(amount));
        }
        if (secondApprover != null && !secondApprover.equals("")) {
            approval.setSecondApprovalUserId(Integer.parseInt(secondApprover));
            approval.setCurrentApprovalUserId(Integer.parseInt(secondApprover));
        }
        if (firstApprover != null && !firstApprover.equals("")) {
            approval.setFirstApprovalUserId(Integer.parseInt(firstApprover));
            approval.setCurrentApprovalUserId(Integer.parseInt(firstApprover));
        }

        return approvalService.insertApproval(approval);
    }

}
