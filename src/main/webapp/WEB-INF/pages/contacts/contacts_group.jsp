<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>通讯录</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>${group.name}</h4>
        </div>
        <%--<div class="col-xs-2" style="margin-top: 10px">--%>
            <%--<a href="/contacts"><img src="/static_resources/images/btn_head.png" width="32" height="32"></a>--%>
        <%--</div>--%>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${group.userList}" var="user">
        <a href="/contacts/user/${user.id}" class="list-group-item" style="min-height: 64px">
            <img class="pull-left" src="/static_resources/images/head.png">
            <h4 class="list-group-item-heading head-pic-text">${user.englishName} (${user.chineseName})</h4>
            <p class="list-group-item-text head-pic-text info-detail">${group.departmentName} - ${group.name}</p>
        </a>
    </c:forEach>
    <c:if test="${group.userList.size() == 0}">
        <li class="list-group-item" style="min-height: 64px">
            <h4 class="list-group-item-text">暂无分组成员</h4>
        </li>
    </c:if>
</div>
</body>
</html>
