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
    <div class="row-fluid title-bar">
        <div class="col-xs-12 title-bar-text">
            <a href="javascript:onUserCreate()" class="btn btn-primary" role="button">新建组成员</a>
        </div>
    </div>

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

<script>
    $(document).ready(function () {
        if (localStorage[REFRESH_USER] == 1) {
            localStorage[REFRESH_USER] = 0;
            window.location.reload();
        }
    });

    function onUserCreate() {
        if (${!postfixCreated}) {
            toastr.warning("请先前往我的账号设置员工后缀");
            return;
        }
        window.location.href = "/admin/structure/department/" + ${department.id} +"/group/" + ${group.id}+"/user/create/";
    }
</script>
</body>
</html>
