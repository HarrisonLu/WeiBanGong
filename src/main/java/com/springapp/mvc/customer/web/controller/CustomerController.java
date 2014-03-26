package com.springapp.mvc.customer.web.controller;

import com.springapp.mvc.customer.service.CustomerService;
import com.springapp.mvc.domain.customer.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView showCustomerIndex(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_index");
        int userId = 1;
        request.getSession().setAttribute("user_id", userId);
        List<Customer> myCustomerList = customerService.selectMyCustomerList(userId);
        List<Customer> sharedCustomerList = customerService.selectSharedCustomerList(userId);
        modelAndView.addObject("myCustomerList", myCustomerList);
        modelAndView.addObject("sharedCustomerList", sharedCustomerList);
        return modelAndView;
    }

    @RequestMapping(value = "/{customerId}", method = RequestMethod.GET)
    public ModelAndView showCustomerDetail(@PathVariable int customerId) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_detail");
        Customer customer = customerService.selectCustomerDetails(customerId);
        modelAndView.addObject("customer", customer);
        return modelAndView;
    }

    @RequestMapping(value = "/{customerId}/comment", method = RequestMethod.GET)
    public ModelAndView showCustomerComment() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_comment");
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", "1");
        map.put("name", "金秀贤");
        map.put("project", "惠州房产项目");
        modelAndView.addObject("customer", map);
        return modelAndView;
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView createCustomer() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_create");
        return modelAndView;
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView showSearchCustomer() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_search");
        return modelAndView;
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchCustomer(HttpServletRequest request, @RequestParam String query) throws Exception {
        int userId = (Integer)request.getSession().getAttribute("user_id");
        return customerService.fuzzySelectCustomer(userId, query);
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public ModelAndView filterCustomer() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_filter");
        return modelAndView;
    }

    @RequestMapping(value = "/filter/{filterType}", method = RequestMethod.GET)
    public ModelAndView filterResult(HttpServletRequest request, @PathVariable int filterType) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_filter_result");
        int userId = (Integer)request.getSession().getAttribute("user_id");
        List<Customer> customers = customerService.selectCustomerListByDiscussStage(userId, filterType);
        modelAndView.addObject("customers", customers);
        return modelAndView;
    }


}
