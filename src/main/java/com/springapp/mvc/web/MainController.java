package com.springapp.mvc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MainController extends BaseController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String printWelcome(HttpServletRequest request) {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "index";
    }

    @RequestMapping(value = "/index/coming", method = RequestMethod.GET)
    public String showComingSoon(HttpServletRequest request) {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "index_coming";
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String showErrorPage() throws Exception {
        return "error/error_page";
    }
}