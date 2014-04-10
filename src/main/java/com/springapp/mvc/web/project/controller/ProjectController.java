package com.springapp.mvc.web.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView showProjectIndex(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/project/project_index");
        return modelAndView;
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView showProjectCreate(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/project/project_create");
        return modelAndView;
    }

    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public ModelAndView showProjectManager(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/project/project_manager");
        return modelAndView;
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView showProjectSearch(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/project/project_search");
        return modelAndView;
    }

}