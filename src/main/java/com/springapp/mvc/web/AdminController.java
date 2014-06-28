package com.springapp.mvc.web;

import com.springapp.mvc.domain.contacts.Department;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.service.admin.AdminService;
import com.springapp.mvc.service.contacts.ContactsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private ContactsService contactsService;

    @RequestMapping(method = RequestMethod.GET)
    public String showAdmin(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;
        if (!isAdminRole(request))
            return memberDirectedUrl;

        return "admin/admin_index";
    }

    @RequestMapping(value = "/structure", method = RequestMethod.GET)
    public String showAdminStructure(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        List<Department> departments = contactsService.selectAllDepartmentBaseInfo(companyId);
        model.addAttribute("departments", departments);
        return "admin/admin_structure";
    }

    @RequestMapping(value = "/structure/user/create", method = RequestMethod.GET)
    public String showAdminStructureCreateUser(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "admin/admin_user_create";
    }

    @RequestMapping(value = "/approval", method = RequestMethod.GET)
    public String showAdminApproval(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "admin/admin_approval";
    }

    @RequestMapping(value = "/member", method = RequestMethod.GET)
    public String showAdminMember(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "admin/admin_member";
    }

    @RequestMapping(value = "/department/create", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doCreateDepartment(HttpServletRequest request,
                               @RequestParam String departmentName) {
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Department department = new Department();
        department.setName(departmentName);
        department.setCompanyId(companyId);
        adminService.insertDepartment(department);
        return true;
    }

    @RequestMapping(value = "/user/create", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doCreateUser(HttpServletRequest request,
                         @RequestParam String chineseName,
                         @RequestParam String englishName,
                         @RequestParam String position,
                         @RequestParam String email) {
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        User user = new User();
        user.setChineseName(chineseName);
        user.setEnglishName(englishName);
        user.setCompanyId(companyId);
        user.setEmail(email);
        user.setPassword(email);
        user.setPosition(position);
        return adminService.insertUser(user);
    }

}
