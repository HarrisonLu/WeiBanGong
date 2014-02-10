<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<jsp:include page="../template/header.jsp"/>

<c:forEach items="${users}" var="user">
    <c:out value="${user.email}"/><br>
    <c:out value="${user.chineseName}"/><br>
    <br>
</c:forEach>

</body>
</html>
