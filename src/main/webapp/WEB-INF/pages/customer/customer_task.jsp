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
        <div class="col-xs-2">
            <a class="btn btn-primary navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>选择任务</h4>
        </div>
        <div class="col-xs-2">
            <a href="#" class="btn btn-primary navbar-btn pull-right" role="button">保存</a>
        </div>
    </div>
</div>
</body>
</html>
