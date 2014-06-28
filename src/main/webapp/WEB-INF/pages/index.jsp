<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>微办公</title>
</head>
<body>
<ul class="nav nav-pills nav-justified">
    <li class="active"><a href="#" data-toggle="tab" style="color: #d1d1d1; background-color: #2d3132"><img src="/static_resources/images/tab_info.png" width="35" height="35">&nbsp;&nbsp;<strong>动态</strong></a></li>
    <li class="active"><a href="#" data-toggle="tab" style="color: #d1d1d1; background-color: #2d3132"><img src="/static_resources/images/tab_main.png" width="35" height="35">&nbsp;&nbsp;<strong>办公</strong></a></li>
</ul>

<div class="container">
    <div class="row index-icon-row">
        <div class="col-xs-4 index-icon">
            <a href="/project">
                <img src="/static_resources/images/ic_menu_project.png" width="60" height="60">
            </a>
            <p></p>
            <p><b>项目管理</b></p>
        </div>
        <div class="col-xs-4 index-icon">
            <a href="/customer">
                <img src="/static_resources/images/ic_menu_customer.png" width="60" height="60">
            </a>
            <p></p>
            <p><b>客户管理</b></p>
        </div>
        <div class="col-xs-4 index-icon">
            <a href="/approval">
                <img src="/static_resources/images/ic_menu_approve.png" width="60" height="60">
            </a>
            <p></p>
            <p><b>审批流</b></p>
        </div>
    </div>

    <div class="row index-icon-row">
        <div class="col-xs-4 index-icon">
            <a href="/contacts">
                <img src="/static_resources/images/ic_menu_contacts.png" width="60" height="60">
            </a>
            <p></p>
            <p><b>通讯录</b></p>
        </div>
        <div class="col-xs-4 index-icon">
            <a href="/account">
                <img src="/static_resources/images/ic_menu_help.png" width="60" height="60">
            </a>
            <p></p>
            <p><b>我的账户</b></p>
        </div>
        <div class="col-xs-4 index-icon">
            <a href="/admin">
                <img src="/static_resources/images/ic_menu_feedback.png" width="60" height="60">
            </a>
            <p></p>
            <p><b>管理权限</b></p>
        </div>
    </div>

    <div class="row index-icon-row">
        <div class="col-xs-4 index-icon">
            <a href="#">
                <img src="/static_resources/images/ic_menu_share.png" width="60" height="60">
            </a>
            <p></p>
            <p><b>共享平台</b></p>
        </div>
        <div class="col-xs-4 index-icon">
            <a href="#">
                <img src="/static_resources/images/ic_menu_help.png" width="60" height="60">
            </a>
            <p></p>
            <p><b>帮助</b></p>
        </div>
        <div class="col-xs-4 index-icon">
            <a href="javascript:onLogout()">
                <img src="/static_resources/images/ic_menu_feedback.png" width="60" height="60">
            </a>
            <p></p>
            <p><b>反馈</b></p>
        </div>
    </div>
</div>

<script>
    function onLogout() {
        $.ajax({
            type: "POST",
            url: "/logout",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function(data) {
            }
        });
    }
</script>
</body>
</html>