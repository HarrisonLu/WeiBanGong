<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>项目管理</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/wiwork.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-3">
            <a href="/index"><img src="/static_resources/images/btn_home.png"></a>
        </div>
        <div class="col-xs-3">
            <a href="/project/create"><img src="/static_resources/images/btn_new.png"></a>
        </div>
        <div class="col-xs-3">
            <a href="/project/manager"><img src="/static_resources/images/btn_filter.png"></a>
        </div>
        <div class="col-xs-3">
            <a href="/project/search"><img src="/static_resources/images/btn_search.png"></a>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${projects}" var="project">
        <a href="/project/comment/${project.id}" class="list-group-item" style="min-height: 64px">
            <h4 class="list-group-item-heading"><c:out value="${project.name}"/></h4>

            <p class="list-group-item-text pull-right"><c:out value="${project.displayUpdateTime}"/></p>

            <p class="list-group-item-text"><c:out value="${project.info}"/></p>
        </a>
    </c:forEach>
</div>

<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>