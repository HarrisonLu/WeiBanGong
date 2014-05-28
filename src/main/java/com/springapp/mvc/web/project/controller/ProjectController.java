package com.springapp.mvc.web.project.controller;

import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.domain.project.CommentProject;
import com.springapp.mvc.domain.project.Project;
import com.springapp.mvc.service.contacts.ContactsService;
import com.springapp.mvc.service.customer.CustomerService;
import com.springapp.mvc.service.project.ProjectService;
import com.springapp.mvc.web.BaseController;
import com.springapp.mvc.web.project.command.ProjectCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.net.URLDecoder;
import java.util.List;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ContactsService contactsService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping(method = RequestMethod.GET)
    public String showProjectIndex(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        int userId = (Integer) request.getSession().getAttribute("user_id");
        List<Project> projects = projectService.selectProjectListByUserId(userId);
        model.addAttribute("projects", projects);
        return "/project/project_index";
    }

    @RequestMapping(value = "/{projectId}", method = RequestMethod.GET)
    public String showProjectDetail(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        Project project = projectService.getProjectDetail(projectId);
        model.addAttribute("project", project);
        return "/project/project_detail";
    }

    @RequestMapping(value = "/comment/{projectId}", method = RequestMethod.GET)
    public String showProjectComment(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        Project project = projectService.getProjectDetail(projectId);
        List<CommentProject> commentProjects = projectService.getProjectCommentList(projectId);
        model.addAttribute("project", project);
        model.addAttribute("commentProjects", commentProjects);
        return "project/project_comment";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showProjectCreate(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        return "/project/project_create";
    }

    @RequestMapping(value = "/create/manager", method = RequestMethod.GET)
    public String showProjectCreateManager(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        int userId = (Integer) request.getSession().getAttribute("user_id");
        List<User> groupUsers = contactsService.searchGroupUserBaseInfoListByUserId(userId);
        model.addAttribute("groupUsers", groupUsers);

        return "/project/project_create_manager";
    }

    @RequestMapping(value = "/create/member", method = RequestMethod.GET)
    public String showProjectCreateMember(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        int userId = (Integer) request.getSession().getAttribute("user_id");
        List<User> groupUsers = contactsService.searchGroupUserBaseInfoListByUserId(userId);
        model.addAttribute("groupUsers", groupUsers);

        return "/project/project_create_member";
    }

    @RequestMapping(value = "/create/customer", method = RequestMethod.GET)
    public String showProjectCreateCustomer(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        int userId = (Integer) request.getSession().getAttribute("user_id");
        List<Customer> myCustomerList = customerService.selectMyCustomerList(userId);
        model.addAttribute("myCustomerList", myCustomerList);

        return "/project/project_create_customer";
    }

    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public String showProjectManager(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        int userId = (Integer) request.getSession().getAttribute("user_id");
        List<Project> projects = projectService.selectProjectListByUserId(userId);
        model.addAttribute("projects", projects);
        return "/project/project_manager";
    }

    @RequestMapping(value = "/edit/{projectId}", method = RequestMethod.GET)
    public String showProjectEdit(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        Project project = projectService.getProjectDetail(projectId);
        model.addAttribute("project", project);
        return "/project/project_edit";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String showProjectSearch(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        return "/project/project_search";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchProject(HttpServletRequest request, @RequestParam String query) throws Exception {
        int userId = (Integer) request.getSession().getAttribute("user_id");
        return projectService.fuzzySelectProject(userId, query);
    }

    @RequestMapping(value = "/create/manager", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchProjectManager(HttpServletRequest request, @RequestParam String query) throws Exception {
        return projectService.fuzzySelectUserList(query);
    }

    @RequestMapping(value = "/create/member", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchProjectMember(HttpServletRequest request, @RequestParam String query) throws Exception {
        return projectService.fuzzySelectUserList(query);
    }

    @RequestMapping(value = "/create/customer", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchProjectCustomer(HttpServletRequest request, @RequestParam String query) throws Exception {
        return projectService.fuzzySelectCustomerNotLink(query);
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createProject(HttpServletRequest request, @Valid ProjectCommand projectCommand, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            return "/project/project_create";

        int userId = (Integer) request.getSession().getAttribute("user_id");

        Project project = new Project();
        project.setName(projectCommand.getName());
        project.setInfo(projectCommand.getInfo());
        project.setStageId(projectCommand.getStageId());
        project.setCreaterId(userId);
        projectService.insertProject(project);

        return "redirect:/project";
    }

    @RequestMapping(value = "/edit/{projectId}", method = RequestMethod.POST)
    public String editProject(HttpServletRequest request, @PathVariable int projectId, @Valid ProjectCommand projectCommand, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            return "/project/project_edit";

        int userId = (Integer) request.getSession().getAttribute("user_id");

        Project project = new Project();
        project.setId(projectId);
        project.setName(projectCommand.getName());
        project.setInfo(projectCommand.getInfo());
        project.setStageId(projectCommand.getStageId());
        project.setCreaterId(userId);
        projectService.updateProjectDetail(project);

        return "redirect:/project";
    }

    @RequestMapping(value = "/comment/{projectId}/{message}", method = RequestMethod.GET)
    public String commitComment(HttpServletRequest request, @PathVariable int projectId, @PathVariable String message) throws Exception {
        CommentProject comment = new CommentProject();
        comment.setDetails(URLDecoder.decode(message, "UTF-8"));
        comment.setUserId((Integer) request.getSession().getAttribute("user_id"));
        comment.setProjectId(projectId);
        projectService.insertProjectComment(comment);
        return "/project/project_comment";
    }

}