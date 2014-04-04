<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>客户管理</title>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" type="text/css" href="/static_resources/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static_resources/css/customer.css"/>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-3">
            <a href="/index"><img src="/static_resources/images/btn_home.png"></a>
        </div>
        <div class="col-xs-3">
            <a href="/customer/create"><img src="/static_resources/images/btn_new.png"></a>
        </div>
        <div class="col-xs-3">
            <a href="/customer/filter"><img src="/static_resources/images/btn_filter.png"></a>
        </div>
        <div class="col-xs-3">
            <a href="/customer/search"><img src="/static_resources/images/btn_search.png"></a>
        </div>
    </div>
</div>

<div class="panel-group" id="accordion">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseOne">
                    我的客户
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <c:forEach items="${myCustomerList}" var="customer">
                <a href="/customer/${customer.id}" class="list-group-item" style="min-height: 64px">
                    <img class="pull-left" src="/static_resources/images/head.png" alt="">
                    <h4 class="list-group-item-heading head-pic-text"><c:out value="${customer.chineseName}"/></h4>
                    <p class="list-group-item-text head-pic-text"><c:out value="${customer.projectName}"/></p>
                </a>
            </c:forEach>
        </div>
    </div>
</div>
<div class="panel panel-success">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" href="#collapseTwo">
                共享客户
            </a>
        </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse in">
        <c:forEach items="${sharedCustomerList}" var="customer">
            <a href="/customer/${customer.id}" class="list-group-item" style="min-height: 64px">
                <img class="pull-left" src="/static_resources/images/head.png" alt="">
                <h4 class="list-group-item-heading head-pic-text"><c:out value="${customer.chineseName}"/></h4>
                <p class="list-group-item-text head-pic-text"><c:out value="${customer.projectName}"/></p>
            </a>
        </c:forEach>
    </div>
</div>
</div>
<script type="text/javascript" src="/static_resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
