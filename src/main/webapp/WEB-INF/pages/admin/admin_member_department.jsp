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
    <c:forEach items="${department.userList}" var="user">
        <a href="/admin/member/detail/${user.id}" class="list-group-item">
            <img class="pull-left head-pic" src="/static_resources/images/head.png">
            <h4 class="list-group-item-heading head-pic-text">${user.englishName} (${user.chineseName})</h4>

            <p class="list-group-item-text head-pic-text info-detail">${department.name}</p>
        </a>
    </c:forEach>
    <c:forEach items="${department.groupList}" var="group">
        <a href="/admin/member/group/${group.id}" class="list-group-item list-group-item-higher">
            <img class="pull-left head-pic-small" src="/static_resources/images/btn_head.png">
            <h4 class="list-group-item-text head-pic-text">${group.name}</h4>
        </a>
    </c:forEach>
    <c:if test="${department.groupList.size() == 0}">
        <li class="list-group-item list-group-item-higher">
            <h4 class="list-group-item-text">暂无部门</h4>
        </li>
    </c:if>
</div>

</body>
</html>
