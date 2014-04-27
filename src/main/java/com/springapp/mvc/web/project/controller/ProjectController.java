package com.springapp.mvc.web.project.controller;

import com.springapp.mvc.domain.customer.CommentCustomer;
import com.springapp.mvc.domain.project.CommentProject;
import com.springapp.mvc.domain.project.Project;
import com.springapp.mvc.service.project.ProjectService;
import com.springapp.mvc.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.List;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

    @Autowired
    private ProjectService projectService;

    @RequestMapping(method = RequestMethod.GET)
    public String showCustomerIndex(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        int userId = (Integer) request.getSession().getAttribute("user_id");
        List<Project> projects = projectService.selectProjectListByUserId(userId);
        model.addAttribute("projects", projects);
        return "/project/project_index";
    }

    @RequestMapping(value = "/{projectId}", method = RequestMethod.GET)
    public String showCustomerDetail(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        Project project = projectService.getProjectDetail(projectId);
        model.addAttribute("project", project);
        return "/project/project_detail";
    }

        @RequestMapping(value = "/comment/{projectId}", method = RequestMethod.GET)
    public String showCustomerComment(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        Project project = projectService.getProjectDetail(projectId);
        List<CommentProject> commentProjects = projectService.getProjectCommentList(projectId);
        model.addAttribute("project", project);
        model.addAttribute("commentProjects", commentProjects);
        return "project/project_comment";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCustomerCreate(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        return "/project/project_create";
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
    Object searchCustomer(HttpServletRequest request, @RequestParam String query) throws Exception {
        int userId = (Integer) request.getSession().getAttribute("user_id");
        return projectService.fuzzySelectProject(userId, query);
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createCustomerCreate(HttpServletRequest request) throws Exception {
        return "redirect:/project";
    }

    @RequestMapping(value = "/edit/{projectId}", method = RequestMethod.POST)
    public String editProject(HttpServletRequest request, ModelMap model, @PathVariable int projectId) throws Exception {
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