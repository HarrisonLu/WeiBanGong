<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户管理</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/customer.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <div class="row title-bar">
        <div class="col-xs-2">
            <a class="btn btn-success navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8">
            <h4>筛选客户</h4>
        </div>
    </div>
</div>

<div class="panel panel-success">
    <div class="panel-heading">
        <h4 class="panel-title">所处阶段</h4>
    </div>
    <div class="list-group">
        <a href="/customer/filter/1" class="list-group-item">
            <h4 class="list-group-item-heading">未洽谈</h4>
        </a>
        <a href="/customer/filter/2" class="list-group-item">
            <h4 class="list-group-item-heading">洽谈中</h4>
        </a>
        <a href="/customer/filter/3" class="list-group-item">
            <h4 class="list-group-item-heading">合作期</h4>
        </a>
        <a href="/customer/filter/4" class="list-group-item">
            <h4 class="list-group-item-heading">其他</h4>
        </a>
    </div>
</div>


</body>
</html>
