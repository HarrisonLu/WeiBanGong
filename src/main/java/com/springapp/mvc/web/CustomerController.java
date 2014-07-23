package com.springapp.mvc.web;

import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.CommentCustomer;
import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.service.contacts.ContactsService;
import com.springapp.mvc.service.customer.CustomerService;
import com.springapp.mvc.web.BaseController;
import com.tool.DateHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ContactsService contactsService;

    @RequestMapping(method = RequestMethod.GET)
    public String showCustomerIndex(HttpServletRequest request, ModelMap model) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;
        if (isAdminRole(request))
            return adminDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        List<Customer> myCustomerList = customerService.selectMyCustomerList(userId);
        List<Customer> sharedCustomerList = customerService.selectSharedCustomerList(userId);
        model.addAttribute("myCustomerList", myCustomerList);
        model.addAttribute("sharedCustomerList", sharedCustomerList);
        return "customer/customer_index";
    }

    @RequestMapping(value = "/{customerId}", method = RequestMethod.GET)
    public String showMyCustomerDetail(HttpServletRequest request, ModelMap model, @PathVariable int customerId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        Customer customer = customerService.selectCustomerDetails(customerId);
        boolean isMine = customerService.isMyCustomer(userId, customerId);
        model.addAttribute("customer", customer);
        model.addAttribute("isMine", isMine);
        return "customer/customer_detail";
    }

    @RequestMapping(value = "/edit/{customerId}", method = RequestMethod.GET)
    public String showCustomerEdit(HttpServletRequest request, ModelMap model, @PathVariable int customerId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        Customer customer = customerService.selectCustomerDetails(customerId);
        model.addAttribute("customer", customer);
        return "customer/customer_edit";
    }

    @RequestMapping(value = "/comment/{customerId}", method = RequestMethod.GET)
    public String showCustomerComment(HttpServletRequest request, ModelMap model, @PathVariable int customerId) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        Customer customer = customerService.selectCustomerDetails(customerId);
        List<CommentCustomer> comments = customerService.selectCommentCustomerListByCustomerId(customerId, companyId);
        model.addAttribute("customer", customer);
        model.addAttribute("comments", comments);

        return "customer/customer_comment";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCustomerCreate(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "customer/customer_create";
    }

    @RequestMapping(value = "/create/project", method = RequestMethod.GET)
    public String showCustomerProject(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "customer/customer_create_project";
    }

    @RequestMapping(value = "/create/task", method = RequestMethod.GET)
    public String showCustomerTask(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "customer/customer_task";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String showCustomerSearch(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "customer/customer_search";
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public String showCustomerFilter(HttpServletRequest request) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        return "customer/customer_filter";
    }

    @RequestMapping(value = "/filter/{filterType}", method = RequestMethod.GET)
    public String showCustomerFilterResult(HttpServletRequest request, ModelMap model, @PathVariable int filterType) throws Exception {
        if (isSessionExpired(request))
            return sessionExpiredDirectedUrl;

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        List<Customer> myCustomerList = customerService.selectMyCustomerListByDiscussStage(userId, filterType);
        List<Customer> sharedCustomerList = customerService.selectSharedCustomerListByDiscussStage(userId, filterType);
        model.addAttribute("myCustomerList", myCustomerList);
        model.addAttribute("sharedCustomerList", sharedCustomerList);

        return "customer/customer_filter_result";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createCustomer(HttpServletRequest request) throws Exception {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);

        Customer customer = new Customer();
        customer.setChineseName(request.getParameter("chineseName"));
        customer.setEnglishName(request.getParameter("englishName"));
        customer.setGender(request.getParameter("gender"));
        customer.setDiscussStageId(Integer.parseInt(request.getParameter("stage")));
        customer.setCustomerValue(request.getParameter("customerValue"));
        customer.setMobilePhoneNum(request.getParameter("mobilePhoneNum"));
        customer.setWechatNum(request.getParameter("wechatNum"));
        customer.setTelephoneNum(request.getParameter("telephoneNum"));
        customer.setQqNum(request.getParameter("qqNum"));
        customer.setEmail(request.getParameter("email"));
        String birthday = request.getParameter("birthday");
        if (!birthday.equals(""))
            customer.setBirthday(DateHelper.getShortDateByString(birthday));
        customer.setHobby(request.getParameter("hobby"));
        customer.setCreatedUserId(userId);
        customer.setCompanyId(companyId);
        String projectId = request.getParameter("projectId");
        if (!projectId.equals(""))
            customer.setProjectId(Integer.parseInt(projectId));
        customerService.insertCustomer(customer);

        return "redirect:/customer";
    }

    @RequestMapping(value = "/edit/{customerId}", method = RequestMethod.POST)
    public String editCustomer(HttpServletRequest request, @PathVariable int customerId) throws Exception {

        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);

        Customer customer = new Customer();
        customer.setId(customerId);
        customer.setChineseName(request.getParameter("chineseName"));
        customer.setEnglishName(request.getParameter("englishName"));
        customer.setGender(request.getParameter("gender"));
        customer.setDiscussStageId(Integer.parseInt(request.getParameter("stage")));
        customer.setCustomerValue(request.getParameter("customerValue"));
        customer.setMobilePhoneNum(request.getParameter("mobilePhoneNum"));
        customer.setWechatNum(request.getParameter("wechatNum"));
        customer.setTelephoneNum(request.getParameter("telephoneNum"));
        customer.setQqNum(request.getParameter("qqNum"));
        customer.setEmail(request.getParameter("email"));
        String birthday = request.getParameter("birthday");
        if (!birthday.equals(""))
            customer.setBirthday(DateHelper.getShortDateByString(birthday));
        customer.setHobby(request.getParameter("hobby"));
        customer.setCreatedUserId(userId);
        customer.setCompanyId(companyId);
        String projectId = request.getParameter("projectId");
        if (!projectId.equals(""))
            customer.setProjectId(Integer.parseInt(projectId));
        customerService.updateCustomer(customer);

        return "redirect:/customer";
    }

    @RequestMapping(value = "/create/project", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchCustomerProject(HttpServletRequest request) throws Exception {
        int companyId = (Integer) request.getSession().getAttribute(COMPANY_ID);
        return customerService.fuzzySelectProjectBaseInfoList(request.getParameter("query"), companyId);
    }

    @RequestMapping(value = "/comment/{customerId}", method = RequestMethod.POST)
    public String commitComment(HttpServletRequest request, @PathVariable int customerId) throws Exception {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        CommentCustomer comment = new CommentCustomer();
        comment.setDetails(URLDecoder.decode(request.getParameter("message"), "UTF-8"));
        comment.setUserId(userId);
        comment.setCustomerId(customerId);
        User user = contactsService.selectUserDetailsById(userId);
        comment.setCompanyId(user.getCompanyId());
        customerService.insertCommentCustomer(comment);

        return "customer/customer_comment";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public
    @ResponseBody
    Object searchCustomer(HttpServletRequest request) throws Exception {
        int userId = (Integer) request.getSession().getAttribute(ACCOUNT_ID);
        return customerService.fuzzySelectCustomer(userId, request.getParameter("query"));
    }

}