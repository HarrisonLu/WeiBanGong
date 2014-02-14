package com.springapp.mvc.contacts.web.controller;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import com.springapp.mvc.contacts.service.ContactsOperateService;
import com.springapp.mvc.contacts.service.ContactsSearchService;
import com.springapp.mvc.contacts.web.UserCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    private ContactsOperateService contactsOperateService;

    @Autowired
    private ContactsSearchService contactsSearchService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        model.addAttribute("message", "Hello world!");
        return "index";
    }

    @RequestMapping(value = "/contacts/create", method = RequestMethod.GET)
    public void createContact() {
    }

    @RequestMapping(value = "/contacts/create", method = RequestMethod.POST)
    public String createContactByPost(HttpServletRequest request, UserCommand userCommand) {
        System.out.println(userCommand.getName());
        User user = new User();
        user.setChineseName(userCommand.getName());
        user.setEmail(userCommand.getEmail());
        user.setPassword("123456");
        contactsOperateService.insertUser(user);
        return "index";
    }

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public ModelAndView showContactsIndex() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_index");
        List<User> users = contactsSearchService.selectAllUser();
        List<Department> departments = contactsSearchService.selectAllDepartment();
        modelAndView.addObject("users", users);
        modelAndView.addObject("departments", departments);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/user/{userId}", method = RequestMethod.GET)
    public ModelAndView showContactsUserDetail(@PathVariable int userId) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_detail");
        User user = contactsSearchService.selectUserById(userId);
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/department/{departmentId}", method = RequestMethod.GET)
    public ModelAndView showContactsDepartment(@PathVariable int departmentId) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_department");
        Department department = contactsSearchService.selectDepartmentById(departmentId);
        modelAndView.addObject("department", department);
        return modelAndView;
    }
}