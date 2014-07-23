<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>微办公</title>
</head>
<body>
<%--<ul class="nav nav-pills nav-justified">--%>
<%--<li class="active"><a href="#" data-toggle="tab" style="color: #d1d1d1; background-color: #2d3132"><img--%>
<%--src="/static_resources/images/tab_info.png" width="35" height="35">&nbsp;&nbsp;<strong>动态</strong></a></li>--%>
<%--<li class="active"><a href="#" data-toggle="tab" style="color: #d1d1d1; background-color: #2d3132"><img--%>
<%--src="/static_resources/images/tab_main.png" width="35" height="35">&nbsp;&nbsp;<strong>办公</strong></a></li>--%>
<%--</ul>--%>

<div class="container">
    <c:if test="${isAdmin}">
        <div class="row index-icon-row">
            <div class="col-xs-6 index-icon">
                <a href="/account">
                    <img class="index-img" src="/static_resources/images/ic_menu_account.png">
                </a>

                <p></p>

                <p class="index-icon-font"><b>我的账号</b></p>
            </div>
            <div class="col-xs-6 index-icon">
                <a href="/admin">
                    <img class="index-img" src="/static_resources/images/ic_menu_admin.png">
                </a>

                <p></p>

                <p class="index-icon-font"><b>管理权限</b></p>
            </div>
        </div>
    </c:if>

    <c:if test="${!isAdmin}">
        <div class="row index-icon-row">
            <div class="col-xs-4 index-icon">
                <a href="/project">
                    <img class="index-img" src="/static_resources/images/ic_menu_project.png">
                </a>

                <p></p>

                <p class="index-icon-font"><b>项目管理</b></p>
            </div>
            <div class="col-xs-4 index-icon">
                <a href="/customer">
                    <img class="index-img" src="/static_resources/images/ic_menu_customer.png">
                </a>

                <p></p>

                <p class="index-icon-font"><b>客户管理</b></p>
            </div>
            <div class="col-xs-4 index-icon">
                <a href="/approval">
                    <img class="index-img" src="/static_resources/images/ic_menu_approve.png">
                </a>

                <p></p>

                <p class="index-icon-font"><b>审批流</b></p>
            </div>
        </div>

        <div class="row index-icon-row">
            <div class="col-xs-4 index-icon">
                <a href="/contacts">
                    <img class="index-img" src="/static_resources/images/ic_menu_contacts.png">
                </a>

                <p></p>

                <p class="index-icon-font"><b>通讯录</b></p>
            </div>
            <div class="col-xs-4 index-icon">
                <a href="/account">
                    <img class="index-img" src="/static_resources/images/ic_menu_account.png">
                </a>

                <p></p>

                <p class="index-icon-font"><b>我的账号</b></p>
            </div>
            <div class="col-xs-4 index-icon">
                <a href="/index/coming">
                    <img class="index-img" src="/static_resources/images/ic_menu_help.png">
                </a>

                <p></p>

                <p class="index-icon-font"><b>帮助</b></p>
            </div>
        </div>
        <div class="row index-icon-row">
            <div class="col-xs-4 index-icon">
                <a href="/index/coming">
                    <img class="index-img" src="/static_resources/images/ic_menu_feedback.png">
                </a>

                <p></p>

                <p class="index-icon-font"><b>反馈</b></p>
            </div>
        </div>
    </c:if>
</div>
</body>
</html>