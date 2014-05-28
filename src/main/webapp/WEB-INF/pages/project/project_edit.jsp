<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>项目管理</title>
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
            <h4>微办公项目</h4>
        </div>
        <div class="col-xs-2">
            <button type="submit" class="btn btn-primary navbar-btn pull-right" onclick="document.form1.submit()">保存
            </button>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" role="form" action="/project/edit/${project.id}" method="post" style="padding-right: 15px">
    <div class="form-group row list-group-item">
        <label class="col-xs-4 control-label">项目名称</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" name="name" value="${project.name}">
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">项目描述</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" name="info" value="${project.info}">
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">项目阶段</label>

        <div class="col-xs-8">
            <select class="form-control" name="stageId">
                <option class="form-control" value="1">未开始</option>
                <option class="form-control" value="2">进行中</option>
                <option class="form-control" value="3">已完成</option>
                <option class="form-control" value="4">已关闭</option>
            </select>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-5 control-label">添加项目负责人</label>

        <div class="col-xs-7" style="text-align: left">
            <a href="/project/create/manager"><img src="/static_resources/images/ic_input_add.png"/></a>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-5 control-label">添加项目成员</label>

        <div class="col-xs-7" style="text-align: left">
            <a href="/project/create/member"><img src="/static_resources/images/ic_input_add.png"/></a>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-5 control-label">添加项目关联客户</label>

        <div class="col-xs-7" style="text-align: left">
            <a href="/project/create/customer"><img src="/static_resources/images/ic_input_add.png"/></a>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">项目创建时间</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" name="createTime" placeholder="yyyy-mm-dd"
                   value="${project.createTime}">
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">项目创建者</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" name="createrChineseName" value="${project.createrChineseName}">
        </div>
    </div>
</form>

<div class="container">
    <button type="submit" class="btn btn-primary btn-lg btn-block" onclick="document.form1.submit()"
            style="margin-top: 5px; margin-bottom: 5px">保存项目
    </button>
</div>

<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
