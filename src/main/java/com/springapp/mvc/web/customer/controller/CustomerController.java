package com.springapp.mvc.web.customer.controller;

import com.springapp.mvc.domain.customer.CommentCustomer;
import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.service.customer.CustomerService;
import com.springapp.mvc.web.customer.command.CustomerCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.net.URLDecoder;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    private boolean isSessionExpired(HttpServletRequest request) {
        return request.getSession() == null || request.getSession().getAttribute("user_id") == null;
    }

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
    public ModelAndView showCustomerComment(@PathVariable int customerId) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_comment");
        Customer customer = customerService.selectCustomerDetails(customerId);
        List<CommentCustomer> commentCustomers = customerService.selectCommentListByCustomerId(customerId);
        modelAndView.addObject("customer", customer);
        modelAndView.addObject("comments", commentCustomers);
        return modelAndView;
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView showCustomerCreate() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_create");
        return modelAndView;
    }

    @RequestMapping(value = "/create/project", method = RequestMethod.GET)
    public ModelAndView showCustomerProject() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_project");
        return modelAndView;
    }

    @RequestMapping(value = "/create/task", method = RequestMethod.GET)
    public ModelAndView showCustomerTask() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_task");
        return modelAndView;
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView showSearchCustomer() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_search");
        return modelAndView;
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public ModelAndView filterCustomer() throws Exception {
        ModelAndView modelAndView = new ModelAndView("/customer/customer_filter");
        return modelAndView;
    }

    @RequestMapping(value = "/filter/{filterType}", method = RequestMethod.GET)
    public ModelAndView filterResult(HttpServletRequest request, @PathVariable int filterType) throws Exception {
        if (isSessionExpired(request)) {
            return new ModelAndView("redirect:/customer");
        } else {
            ModelAndView modelAndView = new ModelAndView("/customer/customer_filter_result");
            int userId = (Integer) request.getSession().getAttribute("user_id");
            List<Customer> myCustomerList = customerService.selectMyCustomerListByDiscussStage(userId, filterType);
            List<Customer> sharedCustomerList = customerService.selectSharedCustomerListByDiscussStage(userId, filterType);
            modelAndView.addObject("myCustomerList", myCustomerList);
            modelAndView.addObject("sharedCustomerList", sharedCustomerList);
            return modelAndView;
        }
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveCustomer(HttpServletRequest request, @Valid CustomerCommand customerCommand, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            return "/customer/customer_create";

        Customer customer = new Customer();
        customer.setChineseName(customerCommand.getChineseName());
        customer.setEnglishName(customerCommand.getEnglishName());
        customer.setGender(customerCommand.getGender());
        //customer.setPhone(customerCommand.getPhone());
        customer.setWechatNum(customerCommand.getWechatNum());
        customer.setQqNum(customerCommand.getQqNum());
        customer.setEmail(customerCommand.getEmail());
        customer.setCustomerValue(customerCommand.getCustomerValue());
        customer.setBirthday(customerCommand.getBirthday());
        customer.setHobby(customerCommand.getHobby());
        customer.setCreatedUserId(1);
        customer.setProjectId(1);
        customer.setModuleId(1);
        customer.setTaskId(1);
        customer.setDiscussStageId(customerCommand.getDiscussStageId());
        customerService.insertCustomer(customer);
        return "redirect:/customer";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchCustomer(HttpServletRequest request, @RequestParam String query) throws Exception {
        if (isSessionExpired(request)) {
            return new ModelAndView("redirect:/customer");
        } else {
            int userId = (Integer) request.getSession().getAttribute("user_id");
            return customerService.fuzzySelectCustomer(userId, query);
        }
    }

    @RequestMapping(value = "/{customerId}/comment/{message}", method = RequestMethod.GET)
    public String commitComment(HttpServletRequest request, @PathVariable int customerId, @PathVariable String message) throws Exception {
        CommentCustomer commentCustomer = new CommentCustomer();
        commentCustomer.setDetails(URLDecoder.decode(message, "UTF-8"));
        commentCustomer.setUserId((Integer) request.getSession().getAttribute("user_id"));
        commentCustomer.setCustomerId(customerId);
        customerService.insertComment(commentCustomer);
        return "redirect:/customer/" + customerId + "/commentCustomer";
    }


}
