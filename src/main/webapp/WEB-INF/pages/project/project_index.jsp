<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>项目管理</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/customer.css">
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


<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>