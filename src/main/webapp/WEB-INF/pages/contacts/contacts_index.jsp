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
    <div class="input-group">
        <span class="input-group-btn">
            <a class="btn btn-default" href="/index" role="button">
                <span class="glyphicon glyphicon-chevron-left"></span>返回
            </a>
        </span>
        <input type="text" class="form-control" placeholder="输入中英文名搜索">
        <span class="input-group-btn">
            <a class="btn btn-default" href="#" role="button">
                <span class="glyphicon glyphicon-search"></span>搜索
            </a>
        </span>
    </div>

    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapseOne">
                        常用联系人
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <c:forEach items="${users}" var="user">
                    <a href="/contacts/user/${user.id}" class="list-group-item">
                        <h4 class="list-group-item-heading"><c:out value="${user.englishName}"/> (<c:out value="${user.chineseName}"/>)</h4>
                        <c:forEach items="${user.departments}" var="department">
                            <p class="list-group-item-text"><c:out value="${department.name}"/></p>
                        </c:forEach>
                    </a>
                </c:forEach>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapseTwo">
                        组织架构
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse in">
                <c:forEach items="${departments}" var="department">
                    <a href="/contacts/department/${department.id}" class="list-group-item">
                        <p class="list-group-item-text"><c:out value="${department.name}"/></p>
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

</body>
</html>
