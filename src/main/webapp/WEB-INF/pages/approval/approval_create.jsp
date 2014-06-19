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
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>新建审批流</h4>
        </div>
    </div>
</div>

<div class="list-group">
    <a href="/approval/create/leave" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">休假申请</h4>
    </a>
    <a href="/approval/create/travel" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">出差申请</h4>
    </a>
    <a href="/approval/create/goods" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">物品申请</h4>
    </a>
    <a href="/approval/create/funds" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">经费申请</h4>
    </a>
    <a href="/approval/create/overtime" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">加班申请</h4>
    </a>
    <a href="/approval/create/others" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">其它申请</h4>
    </a>
</div>
</body>
</html>
