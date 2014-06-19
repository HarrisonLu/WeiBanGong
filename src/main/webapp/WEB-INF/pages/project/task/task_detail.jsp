<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>我的任务</h4>
        </div>
    </div>
</div>

<ul class="list-group">
    <li class="list-group-item">任务名称<p><c:out value="${task.name}"/></p></li>
    <li class="list-group-item">所属模块<p class="pull-right"><c:out value="${task.moduleName}"/></p></li>
    <li class="list-group-item">优先级<p class="pull-right"><c:out value="${task.priorityName}"/></p></li>
    <li class="list-group-item">所属阶段<p class="pull-right"><c:out value="${task.stageName}"/></p></li>
    <li class="list-group-item">截止日期<p class="pull-right"><c:out value="${task.deadline}"/></p></li>
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
