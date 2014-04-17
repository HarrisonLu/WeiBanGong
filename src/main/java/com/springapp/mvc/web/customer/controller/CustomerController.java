package com.springapp.mvc.web.customer.controller;

import com.springapp.mvc.domain.customer.Comment;
import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.service.customer.CustomerService;
import com.springapp.mvc.web.customer.command.CustomerCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
    public String showCustomerIndex(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        int userId = (Integer) request.getSession().getAttribute("user_id");
        List<Customer> myCustomerList = customerService.selectMyCustomerList(userId);
        List<Customer> sharedCustomerList = customerService.selectSharedCustomerList(userId);
        model.addAttribute("myCustomerList", myCustomerList);
        model.addAttribute("sharedCustomerList", sharedCustomerList);
        return "/customer/customer_index";
    }

    @RequestMapping(value = "/mine/{customerId}", method = RequestMethod.GET)
    public String showMyCustomerDetail(HttpServletRequest request, ModelMap model, @PathVariable int customerId) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        Customer customer = customerService.selectCustomerDetails(customerId);
        model.addAttribute("customer", customer);
        model.addAttribute("isMine", true);
        return "/customer/customer_detail";
    }

    @RequestMapping(value = "/shared/{customerId}", method = RequestMethod.GET)
    public String showSharedCustomerDetail(HttpServletRequest request, ModelMap model, @PathVariable int customerId) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        Customer customer = customerService.selectCustomerDetails(customerId);
        model.addAttribute("customer", customer);
        model.addAttribute("isMine", false);
        return "/customer/customer_detail";
    }

    @RequestMapping(value = "/mine/edit/{customerId}", method = RequestMethod.GET)
    public String showCustomerEdit(HttpServletRequest request, ModelMap model, @PathVariable int customerId) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        Customer customer = customerService.selectCustomerDetails(customerId);
        model.addAttribute("customer", customer);
        return "/customer/customer_edit";
    }

    @RequestMapping(value = "/comment/{customerId}", method = RequestMethod.GET)
    public String showCustomerComment(HttpServletRequest request, ModelMap model, @PathVariable int customerId) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        Customer customer = customerService.selectCustomerDetails(customerId);
        List<Comment> comments = customerService.selectCommentListByCustomerId(customerId);
        model.addAttribute("customer", customer);
        model.addAttribute("comments", comments);
        return "/customer/customer_comment";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCustomerCreate(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";
        return "/customer/customer_create";
    }

    @RequestMapping(value = "/create/project", method = RequestMethod.GET)
    public String showCustomerProject(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";
        return "/customer/customer_project";
    }

    @RequestMapping(value = "/create/task", method = RequestMethod.GET)
    public String showCustomerTask(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";
        return "/customer/customer_task";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String showSearchCustomer(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";
        return "/customer/customer_search";
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public String filterCustomer(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";
        return "/customer/customer_filter";
    }

    @RequestMapping(value = "/filter/{filterType}", method = RequestMethod.GET)
    public String filterResult(HttpServletRequest request, ModelMap model, @PathVariable int filterType) throws Exception {
        if (isSessionExpired(request))
            return "redirect:/index";

        int userId = (Integer) request.getSession().getAttribute("user_id");
        List<Customer> myCustomerList = customerService.selectMyCustomerListByDiscussStage(userId, filterType);
        List<Customer> sharedCustomerList = customerService.selectSharedCustomerListByDiscussStage(userId, filterType);
        model.addAttribute("myCustomerList", myCustomerList);
        model.addAttribute("sharedCustomerList", sharedCustomerList);
        return "/customer/customer_filter_result";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveCustomer(HttpServletRequest request, @Valid CustomerCommand customerCommand, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors())
            return "/customer/customer_create";

        Customer customer = new Customer();
        customer.setChineseName(customerCommand.getChineseName());
        customer.setEnglishName(customerCommand.getEnglishName());
        customer.setGender(customerCommand.getGender());
        customer.setPhone(customerCommand.getPhone());
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
        int userId = (Integer) request.getSession().getAttribute("user_id");
        return customerService.fuzzySelectCustomer(userId, query);
    }

    @RequestMapping(value = "/comment/{customerId}/{message}", method = RequestMethod.GET)
    public String commitComment(HttpServletRequest request, @PathVariable int customerId, @PathVariable String message) throws Exception {
        Comment comment = new Comment();
        comment.setDetails(URLDecoder.decode(message, "UTF-8"));
        comment.setUserId((Integer) request.getSession().getAttribute("user_id"));
        comment.setCustomerId(customerId);
        customerService.insertComment(comment);
        return "redirect:/customer/comment/" + customerId;
    }


}
