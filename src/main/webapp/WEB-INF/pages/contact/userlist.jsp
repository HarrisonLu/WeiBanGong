<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <ul class="list-group">
        <c:forEach items="${users}" var="user">
            <a href="#" class="list-group-item">
                <span class="badge">14</span>
                <h4 class="list-group-item-heading"><c:out value="${user.chineseName}"/></h4>
                <p class="list-group-item-text"><c:out value="${user.email}"/></p>
                <c:forEach items="${user.departments}" var="department">
                    <p class="list-group-item-text"><c:out value="${department.name}"/></p>
                </c:forEach>
            </a>
        </c:forEach>
    </ul>
</div>

</body>
</html>
