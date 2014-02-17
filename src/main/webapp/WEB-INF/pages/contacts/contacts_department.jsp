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

    <c:forEach items="${department.users}" var="user">
        <a href="/contacts/user/${user.id}" class="list-group-item">
            <h4 class="list-group-item-heading"><c:out value="${user.englishName}"/> (<c:out
                    value="${user.chineseName}"/>)</h4>

            <p class="list-group-item-text"><c:out value="${department.name}"/></p>
        </a>
    </c:forEach>

</div>

</body>
</html>
