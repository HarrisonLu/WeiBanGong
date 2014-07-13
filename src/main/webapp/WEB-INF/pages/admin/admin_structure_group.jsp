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
            <h4>组织架构管理</h4>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${group.userList}" var="user">
        <a href="/admin/structure/detail/${user.id}" class="list-group-item">
            <img class="pull-left" src="/static_resources/images/head.png">
            <h4 class="list-group-item-heading head-pic-text">${user.englishName} (${user.chineseName})</h4>

            <p class="list-group-item-text head-pic-text info-detail">${group.departmentName} - ${group.name}</p>
        </a>
    </c:forEach>
    <c:if test="${group.userList.size() == 0}">
        <li class="list-group-item list-group-item-higher">
            <h4 class="list-group-item-text">暂无分组成员</h4>
        </li>
    </c:if>
</div>

</body>
</html>
