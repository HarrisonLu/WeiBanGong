<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>客户管理</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/wiwork.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>筛选客户</h4>
        </div>
    </div>
</div>

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
<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
