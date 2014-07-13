package com.springapp.mvc.web;

import com.springapp.mvc.domain.admin.Company;
import com.springapp.mvc.domain.contacts.Department;
import com.springapp.mvc.domain.contacts.Group;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.service.admin.AdminService;
import com.springapp.mvc.service.contacts.ContactsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value = "/structure/department/{departmentId}", method = RequestMethod.GET)
    public String showAdminStructureDepList(HttpServletRequest request, ModelMap model, @PathVariable int departmentId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Department department = contactsService.selectDepartmentDetailsByDepartmentId(departmentId);
        boolean postfixCreated = adminService.hasUserAccountPostfix(companyId);
        model.addAttribute("department", department);
        model.addAttribute("postfixCreated", postfixCreated);
        return "admin/admin_structure_department";
    }

    @RequestMapping(value = "/structure/group/{groupId}", method = RequestMethod.GET)
    public String showAdminStructureGroupList(HttpServletRequest request, ModelMap model, @PathVariable int groupId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        Group group = contactsService.selectGroupDetailsByGroupId(groupId);
        model.addAttribute("group", group);
        return "admin/admin_structure_group";
    }

    @RequestMapping(value = "/structure/detail/{userId}", method = RequestMethod.GET)
    public String showAdminStructureUserDetail(HttpServletRequest request, ModelMap model, @PathVariable int userId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        return "admin/admin_structure_detail";
    }

    @RequestMapping(value = "/structure/user/create/{departmentId}", method = RequestMethod.GET)
    public String showAdminStructureCreateUser(HttpServletRequest request, ModelMap model, @PathVariable int departmentId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Department department = contactsService.selectDepartmentDetailsByDepartmentId(departmentId);
        Company company = adminService.selectCompanyDetailsByCompanyId(companyId);
        model.addAttribute("department", department);
        model.addAttribute("postfix", company.getUserAccountPostfix());
        return "admin/admin_user_create";
    }

    @RequestMapping(value = "/approval", method = RequestMethod.GET)
    public String showAdminApproval(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "admin/admin_approval";
    }

    @RequestMapping(value = "/member", method = RequestMethod.GET)
    public String showAdminMember(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        List<Department> departments = contactsService.selectAllDepartmentBaseInfo(companyId);
        model.addAttribute("departments", departments);
        return "admin/admin_member";
    }

    @RequestMapping(value = "/member/department/{departmentId}", method = RequestMethod.GET)
    public String showAdminMemberDepList(HttpServletRequest request, ModelMap model, @PathVariable int departmentId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        Department department = contactsService.selectDepartmentDetailsByDepartmentId(departmentId);
        model.addAttribute("department", department);
        return "admin/admin_member_department";
    }

    @RequestMapping(value = "/member/group/{groupId}", method = RequestMethod.GET)
    public String showAdminMemberGroupList(HttpServletRequest request, ModelMap model, @PathVariable int groupId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        Group group = contactsService.selectGroupDetailsByGroupId(groupId);
        model.addAttribute("group", group);
        return "admin/admin_member_group";
    }

    @RequestMapping(value = "/member/detail/{userId}", method = RequestMethod.GET)
    public String showAdminMemberDetail(HttpServletRequest request, ModelMap model, @PathVariable int userId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        User user = contactsService.selectUserDetailsById(userId);
        boolean hasRightCreateProject = adminService.hasRightsForCreateProject(userId);
        model.addAttribute("user", user);
        model.addAttribute("hasRightCreateProject", hasRightCreateProject);
        return "admin/admin_member_detail";
    }

    @RequestMapping(value = "/structure/department/create", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doCreateDepartment(HttpServletRequest request) {
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Department department = new Department();
        department.setName(request.getParameter("departmentName"));
        department.setCompanyId(companyId);
        return adminService.insertDepartment(department);
    }

    @RequestMapping(value = "/structure/group/create", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doCreateGroup(HttpServletRequest request) {
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Group group = new Group();
        group.setDepartmentId(Integer.parseInt(request.getParameter("departmentId")));
        group.setName(request.getParameter("groupName"));
        group.setCompanyId(companyId);
        return adminService.insertGroup(group);
    }

    @RequestMapping(value = "/structure/user/create", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean doCreateUser(HttpServletRequest request) {
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        User user = new User();
        user.setChineseName(request.getParameter("chineseName"));
        user.setEnglishName(request.getParameter("englishName"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("email"));
        user.setPosition(request.getParameter("position"));
        user.setCompanyId(companyId);
        adminService.insertUser(user);
        String groupId = request.getParameter("groupId");
        if (groupId != null && !groupId.equals("")) {
            adminService.insertUserIdGroupIdLink(user.getId(), Integer.parseInt(groupId));
        }
        return true;
    }

    @RequestMapping(value = "/member/privilege/project/add/{userId}", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean addAdminMemberPrivilegeProject(HttpServletRequest request, @PathVariable int userId) throws Exception {
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        return adminService.insertRightsForCreateProject(userId, companyId);
    }

    @RequestMapping(value = "/member/privilege/project/delete/{userId}", method = RequestMethod.POST)
    public
    @ResponseBody
    Boolean deleteAdminMemberPrivilegeProject(@PathVariable int userId) throws Exception {
        return adminService.deleteRightsForCreateProject(userId);
    }


}
