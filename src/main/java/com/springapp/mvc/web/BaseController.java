package com.springapp.mvc.web;

import javax.servlet.http.HttpServletRequest;

public class BaseController {

    public boolean isSessionExpired(HttpServletRequest request) {
        return request.getSession() == null || request.getSession().getAttribute("user_id") == null;
    }

}
