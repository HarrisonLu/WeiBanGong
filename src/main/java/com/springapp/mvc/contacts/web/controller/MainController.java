package com.springapp.mvc.contacts.web.controller;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.Group;
import com.springapp.mvc.contacts.domain.User;
import com.springapp.mvc.contacts.service.ContactsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    private ContactsService contactsService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        model.addAttribute("message", "Hello world!");
        return "index";
    }

    @RequestMapping(value = "/contacts", method = RequestMethod.GET)
    public ModelAndView showContactsIndex(HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_index");
        int userId = 1;
        session.setAttribute("user_id", userId);
        User myself = contactsService.selectUserDetailsById((Integer) session.getAttribute("user_id"));
        List<User> users = contactsService.selectCollectedContactsBaseInfoListByUserId((Integer) session.getAttribute("user_id"));
        List<Department> departments = contactsService.selectAllDepartmentBaseInfo();
        modelAndView.addObject("myself", myself);
        modelAndView.addObject("users", users);
        modelAndView.addObject("departments", departments);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/user/{userId}", method = RequestMethod.GET)
    public ModelAndView showContactsUserDetail(@PathVariable int userId) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_detail");
        User user = contactsService.selectUserDetailsById(userId);
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/user/edit", method = RequestMethod.GET)
    public ModelAndView showContactsEdit(HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_edit");
        User user = contactsService.selectUserDetailsById((Integer) session.getAttribute("user_id"));
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
    public
    @ResponseBody
    Object searchContacts(@RequestParam String query) throws Exception {
        return contactsService.fuzzySelectUserBaseInfoListByEnglishString(query);
    }
}