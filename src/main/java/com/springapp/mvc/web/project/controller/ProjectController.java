package com.springapp.mvc.web.project.controller;

import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.domain.project.CommentProject;
import com.springapp.mvc.domain.project.Module;
import com.springapp.mvc.domain.project.Project;
import com.springapp.mvc.domain.project.Task;
import com.springapp.mvc.service.contacts.ContactsService;
import com.springapp.mvc.service.project.ProjectService;
import com.springapp.mvc.web.BaseController;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ContactsService contactsService;

    @RequestMapping(method = RequestMethod.GET)
    public String showProjectIndex(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;
        if (isAdminRole(request))
            return adminDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        List<Project> projects = projectService.selectProjectListByUserId(userId, companyId);
        model.addAttribute("projects", projects);
        return "project/project_index";
    }

    @RequestMapping(value = "/detail/{projectId}", method = RequestMethod.GET)
    public String showProjectDetail(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Project project = projectService.getProjectDetail(projectId);
        List<Module> modules = projectService.getModuleListByUserIdAndProjectId(userId, projectId, companyId);
        List<User> managers = projectService.getProjectManagerList(projectId, companyId);
        List<Customer> customers = projectService.getProjectCustomerList(projectId, companyId);
        model.addAttribute("project", project);
        model.addAttribute("modules", modules);
        model.addAttribute("managers", managers);
        model.addAttribute("customers", customers);
        return "project/project_detail";
    }

    @RequestMapping(value = "/{projectId}", method = RequestMethod.GET)
    public String showModuleIndex(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        List<Module> modules = projectService.getModuleListByUserIdAndProjectId(userId, projectId, companyId);
        Project project = projectService.getProjectDetail(projectId);
        model.addAttribute("modules", modules);
        model.addAttribute("project", project);
        return "project/module/module_index";
    }

    @RequestMapping(value = "/module/detail/{moduleId}", method = RequestMethod.GET)
    public String showModuleDetail(HttpServletRequest request, ModelMap model, @PathVariable int moduleId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Module module = projectService.getModuleDetail(moduleId);
        List<Task> tasks = projectService.getTaskListByUserIdAndModuleId(userId, moduleId, companyId);
        List<User> managers = projectService.getModuleManagerList(moduleId, companyId);
        List<Customer> customers = projectService.getModuleCustomerList(moduleId, companyId);
        model.addAttribute("module", module);
        model.addAttribute("tasks", tasks);
        model.addAttribute("managers", managers);
        model.addAttribute("customers", customers);
        return "project/module/module_detail";
    }

    @RequestMapping(value = "/module/{moduleId}", method = RequestMethod.GET)
    public String showTaskIndex(HttpServletRequest request, ModelMap model, @PathVariable int moduleId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Module module = projectService.getModuleDetail(moduleId);
        List<Task> tasks = projectService.getTaskListByUserIdAndModuleId(userId, moduleId, companyId);
        model.addAttribute("module", module);
        model.addAttribute("tasks", tasks);
        return "project/task/task_index";
    }

    // 新建 项目
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showProjectCreate(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        model.addAttribute("current", new Date());
        return "project/project_create";
    }

    @RequestMapping(value = "/create/manager", method = RequestMethod.GET)
    public String showProjectCreateManager(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "project/project_create_manager";
    }

    @RequestMapping(value = "/create/member", method = RequestMethod.GET)
    public String showProjectCreateMember(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "project/project_create_member";
    }

    @RequestMapping(value = "/create/customer", method = RequestMethod.GET)
    public String showProjectCreateCustomer(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "project/project_create_customer";
    }

    @RequestMapping(value = "/edit/{projectId}", method = RequestMethod.GET)
    public String showProjectEdit(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Project project = projectService.getProjectDetail(projectId);
        List<User> managers = projectService.getProjectManagerList(projectId, companyId);
        List<Customer> customers = projectService.getProjectCustomerList(projectId, companyId);
        model.addAttribute("project", project);
        model.addAttribute("managers", managers);
        model.addAttribute("customers", customers);
        return "project/project_edit";
    }

    // 新建 模块
    @RequestMapping(value = "/{projectId}/module/create", method = RequestMethod.GET)
    public String showModuleCreate(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        model.addAttribute("user", user);
        model.addAttribute("current", new Date());
        model.addAttribute("projectId", projectId);
        return "project/module/module_create";
    }

    @RequestMapping(value = "/module/create/manager", method = RequestMethod.GET)
    public String showModuleCreateManager(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "project/module/module_create_manager";
    }

    @RequestMapping(value = "/module/create/member", method = RequestMethod.GET)
    public String showModuleCreateMember(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "project/module/module_create_member";
    }

    @RequestMapping(value = "/module/create/customer", method = RequestMethod.GET)
    public String showModuleCreateCustomer(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "project/module/module_create_customer";
    }

    @RequestMapping(value = "/{projectId}/module/edit/{moduleId}", method = RequestMethod.GET)
    public String showModuleEdit(HttpServletRequest request, ModelMap model, @PathVariable int projectId, @PathVariable int moduleId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Module module = projectService.getModuleDetail(moduleId);
        List<Task> tasks = projectService.getTaskListByUserIdAndModuleId(userId, moduleId, companyId);
        List<User> managers = projectService.getModuleManagerList(moduleId, companyId);
        List<Customer> customers = projectService.getModuleCustomerList(moduleId, companyId);
        model.addAttribute("module", module);
        model.addAttribute("tasks", tasks);
        model.addAttribute("managers", managers);
        model.addAttribute("customers", customers);
        model.addAttribute("projectId", projectId);
        return "project/module/module_edit";
    }

    // 新建 任务
    @RequestMapping(value = "/{moduleId}/task/create", method = RequestMethod.GET)
    public String showTaskCreate(HttpServletRequest request, ModelMap model, @PathVariable int moduleId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        User user = contactsService.selectUserDetailsById(userId);
        Module module = projectService.getModuleDetail(moduleId);
        model.addAttribute("user", user);
        model.addAttribute("current", new Date());
        model.addAttribute("module", module);
        return "project/task/task_create";
    }

    @RequestMapping(value = "/task/create/member", method = RequestMethod.GET)
    public String showTaskCreateMember(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "project/task/task_create_member";
    }

    @RequestMapping(value = "/task/create/customer", method = RequestMethod.GET)
    public String showTaskCreateCustomer(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "project/task/task_create_customer";
    }

    @RequestMapping(value = "/task/detail/{taskId}", method = RequestMethod.GET)
    public String showTaskDetail(HttpServletRequest request, ModelMap model, @PathVariable int taskId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        Task task = projectService.getTaskDetail(taskId);
        model.addAttribute("task", task);
        return "project/task/task_detail";
    }

    @RequestMapping(value = "/comment/{projectId}", method = RequestMethod.GET)
    public String showProjectComment(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        Project project = projectService.getProjectDetail(projectId);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        List<CommentProject> commentProjects = projectService.getProjectCommentList(projectId, companyId);
        model.addAttribute("project", project);
        model.addAttribute("commentProjects", commentProjects);
        return "project/project_comment";
    }

    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public String showProjectManager(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        List<Project> projects = projectService.selectProjectListByUserId(userId, companyId);
        model.addAttribute("projects", projects);
        return "project/project_manager";
    }


    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String showProjectSearch(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "project/project_search";
    }

    @RequestMapping(value = "/create/user", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchProjectUser(HttpServletRequest request, @RequestParam String query) throws Exception {
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        return projectService.fuzzySelectUserList(query, companyId);
    }

    @RequestMapping(value = "/create/customer", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchProjectCustomer(HttpServletRequest request, @RequestParam String query) throws Exception {
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        return projectService.fuzzySelectCustomerNotLink(query, companyId);
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createProject(HttpServletRequest request,
                                @RequestParam String name,
                                @RequestParam String info,
                                @RequestParam Integer stage,
                                @RequestParam String managerIds,
                                @RequestParam String memberIds,
                                @RequestParam String customerIds) throws Exception {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Project project = new Project();
        project.setName(name);
        project.setInfo(info);
        project.setStageId(stage);
        project.setCreaterId(userId);
        project.setCompanyId(companyId);
        projectService.insertProject(project);

        int pid = project.getId();
        JSONArray managerArray = new JSONArray(managerIds);
        for (int i = 0; i < managerArray.length(); ++i) {
            int uid = Integer.valueOf(managerArray.get(i).toString());
            projectService.insertProjectManagerLink(pid, uid);
        }

        JSONArray memberArray = new JSONArray(memberIds);
        for (int i = 0; i < memberArray.length(); ++i) {
            int uid = Integer.valueOf(memberArray.get(i).toString());
            projectService.insertProjectMemberLink(pid, uid);
        }

        JSONArray customerArray = new JSONArray(customerIds);
        for (int i = 0; i < customerArray.length(); ++i) {
            int uid = Integer.valueOf(customerArray.get(i).toString());
            projectService.insertProjectCustomerLink(pid, uid);
        }

        return "redirect:/project";
    }

    @RequestMapping(value = "/{projectId}/module/create", method = RequestMethod.POST)
    public String createModule(HttpServletRequest request, @PathVariable int projectId,
                               @RequestParam String name,
                               @RequestParam String managerIds,
                               @RequestParam String memberIds,
                               @RequestParam String customerIds) throws Exception {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Module module = new Module();
        module.setName(name);
        module.setProjectId(projectId);
        module.setCreaterId(userId);
        module.setCompanyId(companyId);
        projectService.insertModule(module);

        int mid = module.getId();

        JSONArray managerArray = new JSONArray(managerIds);
        for (int i = 0; i < managerArray.length(); ++i) {
            int uid = Integer.valueOf(managerArray.get(i).toString());
            projectService.insertModuleManagerLink(mid, uid);
        }

        JSONArray memberArray = new JSONArray(memberIds);
        for (int i = 0; i < memberArray.length(); ++i) {
            int uid = Integer.valueOf(memberArray.get(i).toString());
            projectService.insertModuleMemberLink(mid, uid);
        }

        JSONArray customerArray = new JSONArray(customerIds);
        for (int i = 0; i < customerArray.length(); ++i) {
            int uid = Integer.valueOf(customerArray.get(i).toString());
            projectService.insertModuleCustomerLink(mid, uid);
        }

        return "redirect:/project/" + projectId;
    }

    @RequestMapping(value = "/{moduleId}/task/create", method = RequestMethod.POST)
    public String createTask(HttpServletRequest request, @PathVariable int moduleId,
                             @RequestParam String name,
                             @RequestParam String priorityId,
                             @RequestParam String stageId,
                             @RequestParam String deadline,
                             @RequestParam String memberIds,
                             @RequestParam String customerIds) throws Exception {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);

        Task task = new Task();
        task.setName(name);
        task.setModuleId(moduleId);
        if (deadline != "")
            task.setDeadline(new Timestamp(new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(deadline).getTime()));
        task.setPriorityId(Integer.parseInt(priorityId));
        task.setStageId(Integer.parseInt(stageId));
        task.setCreaterId(userId);
        task.setCompanyId(companyId);
        projectService.insertTask(task);

        int tid = task.getId();

        JSONArray memberArray = new JSONArray(memberIds);
        for (int i = 0; i < memberArray.length(); ++i) {
            int uid = Integer.valueOf(memberArray.get(i).toString());
            projectService.insertTaskMemberLink(tid, uid);
        }

        JSONArray customerArray = new JSONArray(customerIds);
        for (int i = 0; i < customerArray.length(); ++i) {
            int uid = Integer.valueOf(customerArray.get(i).toString());
            projectService.insertTaskCustomerLink(tid, uid);
        }

        return "redirect:/project/module/" + moduleId;
    }

    @RequestMapping(value = "/edit/{projectId}", method = RequestMethod.POST)
    public String editProject(HttpServletRequest request, @PathVariable int projectId,
                              @RequestParam String name,
                              @RequestParam String info,
                              @RequestParam Integer stage,
                              @RequestParam String managerIds,
                              @RequestParam String memberIds,
                              @RequestParam String customerIds) throws Exception {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        Project project = new Project();
        project.setId(projectId);
        project.setName(name);
        project.setInfo(info);
        project.setStageId(stage);
        project.setCreaterId(userId);
        projectService.updateProjectDetail(project);

        int pid = project.getId();
        JSONArray managerArray = new JSONArray(managerIds);
        for (int i = 0; i < managerArray.length(); ++i) {
            int uid = Integer.valueOf(managerArray.get(i).toString());
            projectService.insertProjectManagerLink(pid, uid);
        }

        JSONArray memberArray = new JSONArray(memberIds);
        for (int i = 0; i < memberArray.length(); ++i) {
            int uid = Integer.valueOf(memberArray.get(i).toString());
            projectService.insertProjectMemberLink(pid, uid);
        }

        JSONArray customerArray = new JSONArray(customerIds);
        for (int i = 0; i < customerArray.length(); ++i) {
            int uid = Integer.valueOf(customerArray.get(i).toString());
            projectService.insertProjectCustomerLink(pid, uid);
        }

        return "redirect:/project";
    }

    @RequestMapping(value = "/{projectId}/module/edit/{moduleId}", method = RequestMethod.POST)
    public String editProjectModule(HttpServletRequest request, @PathVariable int projectId,
                                    @PathVariable int moduleId,
                                    @RequestParam String name,
                                    @RequestParam String managerIds,
                                    @RequestParam String memberIds,
                                    @RequestParam String customerIds) throws Exception {
        Module module = new Module();
        module.setId(moduleId);
        module.setName(name);
        projectService.updateModuleDetail(module);

        JSONArray managerArray = new JSONArray(managerIds);
        for (int i = 0; i < managerArray.length(); ++i) {
            int uid = Integer.valueOf(managerArray.get(i).toString());
            projectService.insertModuleManagerLink(moduleId, uid);
        }

        JSONArray memberArray = new JSONArray(memberIds);
        for (int i = 0; i < memberArray.length(); ++i) {
            int uid = Integer.valueOf(memberArray.get(i).toString());
            projectService.insertModuleMemberLink(moduleId, uid);
        }

        JSONArray customerArray = new JSONArray(customerIds);
        for (int i = 0; i < customerArray.length(); ++i) {
            int uid = Integer.valueOf(customerArray.get(i).toString());
            projectService.insertModuleCustomerLink(moduleId, uid);
        }

        return "redirect:/project/" + projectId;
    }


    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public
    @ResponseBody
    Integer deleteProject(@RequestParam int projectId) throws Exception {
        return projectService.deleteProjectByProjectId(projectId);
    }

    @RequestMapping(value = "/comment/{projectId}", method = RequestMethod.POST)
    public String commitComment(HttpServletRequest request, @PathVariable int projectId, @RequestParam String message) throws Exception {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        CommentProject comment = new CommentProject();
        comment.setDetails(URLDecoder.decode(message, "UTF-8"));
        comment.setUserId(userId);
        comment.setProjectId(projectId);
        User user = contactsService.selectUserDetailsById(userId);
        comment.setCompanyId(user.getCompanyId());
        projectService.insertProjectComment(comment);

        return "project/project_comment";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchProject(HttpServletRequest request, @RequestParam String query) throws Exception {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        return projectService.fuzzySelectProject(userId, query, companyId);
    }


    // 权限判断


}