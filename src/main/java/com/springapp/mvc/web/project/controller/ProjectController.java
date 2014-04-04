package com.springapp.mvc.web.project.controller;

import com.springapp.mvc.service.project.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView showProjectIndex(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/project/project_index");
        int userId = 1;
        request.getSession().setAttribute("user_id", userId);
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView showProjectCreate(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/project/project_create");
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView showProjectManager(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/project/project_manager");
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView showProjectSearch(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/project/project_search");
        return modelAndView;
    }

}
