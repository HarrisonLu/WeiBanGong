<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
</head>
<body onload="document.getElementById('task_name').focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:onBack()"><img class="title-bar-image" src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>我的任务</h4>
        </div>
    </div>
</div>

<div class="panel-body">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-xs-4 control-label">任务名称</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="task_name" value="${task.name}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">所属模块</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" value="${task.moduleName}" readonly>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">优先级</label>

            <div class="col-xs-8">
                <select class="form-control" id="task_priority">
                    <option class="form-control" value="1" ${task.priorityId == 1 ? 'selected' : ''}>高</option>
                    <option class="form-control" value="2" ${task.priorityId == 2 ? 'selected' : ''}>中</option>
                    <option class="form-control" value="3" ${task.priorityId == 3 ? 'selected' : ''}>低</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">所处阶段</label>

            <div class="col-xs-8">
                <select class="form-control" id="task_stage">
                    <option class="form-control" value="1" ${task.stageId == 1 ? 'selected' : ''}>未开始</option>
                    <option class="form-control" value="2" ${task.stageId == 2 ? 'selected' : ''}>进行中</option>
                    <option class="form-control" value="3" ${task.stageId == 3 ? 'selected' : ''}>已完成</option>
                    <option class="form-control" value="4" ${task.stageId == 4 ? 'selected' : ''}>已关闭</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">截止日期</label>

            <div class="col-xs-8">
                <input type="text" id="task_deadline" class="form-control form_datetime" value="${task.displayDeadline}"
                       readonly>
            </div>
        </div>

        <div class="well">
            <div class="form-group">
                <label class="col-xs-6 control-label">添加任务负责人</label>

                <div class="col-xs-6" style="text-align: left">
                    <a href="/project/task/create/manager"><img src="/static_resources/images/ic_input_add.png"/></a>
                </div>
            </div>

            <div class="list-group" id="manager">
                <c:forEach items="${managers}" var="manager">
                    <a href="/contacts/user/${manager.id}" class="list-group-item" style="min-height: 20px">
                            ${manager.englishName} (${manager.chineseName})
                    </a>
                </c:forEach>
            </div>
        </div>

        <div class="well">
            <div class="form-group">
                <label class="col-xs-6 control-label">添加任务成员</label>

                <div class="col-xs-6" style="text-align: left">
                    <a href="/project/task/create/member"><img src="/static_resources/images/ic_input_add.png"/></a>
                </div>
            </div>

            <div class="list-group" id="member">
                <c:forEach items="${members}" var="member">
                    <a href="/contacts/user/${member.id}" class="list-group-item" style="min-height: 20px">
                            ${member.englishName} (${member.chineseName})
                    </a>
                </c:forEach>
            </div>
        </div>

        <div class="well">
            <div class="form-group">
                <label class="col-xs-6 control-label">添加关联客户</label>

                <div class="col-xs-6" style="text-align: left">
                    <a href="/project/task/create/customer"><img
                            src="/static_resources/images/ic_input_add.png"/></a>
                </div>
            </div>

            <div class="list-group" id="customer">
                <c:forEach items="${customers}" var="customer">
                    <a href="/customer/${customer.id}" class="list-group-item" style="min-height: 20px">
                            ${customer.englishName} (${customer.chineseName})
                    </a>
                </c:forEach>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">创建时间</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" value="${task.displayCreateTime}" readonly>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">创建者</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" value="${task.createrEnglishName} (${task.createrChineseName})"
                       readonly>
            </div>
        </div>
    </form>
    <button class="btn btn-success btn-lg btn-block btn-block-bottom" onclick="onCreate(CREATE_TASK)">
        保存任务
    </button>

    <c:if test="${isTaskCreater}">
        <button class="btn btn-danger btn-lg btn-block btn-block-bottom" onclick="$('#deleteModal').modal('show')">删除任务
        </button>
    </c:if>
</div>

<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="text-align: center">
                <h4>确认删除任务吗？</h4>

                <p>任务将被永久删除</p>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-danger btn-block btn-block-bottom-no-top-margin"
                        onclick="onDeleteTask()">删除
                </button>
                <button type="button" class="btn btn-default btn-block btn-block-bottom" data-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    $('.form_datetime').datetimepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
        minView: 2,
        pickerPosition: "bottom-left"
    });

    $(document).ready(function () {
        onProjectCreateDocumentReady();
    });

    function showModal(id) {
        $('.modal').modal('show');
        $('.btn-primary').attr('onclick', onCreateSubTask());
    }

    function onCreateSubTask() {

    }

    function onDeleteTask() {
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/project/task/delete")),
            data: {taskId: ${task.id}},
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                toastr.success("删除成功");
                localStorage[REFRESH_TASK] = 1;
                window.history.back();
            }
        });
    }

</script>
</body>
</html>