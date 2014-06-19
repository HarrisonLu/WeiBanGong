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
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>${project.name}</h4>
        </div>
        <div class="col-xs-2">
            <div class="btn-group navbar-btn pull-right">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">选项<b
                        class="caret" style="margin-left: 5px;"></b>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="/project/${project.id}/module/create">新建模块</a></li>
                    <li class="divider"></li>
                    <li><a href="/project/comment/${project.id}">动态</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${modules}" var="module">
        <a href="/project/module/${module.id}" class="list-group-item" style="min-height: 64px">
            <h4 class="list-group-item-text">${module.name}</h4>
        </a>
    </c:forEach>
</div>

</body>
</html>