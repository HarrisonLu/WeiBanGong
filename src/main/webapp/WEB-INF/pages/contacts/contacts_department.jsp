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
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4><c:out value="${department.name}"/></h4>
        </div>
        <div class="col-xs-2">
            <a href="/contacts" class="btn btn-primary navbar-btn pull-right" role="button">首页</a>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${department.userList}" var="user">
        <a href="/contacts/user/${user.id}" class="list-group-item" style="min-height: 64px">
            <img class="pull-left" src="/static_resources/images/head.png">
            <h4 class="list-group-item-heading head-pic-text"><c:out value="${user.englishName}"/> (<c:out
                    value="${user.chineseName}"/>)</h4>
            <p class="list-group-item-text head-pic-text"><c:out value="${department.name}"/></p>
        </a>
    </c:forEach>
    <c:forEach items="${department.groupList}" var="group">
        <a href="/contacts/group/${group.id}" class="list-group-item" style="min-height: 64px">
            <img class="pull-left" src="/static_resources/images/btn_home2.png" style="margin-top: 6px">
            <h4 class="list-group-item-text head-pic-text"><c:out value="${group.name}"/></h4>
        </a>
    </c:forEach>
</div>
<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
