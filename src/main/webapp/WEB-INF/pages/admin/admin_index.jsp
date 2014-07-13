<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>权限管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>管理员</h4>
        </div>
    </div>
</div>

<div class="list-group">
    <a href="/admin/structure" class="list-group-item list-group-item-higher">
        <h4 class="list-group-item-text">组织架构管理</h4>
    </a>
    <%--<a href="/admin/approval" class="list-group-item" style="min-height: 64px">--%>
    <%--<h4 class="list-group-item-text">审批流管理</h4>--%>
    <%--</a>--%>
    <a href="/admin/member" class="list-group-item list-group-item-higher">
        <h4 class="list-group-item-text">员工权限管理</h4>
    </a>
</div>
</body>
</html>
