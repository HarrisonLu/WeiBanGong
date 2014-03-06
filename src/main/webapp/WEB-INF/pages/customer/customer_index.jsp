<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>客户管理</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/customer.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <div class="row title-bar">
        <div class="col-xs-3">
            <a class="btn btn-success navbar-btn" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-3">
            <a href="/customer/create" class="btn btn-success navbar-btn" role="button">新建</a>
        </div>
        <div class="col-xs-3">
            <a href="/customer/filter" class="btn btn-success navbar-btn" role="button">筛选</a>
        </div>
        <div class="col-xs-3">
            <a href="/customer/search" class="btn btn-success navbar-btn" role="button">搜索</a>
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
            <c:forEach items="${customers}" var="customer">
                <%--<div class="list-group-item">--%>
                <a href="/customer/${customer.id}" class="list-group-item">
                    <img class="pull-left" src="/static_resources/images/head.png" alt="">
                    <h4 class="list-group-item-heading head-pic-text"><c:out value="${customer.name}"/></h4>
                    <p class="list-group-item-text head-pic-text"><c:out value="${customer.project}"/></p>
                </a>
                <%--<a href="/customer/${customer.id}">--%>
                <%--<span class="glyphicon glyphicon-user pull-right" style="font-size:30px;"></span>--%>
                <%--</a>--%>
                <%--<p class="pull-right">&nbsp;&nbsp;&nbsp;</p>--%>
                <%--<a href="/customer/${customer.id}/comment">--%>
                <%--<span class="glyphicon glyphicon-comment pull-right" style="font-size:30px;"></span>--%>
                <%--</a>--%>
                <%--</div>--%>
            </c:forEach>

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
            <c:forEach items="${customers}" var="customer">
                <a href="/customer/${customer.id}" class="list-group-item">
                    <img class="pull-left" src="/static_resources/images/head.png" alt="">
                    <h4 class="list-group-item-heading head-pic-text"><c:out value="${customer.name}"/></h4>
                    <p class="list-group-item-text head-pic-text"><c:out value="${customer.project}"/></p>
                </a>
            </c:forEach>
        </div>
    </div>
</div>


</body>
</html>
