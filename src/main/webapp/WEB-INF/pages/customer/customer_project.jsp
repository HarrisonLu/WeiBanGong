<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <div class="col-xs-2">
            <a class="btn btn-success navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8">
            <h4>选择项目</h4>
        </div>
        <div class="col-xs-2">
            <a href="#" class="btn btn-success navbar-btn pull-right" role="button">保存</a>
        </div>
    </div>

    <input type="text" class="form-control" placeholder="搜索" style="margin-top: 8px">

</div>
<script type="text/javascript" src="/static_resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
