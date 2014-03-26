<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>通讯录</title>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1"/>
    <link rel="stylesheet" type="text/css" href="/static_resources/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static_resources/css/contacts.css"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xs-2">
            <a class="btn btn-primary navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8">
            <h4><c:out value="${department.name}"/></h4>
        </div>
        <div class="col-xs-2">
            <a href="/contacts" class="btn btn-primary navbar-btn pull-right" role="button">首页</a>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${department.userList}" var="user">
        <a href="/contacts/user/${user.id}" class="list-group-item">
            <img class="pull-left" src="/static_resources/images/head.png">
            <h4 class="list-group-item-heading head-pic-text"><c:out value="${user.englishName}"/> (<c:out
                    value="${user.chineseName}"/>)</h4>
            <p class="list-group-item-text head-pic-text"><c:out value="${department.name}"/></p>
        </a>
    </c:forEach>
    <c:forEach items="${department.groupList}" var="group">
        <a href="/contacts/group/${group.id}" class="list-group-item">
            <p class="list-group-item-text"><c:out value="${group.name}"/></p>
        </a>
    </c:forEach>
</div>
<script type="text/javascript" src="/static_resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
