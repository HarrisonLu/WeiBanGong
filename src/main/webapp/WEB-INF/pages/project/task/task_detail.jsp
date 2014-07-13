<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>我的任务</h4>
        </div>
    </div>
</div>

<ul class="list-group">
    <li class="list-group-item"><strong>任务名称</strong>

        <p></p>

        <p>${task.name}</p></li>

    <li class="list-group-item"><strong>所属模块</strong>

        <p class="pull-right">${task.moduleName}</p></li>
    <li class="list-group-item"><strong>优先级</strong>

        <p class="pull-right">${task.priorityName}</p></li>
    <li class="list-group-item"><strong>所属阶段</strong>

        <p class="pull-right">${task.stageName}</p></li>
    <li class="list-group-item"><strong>截止日期</strong>

        <p class="pull-right">${task.displayDeadline}</p></li>
    <li class="list-group-item"><strong>创建时间</strong>

        <p class="pull-right">${task.displayCreateTime}</p></li>
    <li class="list-group-item"><strong>创建者</strong>

        <p class="pull-right">${task.createrEnglishName} (${task.createrChineseName})</p></li>
</ul>

<c:if test="${not empty managers}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">任务负责人</h4>
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

<c:if test="${not empty members}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">任务成员</h4>
        </div>
        <div class="list-group">
            <c:forEach items="${members}" var="member">
                <a href="/contacts/user/${member.id}" class="list-group-item">
                        ${member.englishName} (${member.chineseName})
                </a>
            </c:forEach>
        </div>
    </div>
</c:if>

<c:if test="${not empty customers}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">任务关联客户</h4>
        </div>
        <div class="list-group">
            <c:forEach items="${customers}" var="customer">
                <a href="/contacts/user/${member.id}" class="list-group-item">
                        ${customer.englishName} (${customer.chineseName})
                </a>
            </c:forEach>
        </div>
    </div>
</c:if>

</body>
</html>
