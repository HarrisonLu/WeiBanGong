package com.springapp.mvc.web;

import javax.servlet.http.HttpServletRequest;

public class BaseController {

    public String sessionExpiredDirectedUrl = "redirect:/login";

    public String SESSION_KEY = "user_id";

    public boolean isSessionExpired(HttpServletRequest request) {
        return request.getSession() == null || request.getSession().getAttribute(SESSION_KEY) == null;
    }

}
