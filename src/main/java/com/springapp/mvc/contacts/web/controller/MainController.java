package com.springapp.mvc.contacts.web.controller;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.Group;
import com.springapp.mvc.contacts.domain.User;
import com.springapp.mvc.contacts.service.ContactsOperateService;
import com.springapp.mvc.contacts.service.ContactsService;
import com.springapp.mvc.contacts.web.UserCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    private ContactsOperateService contactsOperateService;

    @Autowired
    private ContactsService contactsService;

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
        User myself = contactsService.selectUserDetailsById(1);
        List<User> users = contactsService.selectCollectedContactsBaseInfoListByUserId(1);
        List<Department> departments = contactsService.selectAllDepartmentBaseInfo();
        modelAndView.addObject("myself", myself);
        modelAndView.addObject("users", users);
        modelAndView.addObject("departments", departments);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/user/{userId}", method = RequestMethod.GET)
    public ModelAndView showContactsUserDetail(@PathVariable int userId, HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_detail");
        User user = contactsService.selectUserDetailsById(userId);
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/user/edit", method = RequestMethod.GET)
    public ModelAndView showContactsEdit(HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_edit");
        User user = contactsService.selectUserDetailsById(1);
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/department/{departmentId}", method = RequestMethod.GET)
    public ModelAndView showContactsDepartment(@PathVariable int departmentId) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_department");
        Department department = contactsService.selectDepartmentDetailsByDepartmentId(departmentId);
        modelAndView.addObject("department", department);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/group/{groupId}", method = RequestMethod.GET)
    public ModelAndView showContactsGroup(@PathVariable int groupId) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_group");
        Group group = contactsService.selectGroupDetailsByGroupId(groupId);
        modelAndView.addObject("group", group);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/search", method = RequestMethod.POST)
    public @ResponseBody
    Object searchContacts(HttpServletRequest request) throws Exception {
        String query = request.getParameter("query");
        System.out.println(query);
        List<User> users = contactsService.fuzzySelectUserBaseInfoListByEnglishString(query);
        return users;
    }
}