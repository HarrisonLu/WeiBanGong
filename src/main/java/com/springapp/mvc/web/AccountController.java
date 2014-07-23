package com.springapp.mvc.web;

import com.springapp.mvc.domain.admin.Administrator;
import com.springapp.mvc.domain.admin.Company;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.service.admin.AdminService;
import com.springapp.mvc.service.contacts.ContactsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class AccountController extends BaseController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private ContactsService contactsService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLogin(HttpServletRequest request) throws Exception {
        if (!isSessionExpired(request))
            return "redirect:/index";

        return "account/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String showRegister() throws Exception {
        return "account/register";
    }

    @RequestMapping(value = "/account/admin/access/denied", method = RequestMethod.GET)
    public String showAdmin404(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "account/account_admin_access_denied";
    }

    @RequestMapping(value = "/account/member/access/denied", method = RequestMethod.GET)
    public String showMember404(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "account/account_member_access_denied";
    }

    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String showAccount(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        if (isAdminRole(request)) {
            int adminId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
            Administrator admin = adminService.selectAdminDetailsByAdminId(adminId);
            model.addAttribute("admin", admin);
            return "account/account_admin";
        }

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "account/account_member";
    }

    @RequestMapping(value = "/account/password/change", method = RequestMethod.GET)
    public String showPasswordReset(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        if (isAdminRole(request)) {
            int adminId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
            Administrator admin = adminService.selectAdminDetailsByAdminId(adminId);
            model.addAttribute("email", admin.getEmail());
        } else {
            int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
            User user = contactsService.selectUserDetailsById(userId);
            model.addAttribute("email", user.getEmail());
        }
        return "account/account_password_change";
    }

    @RequestMapping(value = "/account/admin/postfix", method = RequestMethod.GET)
    public String showSuffix(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Company company = adminService.selectCompanyDetailsByCompanyId(companyId);
        model.addAttribute("postfix", company.getUserAccountPostfix());
        return "account/account_admin_postfix";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doLogin(HttpServletRequest request) throws Exception {
        Map<String, Integer> map = adminService.login(request.getParameter("email"), request.getParameter("password"));
        int accountType = map.get("accountType");
        int accountId = map.get("accountId");
        int companyId = map.get("companyId");

        if (accountType == 0) {
            return false;
        }
        if (accountType == 1) {
            request.getSession().setAttribute(SESSION_KEY, ROLE_ADMIN);
        } else if (accountType == 2) {
            request.getSession().setAttribute(SESSION_KEY, ROLE_MEMBER);
        }

        request.getSession().setAttribute(ACCOUNT_ID, accountId);
        request.getSession().setAttribute(COMPANY_ID, companyId);
        return true;
    }

//    @RequestMapping(value = "/register", method = RequestMethod.POST)
//    public
//    @ResponseBody
//    Boolean doRegister(HttpServletRequest request) throws Exception {
//        Company company = new Company();
//        company.setName(request.getParameter("companyName"));
//        if (!adminService.insertCompany(company)) {
//            return false;
//        }
//
//        Administrator admin = new Administrator();
//        admin.setCompanyId(company.getId());
//        admin.setEmail(request.getParameter("email"));
//        admin.setPhoneNum(request.getParameter("phoneNum"));
//        admin.setPassword(request.getParameter("password"));
//        return adminService.insertAdmin(admin);
//    }

    @RequestMapping(value = "/account/password/change", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doChangePassword(HttpServletRequest request) {
        if (isAdminRole(request)) {
            int adminId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
            Administrator admin = new Administrator();
            admin.setId(adminId);
            admin.setPassword(request.getParameter("newPwd"));
            adminService.updateAdminPassword(admin);
        } else {
            int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
            User user = new User();
            user.setId(userId);
            user.setPassword(request.getParameter("newPwd"));
            adminService.updateUserPassword(user);
        }
        return true;
    }

    @RequestMapping(value = "/account/admin/update", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doUpdateAccountAdmin(HttpServletRequest request) {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        Administrator admin = new Administrator();
        admin.setId(userId);
        admin.setPhoneNum(request.getParameter("phoneNum"));
        return adminService.updateAdminDetail(admin);
    }

    @RequestMapping(value = "/account/member/update", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doUpdateAccountMember(HttpServletRequest request) {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = new User();
        user.setId(userId);
        user.setWechatNum(request.getParameter("weChatNum"));
        user.setTelephoneNum(request.getParameter("telephoneNum"));
        user.setMobilePhoneNum(request.getParameter("mobilePhoneNum"));
        user.setQqNum(request.getParameter("qqNum"));
        return adminService.updateUserDetail(user);
    }

    @RequestMapping(value = "/account/admin/postfix", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doApplySuffix(HttpServletRequest request) {
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        return adminService.setUserAccountPostfix(companyId, request.getParameter("postfix"));
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doLogout(HttpServletRequest request) throws Exception {
        request.getSession().removeAttribute(SESSION_KEY);
        request.getSession().removeAttribute(ACCOUNT_ID);
        request.getSession().removeAttribute(COMPANY_ID);
        return true;
    }
}
