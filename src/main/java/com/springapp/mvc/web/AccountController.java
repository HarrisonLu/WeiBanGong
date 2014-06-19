package com.springapp.mvc.web;

import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.service.admin.AdminService;
import com.springapp.mvc.service.contacts.ContactsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String showAccount(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute("user_id");
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "account/account_personal";

//        return "account/account_admin";
    }

    @RequestMapping(value = "/account/password", method = RequestMethod.GET)
    public String showPasswordReset(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute("user_id");
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "account/password_reset";
    }

    @RequestMapping(value = "/account/admin/suffix", method = RequestMethod.GET)
    public String showSuffix(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "account/account_admin_suffix";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doLogin(HttpServletRequest request, @RequestParam String email, @RequestParam String password) throws Exception {

        if (email.equals("123") && password.equals("123")) {
            request.getSession().setAttribute(SESSION_KEY, 1);
            request.getSession().setAttribute("company_id", 1);
            return true;
        }
        return false;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doRegister(HttpServletRequest request,
                       @RequestParam String companyName,
                       @RequestParam String mobilePhone,
                       @RequestParam String email,
                       @RequestParam String password,
                       @RequestParam String confirmPassword) throws Exception {

        return true;
    }

    @RequestMapping(value = "/account/password/change", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doChangePassword(HttpServletRequest request,
                             @RequestParam String newPwd) {
        int userId = (Integer) request.getSession().getAttribute("user_id");
        User user = new User();
        user.setId(userId);
        user.setPassword(newPwd);
        adminService.updateUserPassword(user);
        return true;
    }

    @RequestMapping(value = "/account/update", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doUpdateAccount(HttpServletRequest request,
                            @RequestParam String weChatNum,
                            @RequestParam String telephoneNum,
                            @RequestParam String mobilePhoneNum,
                            @RequestParam String qqNum,
                            @RequestParam String email) {
        int userId = (Integer) request.getSession().getAttribute("user_id");
        User user = new User();
        user.setId(userId);
        user.setWechatNum(weChatNum);
        user.setTelephoneNum(telephoneNum);
        user.setMobilePhoneNum(mobilePhoneNum);
        user.setQqNum(qqNum);
        user.setEmail(email);
        adminService.updateUserDetail(user);
        return true;
    }

    @RequestMapping(value = "/account/admin/suffix/apply", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doApplySuffix(HttpServletRequest request,
                          @RequestParam String suffix) {
        int companyId = (Integer) request.getSession().getAttribute("company_id");
        return adminService.setUserAccountPostfix(companyId, suffix);
    }


    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doLogout(HttpServletRequest request) throws Exception {
        request.getSession().removeAttribute(SESSION_KEY);
        return true;
    }
}
