package com.springapp.mvc;

import com.springapp.mvc.contacts.domain.UserInfo;
import com.springapp.mvc.contacts.service.ContactService;
import com.springapp.mvc.contacts.web.UserCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/index")
public class MainController {

    @Autowired
    private ContactService contactService;

    @RequestMapping(method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        model.addAttribute("message", "Hello world!");
        return "index";
    }

    @RequestMapping(value = "/contact/create", method = RequestMethod.GET)
    public ModelAndView createContact() {
        ModelAndView modelAndView = new ModelAndView("/contact/create");
        return modelAndView;
    }

    @RequestMapping(value = "/contact/create", method = RequestMethod.POST)
    public String createContactByPost(HttpServletRequest request, UserCommand userCommand) {
        System.out.println(userCommand.getName());
        UserInfo userInfo = new UserInfo();
        userInfo.setChineseName(userCommand.getName());
        contactService.insertUser(userInfo);
        return "index";
    }


}