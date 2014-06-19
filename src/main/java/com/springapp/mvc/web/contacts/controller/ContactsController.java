package com.springapp.mvc.web.contacts.controller;

import com.springapp.mvc.domain.contacts.Department;
import com.springapp.mvc.domain.contacts.Group;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.service.contacts.ContactsService;
import com.springapp.mvc.web.BaseController;
import com.springapp.mvc.web.contacts.command.UserCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/contacts")
public class ContactsController extends BaseController {

    @Autowired
    private ContactsService contactsService;

    @RequestMapping(method = RequestMethod.GET)
    public String showContactsIndex(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute("user_id");
        int companyId = (Integer) request.getSession().getAttribute("company_id");
        List<User> groupUsers = contactsService.searchGroupUserBaseInfoListByUserId(userId);
        List<Department> departments = contactsService.selectAllDepartmentBaseInfo(companyId);
        model.addAttribute("groupUsers", groupUsers);
        model.addAttribute("departments", departments);
        return "contacts/contacts_index";
    }

    @RequestMapping(value = "/collection", method = RequestMethod.GET)
    public
    @ResponseBody
    Object showContactsCollection(HttpServletRequest request) throws Exception {
        int userId = (Integer) request.getSession().getAttribute("user_id");
        return contactsService.selectCollectedContactsBaseInfoListByUserId(userId);
    }

    @RequestMapping(value = "/user/{userId}", method = RequestMethod.GET)
    public String showContactsDetail(HttpServletRequest request, ModelMap model, @PathVariable int userId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        User user = contactsService.selectUserDetailsById(userId);
        boolean isCollected = contactsService.isCollectedContacts((Integer) request.getSession().getAttribute("user_id"), userId);
        model.addAttribute("user", user);
        model.addAttribute("isCollected", isCollected);
        return "contacts/contacts_detail";
    }

    @RequestMapping(value = "/user/edit", method = RequestMethod.GET)
    public String showContactsEdit(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        User user = contactsService.selectUserDetailsById((Integer) request.getSession().getAttribute("user_id"));
        model.addAttribute("user", user);
        return "contacts/contacts_edit";
    }

    @RequestMapping(value = "/department/{departmentId}", method = RequestMethod.GET)
    public String showContactsDepartment(HttpServletRequest request, ModelMap model, @PathVariable int departmentId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        Department department = contactsService.selectDepartmentDetailsByDepartmentId(departmentId);
        model.addAttribute("department", department);

        return "contacts/contacts_department";
    }

    @RequestMapping(value = "/group/{groupId}", method = RequestMethod.GET)
    public String showContactsGroup(HttpServletRequest request, ModelMap model, @PathVariable int groupId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        Group group = contactsService.selectGroupDetailsByGroupId(groupId);
        model.addAttribute("group", group);

        return "contacts/contacts_group";
    }

    @RequestMapping(value = "/user/link/{collectedId}", method = RequestMethod.GET)
    public
    @ResponseBody
    boolean changeCollectedContacts(HttpServletRequest request, @PathVariable int collectedId) throws Exception {
        int userId = (Integer) request.getSession().getAttribute("user_id");
        boolean isCollected = contactsService.isCollectedContacts(userId, collectedId);
        if (isCollected) {
            contactsService.deleteCollectedContacts(userId, collectedId);
            return false;
        }
        contactsService.insertCollectedContacts(userId, collectedId);
        return true;
    }

    @RequestMapping(value = "/user/update", method = RequestMethod.POST)
    public String saveContacts(HttpServletRequest request, UserCommand userCommand) throws Exception {
        int userId = (Integer) request.getSession().getAttribute("user_id");
        User user = new User();
        user.setId(userId);
        user.setTelephoneNum(userCommand.getTelephoneNum());
        user.setMobilePhoneNum(userCommand.getMobilePhoneNum());
        user.setQqNum(userCommand.getQqNum());
        user.setEmail(userCommand.getEmail());
        contactsService.updateUserInfo(user);
        return "redirect:/contacts";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchContacts(HttpServletRequest request, @RequestParam String query) throws Exception {
        int companyId = (Integer) request.getSession().getAttribute("company_id");
        return contactsService.fuzzySelectUserBaseInfoListByString(query, companyId);
    }

}
