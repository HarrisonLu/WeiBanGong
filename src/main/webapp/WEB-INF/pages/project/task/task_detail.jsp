<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>我的任务</h4>
        </div>
    </div>
</div>

<ul class="list-group">
    <li class="list-group-item"><strong>任务名称</strong>

        <p></p>

        <p>${task.name}</p></li>

    <li class="list-group-item"><strong>所属模块</strong>

        <p class="pull-right">${task.moduleName}</p></li>
    <li class="list-group-item"><strong>优先级</strong>

        <p class="pull-right">${task.priorityName}</p></li>
    <li class="list-group-item"><strong>所属阶段</strong>

        <p class="pull-right">${task.stageName}</p></li>
    <li class="list-group-item"><strong>截止日期</strong>

        <p class="pull-right">${task.displayDeadline}</p></li>
</ul>

<div class="panel-group" id="accordion">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                拆分任务
            </h4>
        </div>
        <div class="panel-body">
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                任务成员
            </h4>
        </div>
        <div class="panel-body">
        </div>
    </div>
</div>

</body>
</html>
