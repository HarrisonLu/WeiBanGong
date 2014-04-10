<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>微办公</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/index.css">
</head>
<body>
<ul class="nav nav-pills nav-justified">
    <li><a href="#" data-toggle="tab"><img src="/static_resources/images/tab_info.png">&nbsp;&nbsp;<strong>动态</strong></a></li>
    <li class="active"><a href="#" data-toggle="tab"><img src="/static_resources/images/tab_main.png">&nbsp;&nbsp;<strong>办公</strong></a></li>
</ul>

<div class="container">
    <div class="row">
        <div class="col-xs-4">
            <a href="/project">
                <img src="/static_resources/images/ic_menu_project.png">
            </a>
            <p>项目管理</p>
        </div>
        <div class="col-xs-4">
            <a href="/customer">
                <img src="/static_resources/images/ic_menu_customer.png">
            </a>
            <p>客户管理</p>
        </div>
        <div class="col-xs-4">
            <a href="#">
                <img src="/static_resources/images/ic_menu_approve.png">
            </a>
            <p>审批流</p>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-4">
            <a href="/contacts">
                <img src="/static_resources/images/ic_menu_contacts.png">
            </a>
            <p>通讯录</p>
        </div>
        <div class="col-xs-4">
            <a href="#">
                <img src="/static_resources/images/ic_menu_help.png">
            </a>
            <p>帮助</p>
        </div>
        <div class="col-xs-4">
            <a href="#">
                <img src="/static_resources/images/ic_menu_feedback.png">
            </a>
            <p>反馈</p>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-4">
            <a href="#">
                <img src="/static_resources/images/ic_menu_share.png">
            </a>
            <p>共享平台</p>
        </div>
    </div>
</div>

<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>