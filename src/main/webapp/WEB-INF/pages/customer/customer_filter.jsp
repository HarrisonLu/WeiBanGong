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
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>筛选客户</h4>
        </div>
    </div>
</div>

<div class="panel-group">
    <div class="panel panel-primary">
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
</div>

</body>
</html>
