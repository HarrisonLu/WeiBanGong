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
            <h4>员工权限管理</h4>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${departments}" var="department">
        <a href="/admin/member/department/${department.id}" class="list-group-item list-group-item-higher">
            <img class="pull-left head-pic-small" src="/static_resources/images/btn_head.png">
            <h4 class="list-group-item-text head-pic-text">${department.name}</h4>
        </a>
    </c:forEach>
</div>

</body>
</html>
