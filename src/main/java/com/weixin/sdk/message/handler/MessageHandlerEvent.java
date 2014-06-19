package com.weixin.sdk.message.handler;

import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.domain.project.Project;
import com.springapp.mvc.service.customer.CustomerService;
import com.springapp.mvc.service.project.ProjectService;
import com.tool.SpringContextUtil;
import com.weixin.sdk.ResourceManager;
import com.weixin.sdk.message.IMessage;
import com.weixin.sdk.message.ItemArticle;
import com.weixin.sdk.message.Message;
import com.weixin.sdk.message.MessageEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.w3c.dom.Element;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

public class MessageHandlerEvent extends MessageHandlerHelper {

    @Override
    protected void parseSpecificMessage(Message message, Element root) {
        MessageEvent messageEvent = (MessageEvent) message;
        messageEvent.setEvent(root.getElementsByTagName(TAG_EVENT).item(0)
                .getTextContent());
        messageEvent.setEventKey(root.getElementsByTagName(TAG_EVENTKEY)
                .item(0).getTextContent());
    }

    @Override
    protected Message handleSpecificMessage() {
        MessageEvent messageEvent = (MessageEvent) message;
        if (messageEvent.getEvent().equalsIgnoreCase(EVENT_SUBSCRIBE)) {
            return buildMessageResultText(ResourceManager.getValue("greeting"));
        } else if (messageEvent.getEvent().equalsIgnoreCase(EVENT_CLICK)) {
            if (messageEvent.getEventKey().equalsIgnoreCase(IMessage.MENU_SUB_KEY11)) {
                return buildMessageResultNews(getProjectList());
            } else if (messageEvent.getEventKey().equalsIgnoreCase(IMessage.MENU_SUB_KEY12)) {
                return buildMessageResultNews(getCustomerList());
            } else if (messageEvent.getEventKey().equalsIgnoreCase(IMessage.MENU_SUB_KEY21)) {
                return buildMessageResultNews(getArticleList());
            } else if (messageEvent.getEventKey().equalsIgnoreCase(IMessage.MENU_SUB_KEY22)) {
                return buildMessageResultNews(getArticleList());
            }
        }
        return null;
    }

    public List<ItemArticle> getProjectList() {
        List<ItemArticle> items = new ArrayList<ItemArticle>();
        ProjectService projectService = (ProjectService) SpringContextUtil.getBean("projectService");
        List<Project> projects = projectService.selectProjectListByUserId(1, 1);
        for (Project project : projects) {
            ItemArticle itemArticle = new ItemArticle();
            itemArticle.setTitle(project.getName());
            itemArticle.setDescription(project.getInfo());
            itemArticle.setPicUrl("http://p0.img.imtuan.com/wechatmsg/article/20130918/91991d9e7a1943e99d98ee588cd94c4f.jpg");
            itemArticle.setUrl("http://wiwork.yunnex.cn/project/comment/" + project.getId());
            items.add(itemArticle);
        }
        return items;
    }

    public List<ItemArticle> getCustomerList() {
        List<ItemArticle> items = new ArrayList<ItemArticle>();
        CustomerService customerService = (CustomerService) SpringContextUtil.getBean("customerService");
        List<Customer> customers = customerService.selectMyCustomerList(1);
        for (Customer customer : customers) {
            ItemArticle itemArticle = new ItemArticle();
            itemArticle.setTitle(customer.getChineseName());
            itemArticle.setDescription(customer.getCustomerValue());
            itemArticle.setPicUrl("http://p0.img.imtuan.com/wechatmsg/article/20130918/91991d9e7a1943e99d98ee588cd94c4f.jpg");
            itemArticle.setUrl("http://wiwork.yunnex.cn/customer/" + customer.getId());
            items.add(itemArticle);
        }
        return items;
    }

    public List<ItemArticle> getArticleList() {
        List<ItemArticle> items = new ArrayList<ItemArticle>();
        ItemArticle itemArticle = new ItemArticle();
        itemArticle.setTitle("WeiBanGong");
        itemArticle.setDescription("");
        itemArticle.setPicUrl("http://p0.img.imtuan.com/wechatmsg/article/20130918/91991d9e7a1943e99d98ee588cd94c4f.jpg");
        itemArticle.setUrl("http://wiwork.yunnex.cn/index");
        items.add(itemArticle);
        return items;
    }

}
