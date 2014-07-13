<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>客户管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-3 title-bar-col">
            <a href="/index"><img class="title-bar-image" src="/static_resources/images/bar_item_home.png"></a>
        </div>
        <div class="col-xs-3 title-bar-col">
            <a href="/customer/create"><img class="title-bar-image" src="/static_resources/images/bar_item_create.png"></a>
        </div>
        <div class="col-xs-3 title-bar-col">
            <a href="/customer/filter"><img class="title-bar-image" src="/static_resources/images/bar_item_filter.png"></a>
        </div>
        <div class="col-xs-3 title-bar-col">
            <a href="/customer/search"><img class="title-bar-image" src="/static_resources/images/bar_item_search.png"></a>
        </div>
    </div>
</div>

<div class="panel-group">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseOne">
                    我的客户
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <c:if test="${empty myCustomerList}">
                <div class="list-group-item" style="min-height: 100px">
                    <p style="text-align: center; color: #8E8E8E; margin-top: 30px">轻触上面加号按钮新建您的第一位客户吧</p>
                </div>
            </c:if>

            <c:forEach items="${myCustomerList}" var="customer">
                <a href="/customer/${customer.id}" class="list-group-item list-group-item-higher">
                    <c:if test="${customer.discussStageId == 1}">
                        <img class="pull-left" src="/static_resources/images/line_green.png">
                    </c:if>
                    <c:if test="${customer.discussStageId == 2}">
                        <img class="pull-left" src="/static_resources/images/line_yellow.png">
                    </c:if>
                    <c:if test="${customer.discussStageId == 3}">
                        <img class="pull-left" src="/static_resources/images/line_red.png">
                    </c:if>
                    <img class="pull-left" src="/static_resources/images/head.png" style="margin-left: 4px">
                    <h4 class="list-group-item-heading head-pic-text_">${customer.englishName}
                        (${customer.chineseName})</h4>

                    <p class="list-group-item-text head-pic-text_ info-detail">${customer.projectName}</p>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<div class="panel-group">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseTwo">
                    共享客户
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse in">
            <c:if test="${empty myCustomerList}">
                <div class="list-group-item" style="min-height: 100px">
                    <p style="text-align: center; color: #8E8E8E; margin-top: 30px">暂无共享客户</p>
                </div>
            </c:if>
            <c:forEach items="${sharedCustomerList}" var="customer">
                <a href="/customer/${customer.id}" class="list-group-item list-group-item-higher">
                    <c:if test="${customer.discussStageId == 1}">
                        <img class="pull-left" src="/static_resources/images/line_green.png">
                    </c:if>
                    <c:if test="${customer.discussStageId == 2}">
                        <img class="pull-left" src="/static_resources/images/line_yellow.png">
                    </c:if>
                    <c:if test="${customer.discussStageId == 3}">
                        <img class="pull-left" src="/static_resources/images/line_red.png">
                    </c:if>
                    <img class="pull-left" src="/static_resources/images/head.png" style="margin-left: 4px">
                    <h4 class="list-group-item-heading head-pic-text_">${customer.englishName}
                        (${customer.chineseName})</h4>

                    <p class="list-group-item-text head-pic-text_ info-detail">${customer.projectName}</p>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        if (localStorage[REFRESH_CUSTOMER] == 1) {
            localStorage[REFRESH_CUSTOMER] = 0;
            window.location.reload();
        }
    });
</script>
</body>
</html>
