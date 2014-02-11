package com.springapp.mvc.contacts.web.controller;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import com.springapp.mvc.contacts.service.ContactsOperateService;
import com.springapp.mvc.contacts.service.ContactsSearchService;
import com.springapp.mvc.contacts.web.UserCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/index")
public class MainController {

    @Autowired
    private ContactsOperateService contactsOperateService;

    @Autowired
    private ContactsSearchService contactsSearchService;

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
        User user = new User();
        user.setChineseName(userCommand.getName());
        user.setEmail(userCommand.getEmail());
        user.setPassword("123456");
        contactsOperateService.insertUser(user);
        return "index";
    }

    @RequestMapping(value = "/contact/userlist", method = RequestMethod.GET)
    public ModelAndView showUserList() {
        List<User> users = contactsSearchService.selectAllUser();
        for (User user : users) {
            System.out.print(user.getEmail() + ", " + user.getEnglishName());
            for (Department department : user.getDepartments()) {
                System.out.print(" " + department.getName());
            }
            System.out.println();
        }
        return new ModelAndView("/contact/userlist", "users", users);
    }

}