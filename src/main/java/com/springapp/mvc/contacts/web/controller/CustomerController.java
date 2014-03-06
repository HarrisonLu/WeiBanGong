package com.springapp.mvc.contacts.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView showCustomerIndex() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_index");
        Map<String, String> map = new HashMap<String, String>();
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        map.put("id", "1");
        map.put("name", "金秀贤");
        map.put("project", "惠州房产项目");
        list.add(map);
        list.add(map);
        list.add(map);
        modelAndView.addObject("customers", list);
        return modelAndView;
    }

    @RequestMapping(value = "/{customerId}", method = RequestMethod.GET)
    public ModelAndView showCustomerDetail() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_detail");
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", "1");
        map.put("name", "金秀贤");
        map.put("project", "惠州房产项目");
        modelAndView.addObject("customer", map);
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
    public ModelAndView searchCustomer() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_search");
        return modelAndView;
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public ModelAndView filterCustomer() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_filter");
        return modelAndView;
    }

    @RequestMapping(value = "/filter/{filterType}", method = RequestMethod.GET)
    public ModelAndView filterResult(@PathVariable int filterType) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_filter_result");
        Map<String, String> map = new HashMap<String, String>();
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        map.put("id", "1");
        map.put("name", "金秀贤");
        map.put("project", "惠州房产项目");
        for (int i=0;i<filterType;++i) {
            list.add(map);
        }
        modelAndView.addObject("customers", list);
        return modelAndView;
    }


}
