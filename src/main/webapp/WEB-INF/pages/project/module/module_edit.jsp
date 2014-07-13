<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
</head>
<body onload="document.getElementById('module_name').focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:onBack()"><img class="title-bar-image" src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>${module.name}</h4>
        </div>
        <div class="col-xs-2">
            <a href="/project/module/${module.id}" class="btn btn-primary navbar-btn pull-right" role="button">任务列表</a>
        </div>
    </div>
</div>

<div class="panel-body">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-xs-4 control-label">模块名称</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="module_name" value="${module.name}">
            </div>
        </div>

        <div class="well">
            <div class="form-group">
                <label class="col-xs-6 control-label">添加模块负责人</label>

                <div class="col-xs-6" style="text-align: left">
                    <a href="/project/module/create/manager"><img src="/static_resources/images/ic_input_add.png"/></a>
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
                <label class="col-xs-6 control-label">添加模块成员</label>

                <div class="col-xs-6" style="text-align: left">
                    <a href="/project/module/create/member"><img src="/static_resources/images/ic_input_add.png"/></a>
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
                    <a href="/project/module/create/customer"><img
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
                <input type="text" class="form-control" value="${module.displayCreateTime}" readonly>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">创建者</label>

            <div class="col-xs-8">
                <input type="text" class="form-control"
                       value="${module.createrEnglishName} (${module.createrChineseName})" readonly>
            </div>
        </div>
    </form>
    <button class="btn btn-success btn-lg btn-block btn-block-bottom" onclick="onCreate(CREATE_MODULE)">
        保存模块
    </button>
    <c:if test="${isModuleCreater}">
        <button class="btn btn-danger btn-lg btn-block btn-block-bottom" onclick="$('#deleteModal').modal('show')">删除模块
        </button>
    </c:if>
</div>

<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="text-align: center">
                <h4>确认删除模块吗？</h4>

                <p>模块以及其包含的任务都将被永久删除</p>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-danger btn-block btn-block-bottom-no-top-margin"
                        onclick="onDeleteModule()">删除
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

    function onDeleteModule() {
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/project/module/delete")),
            data: {moduleId: ${module.id}},
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                toastr.success("删除成功");
                localStorage[REFRESH_MODULE] = 1;
                window.history.back();
            }
        });
    }
</script>
</body>
</html>