package com.springapp.mvc.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/approval")
public class ApprovalController extends BaseController {

    @RequestMapping(method = RequestMethod.GET)
    public String showApprovalIndex(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute("user_id");
        int companyId = (Integer) request.getSession().getAttribute("company_id");
        return "approval/approval_index";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showApprovalCreate(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "approval/approval_create";
    }

    @RequestMapping(value = "/create/leave", method = RequestMethod.GET)
    public String showApprovalCreateLeave(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "approval/approval_create_leave";
    }

    @RequestMapping(value = "/create/travel", method = RequestMethod.GET)
    public String showApprovalCreateTravel(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "approval/approval_create_travel";
    }

    @RequestMapping(value = "/create/goods", method = RequestMethod.GET)
    public String showApprovalCreateGoods(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "approval/approval_create_goods";
    }

    @RequestMapping(value = "/create/funds", method = RequestMethod.GET)
    public String showApprovalCreateFunds(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "approval/approval_create_funds";
    }

    @RequestMapping(value = "/create/overtime", method = RequestMethod.GET)
    public String showApprovalCreateOvertime(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "approval/approval_create_overtime";
    }

    @RequestMapping(value = "/create/others", method = RequestMethod.GET)
    public String showApprovalCreateOthers(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "approval/approval_create_others";
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
    public String showApprovalArchiveDetail(HttpServletRequest request, ModelMap model, @PathVariable int archiveId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        model.addAttribute("archiveId", archiveId);
        return "approval/approval_archive_timeline";
    }
}
