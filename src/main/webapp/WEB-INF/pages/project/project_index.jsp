<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-3">
            <a href="/index"><img class="title-bar-image" src="/static_resources/images/bar_item_home.png"></a>
        </div>
        <div class="col-xs-3">
            <a href="/project/create"><img class="title-bar-image"
                                           src="/static_resources/images/bar_item_create.png"></a>
        </div>
        <div class="col-xs-3">
            <a href="/project/manager"><img class="title-bar-image" src="/static_resources/images/bar_item_manager.png"></a>
        </div>
        <div class="col-xs-3">
            <a href="/project/search"><img class="title-bar-image"
                                           src="/static_resources/images/bar_item_search.png"></a>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${projects}" var="project">
        <a href="/project/${project.id}" class="list-group-item" style="min-height: 64px">
            <h4 class="list-group-item-heading">${project.name}
                <img class="pull-right" src="/static_resources/images/btn_comment_2.png" width="25" height="25">
            </h4>

            <p></p>

            <p class="list-group-item-text info-detail pull-right">${project.displayUpdateTime}</p>

            <p class="list-group-item-text info-detail">${project.info}</p>
        </a>
    </c:forEach>
</div>

<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>