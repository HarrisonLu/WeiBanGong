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
    <div class="row-fluid title-bar">
        <div class="col-xs-4 title-bar-col">
            <a href="/index"><img class="title-bar-image" src="/static_resources/images/bar_item_home.png"></a>
        </div>
        <div class="col-xs-4 title-bar-col">
            <a href="/project/create"><img class="title-bar-image"
                                           src="/static_resources/images/bar_item_create.png"></a>
        </div>
        <div class="col-xs-4 title-bar-col">
            <a href="/project/search"><img class="title-bar-image"
                                           src="/static_resources/images/bar_item_search.png"></a>
        </div>
    </div>
</div>

<div class="list-group">
    <c:if test="${empty projects}">
        <div class="list-group-item" style="min-height: 100px">
            <p style="text-align: center; color: #8E8E8E; margin-top: 30px">轻触上面加号按钮新建您的第一个项目吧，别忘了联系管理员开通权限哦~</p>
        </div>
    </c:if>

    <c:forEach items="${projects}" var="project">
        <a href="/project/edit/${project.id}" class="list-group-item list-group-item-higher">
            <h4 class="list-group-item-heading">${project.name}
                <img class="pull-right" src="/static_resources/images/btn_comment_2.png" width="25" height="25">
            </h4>

            <p></p>

            <p class="list-group-item-text info-detail pull-right">${project.displayUpdateTime}</p>

            <p class="list-group-item-text info-detail">${project.info}</p>
        </a>
    </c:forEach>
</div>

<script>
    $(document).ready(function () {
        if (localStorage[REFRESH_PROJECT] == 1) {
            localStorage[REFRESH_PROJECT] = 0;
            window.location.reload();
        }
    });
</script>
</body>
</html>