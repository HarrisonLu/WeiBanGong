package com.springapp.mvc.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class MainController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String printWelcome(HttpServletRequest request, ModelMap model) {
        request.getSession().setAttribute("user_id", 1);
        model.addAttribute("message", "Hello world!");
        return "index";
    }

}