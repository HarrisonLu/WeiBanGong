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
            <h4>${module.name}</h4>
        </div>
        <div class="col-xs-2 pull-right title-bar-btn">
            <a href="/project/${module.id}/task/create"><img class="title-bar-image"
                                                              src="/static_resources/images/bar_item_create.png"></a>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${tasks}" var="task">
        <a href="/project/task/detail/${task.id}" class="list-group-item" style="min-height: 64px">
            <h4 class="list-group-item-text">${task.name}</h4>
        </a>
    </c:forEach>
</div>

</body>
</html>