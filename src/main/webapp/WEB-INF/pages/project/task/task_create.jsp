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
            <a href="javascript:onBack()"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>新建任务</h4>
        </div>
        <div class="col-xs-2">
            <button class="btn btn-primary navbar-btn pull-right" onclick="onCreate(CREATE_TASK, ${module.id})">保存
            </button>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" role="form" style="padding-right: 15px">
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">任务名称</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="task_name">
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">所属模块</label>

        <div class="col-xs-8">
            <p>${module.name}</p>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">优先级</label>

        <div class="col-xs-8">
            <select class="form-control" id="task_priority">
                <option class="form-control" value="1">高</option>
                <option class="form-control" value="2">中</option>
                <option class="form-control" value="3">低</option>
            </select>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">所处阶段</label>

        <div class="col-xs-8">
            <select class="form-control" id="task_stage">
                <option class="form-control" value="1">未开始</option>
                <option class="form-control" value="2">进行中</option>
                <option class="form-control" value="3">已完成</option>
                <option class="form-control" value="4">已关闭</option>
            </select>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">截止日期</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="task_deadline" placeholder="暂时留空">
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-6 control-label">添加拆分任务</label>

        <div class="col-xs-6" style="text-align: left">
            <a href="javascript:showModal()"><img src="/static_resources/images/ic_input_add.png"/></a>
        </div>
    </div>

    <div class="list-group" id="task">
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-6 control-label">添加任务成员</label>

        <div class="col-xs-6" style="text-align: left">
            <a href="/project/task/create/member"><img src="/static_resources/images/ic_input_add.png"/></a>
        </div>
    </div>

    <div class="list-group" id="member">
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-6 control-label">添加关联客户</label>

        <div class="col-xs-6" style="text-align: left">
            <a href="/project/task/create/customer"><img
                    src="/static_resources/images/ic_input_add.png"/></a>
        </div>
    </div>

    <div class="list-group" id="customer">
    </div>

</form>

<div class="container">
    <button class="btn btn-primary btn-lg btn-block" onclick="onCreate(CREATE_TASK, ${module.id})"
            style="margin-top: 5px; margin-bottom: 5px">保存任务
    </button>
</div>

<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="text-align: center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">新建拆分任务</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <input type="text" id="sub_task_name" placeholder="子任务名称">
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-primary" onclick="onCreateSubTask()">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        onProjectCreateDocumentReady();
    });

    function showModal(id) {
        $('.modal').modal('show');
        $('.btn-primary').attr('onclick', onCreateSubTask());
    }

    function onCreateSubTask() {
    }


</script>
</body>
</html>