package com.springapp.mvc.web;

import javax.servlet.http.HttpServletRequest;

public class BaseController {

    public static String SESSION_KEY = "account_role";
    public static String ROLE_ADMIN = "admin";
    public static String ROLE_MEMBER = "member";
    public static String ACCOUNT_ID = "account_id";
    public static String COMPANY_ID = "company_id";
    public String sessionExpiredDirectedUrl = "redirect:/login";
    public String adminDirectedUrl = "redirect:/admin_404";
    public String memberDirectedUrl = "redirect:/member_404";

    public boolean isSessionExpired(HttpServletRequest request) {
        return request.getSession() == null || request.getSession().getAttribute(SESSION_KEY) == null;
    }

    public boolean isAdminRole(HttpServletRequest request) {
        return request.getSession().getAttribute(SESSION_KEY).equals(ROLE_ADMIN);
    }

}
