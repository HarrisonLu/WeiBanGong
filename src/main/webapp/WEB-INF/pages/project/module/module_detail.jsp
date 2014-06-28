<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <a href="javascript: history.go(-1)"><img class="title-bar-image"
                                                      src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>${module.name}</h4>
        </div>
        <div class="col-xs-2">
            <a href="/project/module/${module.id}" class="btn btn-primary navbar-btn pull-right" role="button">任务列表</a>
        </div>
    </div>
</div>

<div class="well">
    <ul class="list-group">
        <li class="list-group-item"><strong>模块名称</strong>

            <p class="pull-right">${module.name}</p></li>

        <li class="list-group-item"><strong>创建时间</strong>

            <p class="pull-right">${module.displayCreateTime}</p></li>
        <li class="list-group-item"><strong>创建者</strong>

            <p class="pull-right">${module.createrEnglishName} (${module.createrChineseName})</p></li>
    </ul>
</div>

<c:if test="${not empty tasks}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">子任务</h4>
        </div>
        <div class="list-group">
            <c:forEach items="${tasks}" var="task">
                <a href="/project/task/detail/${task.id}" class="list-group-item">
                        ${task.name}
                </a>
            </c:forEach>
        </div>
    </div>
</c:if>

<c:if test="${not empty managers}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">模块负责人</h4>
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
            <h4 class="panel-title">模块关联客户</h4>
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

</body>
</html>
