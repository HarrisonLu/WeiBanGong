<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>通讯录</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/wiwork.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4><c:out value="${department.name}"/></h4>
        </div>
        <%--<div class="col-xs-2" style="margin-top: 10px">--%>
            <%--<a href="/contacts"><img src="/static_resources/images/btn_head.png" width="32" height="32"></a>--%>
        <%--</div>--%>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${department.userList}" var="user">
        <a href="/contacts/user/${user.id}" class="list-group-item" style="min-height: 64px">
            <img class="pull-left" src="/static_resources/images/head.png" width="40" height="40">
            <h4 class="list-group-item-heading head-pic-text"><c:out value="${user.englishName}"/> (<c:out
                    value="${user.chineseName}"/>)</h4>
            <p class="list-group-item-text head-pic-text"><c:out value="${department.name}"/></p>
        </a>
    </c:forEach>
    <c:forEach items="${department.groupList}" var="group">
        <a href="/contacts/group/${group.id}" class="list-group-item" style="min-height: 64px">
            <img class="pull-left" src="/static_resources/images/btn_head.png" width="35" height="35" style="margin-top: 4px">
            <h4 class="list-group-item-text head-pic-text"><c:out value="${group.name}"/></h4>
        </a>
    </c:forEach>
    <c:if test="${department.groupList.size() == 0}">
        <li class="list-group-item" style="min-height: 64px">
            <h4 class="list-group-item-text">暂无部门</h4>
        </li>
    </c:if>
</div>
<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
