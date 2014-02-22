package com.springapp.mvc.contacts.web.controller;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.Group;
import com.springapp.mvc.contacts.domain.User;
import com.springapp.mvc.contacts.service.ContactsService;
import com.springapp.mvc.contacts.web.command.UserCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    public ModelAndView showContactsIndex(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_index");
        int userId = 1;
        request.getSession().setAttribute("user_id", userId);
        User myself = contactsService.selectUserDetailsById((Integer) request.getSession().getAttribute("user_id"));
        List<User> users = contactsService.selectCollectedContactsBaseInfoListByUserId((Integer) request.getSession().getAttribute("user_id"));
        List<Department> departments = contactsService.selectAllDepartmentBaseInfo();
        modelAndView.addObject("myself", myself);
        modelAndView.addObject("users", users);
        modelAndView.addObject("departments", departments);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/user/{userId}", method = RequestMethod.GET)
    public ModelAndView showContactsUserDetail(HttpServletRequest request, @PathVariable int userId) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_detail");
        User user = contactsService.selectUserDetailsById(userId);
        boolean isCollected = contactsService.isCollectedContacts((Integer) request.getSession().getAttribute("user_id"), userId);
        modelAndView.addObject("user", user);
        modelAndView.addObject("isCollected", isCollected);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/user/edit", method = RequestMethod.GET)
    public ModelAndView showContactsEdit(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/contacts/contacts_edit");
        User user = contactsService.selectUserDetailsById((Integer) request.getSession().getAttribute("user_id"));
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "/contacts/user/save", method = RequestMethod.POST)
    public String saveContacts(HttpServletRequest request, UserCommand userCommand) throws Exception {
        int userId = (Integer)request.getSession().getAttribute("user_id");
        User user = new User();
        user.setId(userId);
        user.setTelephoneNum(userCommand.getTelephoneNum());
        user.setMobilePhoneNum(userCommand.getMobilePhoneNum());
        user.setQqNum(userCommand.getQqNum());
        user.setEmail(userCommand.getEmail());
        contactsService.updateUserInfo(user);
        return "redirect:/contacts/user/" + userId;
    }

    @RequestMapping(value = "/contacts/user/link/insert/{collectedId}", method = RequestMethod.GET)
    public String addCollectedContacts(HttpServletRequest request, @PathVariable int collectedId) throws Exception {
        int userId = (Integer)request.getSession().getAttribute("user_id");
        contactsService.insertCollectedContacts(userId, collectedId);
        return "redirect:/contacts/user/" + collectedId;
    }

    @RequestMapping(value = "/contacts/user/link/delete/{collectedId}", method = RequestMethod.GET)
    public String removeCollectedContacts(HttpServletRequest request, @PathVariable int collectedId) throws Exception {
        int userId = (Integer)request.getSession().getAttribute("user_id");
        contactsService.deleteCollectedContacts(userId, collectedId);
        return "redirect:/contacts/user/" + collectedId;
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