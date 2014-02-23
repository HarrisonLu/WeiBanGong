<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>通讯录</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/contacts.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-xs-2">
            <a class="btn btn-primary navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8">
            <h4><c:out value="${group.name}"/></h4>
        </div>
        <div class="col-xs-2">
            <a href="/contacts" class="btn btn-primary navbar-btn pull-right" role="button">首页</a>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${group.userList}" var="user">
        <a href="/contacts/user/${user.id}" class="list-group-item">
            <img class="pull-left" data-src="holder.js/44x44" alt="">
            <h4 id="user_heading" class="list-group-item-heading"><c:out value="${user.englishName}"/> (<c:out
                    value="${user.chineseName}"/>)</h4>
            <p id="user_text" class="list-group-item-text"><c:out value="${group.departmentName}"/> - <c:out value="${group.name}"/></p>
        </a>
    </c:forEach>
    <c:if test="${group.userList.size() == 0}">
        <p class="list-group-item">暂无分组成员</p>
    </c:if>
</div>

</body>
</html>
