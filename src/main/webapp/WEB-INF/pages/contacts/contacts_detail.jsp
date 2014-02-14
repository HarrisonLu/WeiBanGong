<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>通讯录</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/index.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <nav class="navbar navbar-default" role="navigation">
        <a href="/contacts" class="btn btn-default navbar-btn" role="button">返回</a>
        <a href="/contacts" class="btn btn-default navbar-btn" role="button">主页</a>
    </nav>

    <div class="media">
        <a class="pull-left" href="#">
            <img class="media-object" data-src="holder.js/60x60" alt="">
        </a>
        <div class="media-body">
            <p class="media-heading"><c:out value="${user.englishName}"/> (<c:out value="${user.chineseName}"/>)</p>
            <c:forEach items="${user.departments}" var="department">
                <p><c:out value="${department.name}"/></p>
            </c:forEach>
        </div>
    </div>

    <div class="page-header">
        <h4>联系方式</h4>
    </div>

    <ul class="list-group">
        <li class="list-group-item">微信号：<c:out value="${user.weChatNum}"/></li>
        <li class="list-group-item">座机：<c:out value="${user.phoneNum}"/></li>
        <li class="list-group-item">手机：<c:out value="${user.phoneNum}"/></li>
        <li class="list-group-item">QQ号：<c:out value="${user.qqNum}"/></li>
        <li class="list-group-item">邮箱：<c:out value="${user.email}"/></li>
    </ul>

    <div class="page-header">
        <h4>组织架构</h4>
    </div>

    <ul class="list-group">
        <c:forEach items="${user.departments}" var="department">
            <a href="/contacts/department/${department.id}" class="list-group-item">
                <c:out value="${department.name}"/>
            </a>
        </c:forEach>
    </ul>

</div>
</body>
</html>
