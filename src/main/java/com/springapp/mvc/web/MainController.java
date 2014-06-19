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

}