<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>审批流</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>新建审批流</h4>
        </div>
    </div>
</div>

<div class="list-group">
    <a href="/approval/create/1" class="list-group-item list-group-item-higher">
        <img class="pull-left head-pic" src="/static_resources/images/ic_menu_approve.png">
        <h4 class="list-group-item-text head-pic-text">休假申请</h4>
    </a>
    <a href="/approval/create/2" class="list-group-item list-group-item-higher">
        <img class="pull-left head-pic" src="/static_resources/images/ic_menu_approve.png">
        <h4 class="list-group-item-text head-pic-text">出差申请</h4>
    </a>
    <a href="/approval/create/3" class="list-group-item list-group-item-higher">
        <img class="pull-left head-pic" src="/static_resources/images/ic_menu_approve.png">
        <h4 class="list-group-item-text head-pic-text">费用报销</h4>
    </a>
    <a href="/approval/create/4" class="list-group-item list-group-item-higher">
        <img class="pull-left head-pic" src="/static_resources/images/ic_menu_approve.png">
        <h4 class="list-group-item-text head-pic-text">物品申请</h4>
    </a>
    <a href="/approval/create/5" class="list-group-item list-group-item-higher">
        <img class="pull-left head-pic" src="/static_resources/images/ic_menu_approve.png">
        <h4 class="list-group-item-text head-pic-text">经费申请</h4>
    </a>
    <a href="/approval/create/6" class="list-group-item list-group-item-higher">
        <img class="pull-left head-pic" src="/static_resources/images/ic_menu_approve.png">
        <h4 class="list-group-item-text head-pic-text">加班申请</h4>
    </a>
    <a href="/approval/create/7" class="list-group-item list-group-item-higher">
        <img class="pull-left head-pic" src="/static_resources/images/ic_menu_approve.png">
        <h4 class="list-group-item-text head-pic-text">其它申请</h4>
    </a>
</div>
</body>
</html>
