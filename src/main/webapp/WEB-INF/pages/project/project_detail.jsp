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
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>微办公项目</h4>
        </div>
        <div class="col-xs-2">
            <div class="btn-group navbar-btn pull-right">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">选项<b
                        class="caret" style="margin-left: 5px;"></b>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="/project/${project.id}">模块列表</a></li>
                    <li class="divider"></li>
                    <li><a href="/project/comment/${project.id}">动态</a></li>
                </ul>
            </div>
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

    <li class="list-group-item"><strong>创建时间</strong>

        <p class="pull-right">${project.displayCreateTime}</p></li>
    <li class="list-group-item"><strong>创建者</strong>

        <p class="pull-right">${project.createrEnglishName} (${project.createrChineseName})</p></li>
</ul>

<c:if test="${not empty modules}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">子模块</h4>
        </div>
        <div class="list-group">
            <c:forEach items="${modules}" var="module">
                <a href="/project/${project.id}/module/edit/${module.id}" class="list-group-item">
                        ${module.name}
                </a>
            </c:forEach>
        </div>
    </div>
</c:if>

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

<c:if test="${not empty members}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">项目成员</h4>
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

<script>
    $(document).ready(function () {
        if (localStorage[REFRESH_MODULE] == 1) {
            localStorage[REFRESH_MODULE] = 0;
            window.location.reload();
        }
    });
</script>
</body>
</html>
