package com.weixin.sdk;

import com.weixin.sdk.message.*;
import com.weixin.sdk.message.handler.*;
import com.weixin.sdk.message.result.handler.MessageResultHandlerHelper;
import com.weixin.sdk.message.result.handler.MessageResultHandlerMusic;
import com.weixin.sdk.message.result.handler.MessageResultHandlerNews;
import com.weixin.sdk.message.result.handler.MessageResultHandlerText;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilderFactory;
import java.util.Arrays;

@Controller
@RequestMapping("/")
public class WeixinController implements IMessage {

    private static final String TOKEN = "wbg";

    private Message message;
    private Message messageResult;

    private MessageHandlerHelper messageHandler;
    private MessageResultHandlerHelper messageResultHandler;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public
    @ResponseBody
    String valid(HttpServletRequest request) {
        String signature = request.getParameter("signature");
        String echostr = request.getParameter("echostr");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");

        if (signature != null && checkSignature(signature, timestamp, nonce)) {
            return echostr;
        }

        return "Hello";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public
    @ResponseBody
    String processMsg(HttpServletRequest request) throws Exception {
        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");

        if (signature != null && checkSignature(signature, timestamp, nonce)) {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            Document document = factory.newDocumentBuilder().parse(request.getInputStream());
            Element root = document.getDocumentElement();
            String type = root.getElementsByTagName(TAG_MSGTYPE).item(0).getTextContent();
            if (type.equalsIgnoreCase(MESSAGE_TEXT)) {
                message = new MessageText();
                messageHandler = new MessageHandlerText();
            } else if (type.equalsIgnoreCase(MESSAGE_IMAGE)) {
                message = new MessageImage();
                messageHandler = new MessageHandlerImage();
            } else if (type.equalsIgnoreCase(MESSAGE_LOCATION)) {
                message = new MessageLocation();
                messageHandler = new MessageHandlerLocation();
            } else if (type.equalsIgnoreCase(MESSAGE_LINK)) {
                message = new MessageLink();
                messageHandler = new MessageHandlerLink();
            } else if (type.equalsIgnoreCase(MESSAGE_EVENT)) {
                message = new MessageEvent();
                messageHandler = new MessageHandlerEvent();
            }
            messageHandler.parseMessage(message, root);
            messageResult = messageHandler.handleMessage(message);

            String msgType = messageResult.getMsgType();
            if (msgType.equalsIgnoreCase(MESSAGE_RESULT_TEXT)) {
                messageResultHandler = new MessageResultHandlerText();
            } else if (msgType.equalsIgnoreCase(MESSAGE_RESULT_MUSIC)) {
                messageResultHandler = new MessageResultHandlerMusic();
            } else if (msgType.equalsIgnoreCase(MESSAGE_RESULT_NEWS)) {
                messageResultHandler = new MessageResultHandlerNews();
            }

            return messageResultHandler.getMessageResult(messageResult);
        }

        return "";
    }

    public boolean checkSignature(String signature, String timestamp, String nonce) {
        String[] dataStr = new String[]{TOKEN, timestamp, nonce};
        Arrays.sort(dataStr);
        String data = dataStr[0] + dataStr[1] + dataStr[2];
        String flag = DigestUtils.sha1Hex(data);
        if (flag.equals(signature))
            return true;
        return false;
    }

}