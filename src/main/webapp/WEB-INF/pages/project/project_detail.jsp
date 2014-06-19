<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>${project.name}</h4>
        </div>
    </div>
</div>

<ul class="list-group">
    <li class="list-group-item"><strong>项目名称</strong>

        <p class="pull-right">${project.name}</p></li>
    <li class="list-group-item"><strong>项目描述</strong>

        <p></p>

        <p>${project.info}</p></li>
    <li class="list-group-item"><strong>项目阶段</strong>

        <p class="pull-right">${project.stageName}</p></li>
</ul>

<c:if test="${not empty managers}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">项目负责人</h4>
        </div>
        <div class="list-group">
            <c:forEach items="${managers}" var="manager">
                <a href="/contacts/user/${manager.id}" class="list-group-item">
                        ${manager.englishName} (${manager.chineseName})
                </a>
            </c:forEach>
        </div>
    </div>
</c:if>

<c:if test="${not empty customers}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">项目关联客户</h4>
        </div>
        <div class="list-group">
            <c:forEach items="${customers}" var="customer">
                <a href="/customer/${customer.id}" class="list-group-item">
                        ${customer.englishName} (${customer.chineseName})
                </a>
            </c:forEach>
        </div>
    </div>
</c:if>

<c:if test="${not empty modules}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">子模块</h4>
        </div>
        <div class="list-group">
            <c:forEach items="${modules}" var="module">
                <a href="/project/module/${module.id}" class="list-group-item">
                        ${module.name}
                </a>
            </c:forEach>
        </div>
    </div>
</c:if>
<ul class="list-group">
    <li class="list-group-item"><strong>项目创建时间</strong>

        <p class="pull-right">${project.createTime}</p></li>
    <li class="list-group-item"><strong>项目创建者</strong>

        <p class="pull-right">${project.createrChineseName}</p></li>
</ul>

</body>
</html>
