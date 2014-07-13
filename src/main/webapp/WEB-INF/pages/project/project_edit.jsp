<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
</head>
<body onload="document.getElementById('project_name').focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:onBack()"><img class="title-bar-image" src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>微办公项目</h4>
        </div>
        <div class="col-xs-2">
            <div class="btn-group navbar-btn pull-right">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">选项<b
                        class="caret" style="margin-left: 5px;"></b>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="/project/${project.id}">模块列表</a></li>
                    <li class="divider"></li>
                    <li><a href="/project/comment/${project.id}">动态</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="panel-body">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-xs-4 control-label">项目名称</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="project_name" value="${project.name}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">项目描述</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="project_info" value="${project.info}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">项目阶段</label>

            <div class="col-xs-8">
                <select class="form-control" id="project_stage">
                    <option class="form-control" value="1" ${project.stageId == 1 ? 'selected' : ''}>未开始</option>
                    <option class="form-control" value="2" ${project.stageId == 2 ? 'selected' : ''}>进行中</option>
                    <option class="form-control" value="3" ${project.stageId == 3 ? 'selected' : ''}>已完成</option>
                    <option class="form-control" value="4" ${project.stageId == 4 ? 'selected' : ''}>已关闭</option>
                </select>
            </div>
        </div>

        <div class="well">
            <div class="form-group">
                <label class="col-xs-6 control-label">添加项目负责人</label>

                <div class="col-xs-6" style="text-align: left">
                    <a href="/project/create/manager"><img src="/static_resources/images/ic_input_add.png"/></a>
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
                <label class="col-xs-6 control-label">添加项目成员</label>

                <div class="col-xs-6" style="text-align: left">
                    <a href="/project/create/member"><img src="/static_resources/images/ic_input_add.png"/></a>
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
                    <a href="/project/create/customer"><img src="/static_resources/images/ic_input_add.png"/></a>
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
                <input type="text" class="form-control" value="${project.displayCreateTime}" readonly>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">创建者</label>

            <div class="col-xs-8">
                <input type="text" class="form-control"
                       value="${project.createrEnglishName} (${project.createrChineseName})" readonly>
            </div>
        </div>
    </form>
    <button class="btn btn-success btn-lg btn-block btn-block-bottom" onclick="onCreate(CREATE_PROJECT)">保存项目
    </button>
    <c:if test="${isProjectCreater}">
        <button class="btn btn-danger btn-lg btn-block btn-block-bottom" onclick="$('#deleteModal').modal('show')">删除项目
        </button>
    </c:if>
</div>

<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="text-align: center">
                <h4>确认删除项目吗？</h4>

                <p>项目以及其包含的模块任务都将被永久删除</p>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-danger btn-block btn-block-bottom-no-top-margin"
                        onclick="onDeleteProject()">删除
                </button>
                <button type="button" class="btn btn-default btn-block btn-block-bottom" data-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        onProjectCreateDocumentReady();
    });

    function onDeleteProject() {
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/project/delete")),
            data: {projectId: ${project.id}},
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                toastr.success("删除成功");
                localStorage[REFRESH_PROJECT] = 1;
                window.history.back();
            }
        });
    }
</script>
</body>
</html>
