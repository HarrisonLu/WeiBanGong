<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp"/>
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
            <h4>微办公项目</h4>
        </div>
        <div class="col-xs-2">
            <button class="btn btn-primary navbar-btn pull-right" onclick="onCreate(CREATE_PROJECT)">保存
            </button>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" style="padding-right: 15px">
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">项目名称</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="project_name" value="${project.name}">
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">项目描述</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="project_info" value="${project.info}">
        </div>
    </div>
    <div class="form-group list-group-item">
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

    <div class="form-group list-group-item">
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


    <div class="form-group list-group-item">
        <label class="col-xs-6 control-label">添加项目成员</label>

        <div class="col-xs-6" style="text-align: left">
            <a href="/project/create/member"><img src="/static_resources/images/ic_input_add.png"/></a>
        </div>
    </div>

    <div class="list-group" id="member">
    </div>


    <div class="form-group list-group-item">
        <label class="col-xs-6 control-label">添加项目关联客户</label>

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

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">项目创建时间</label>

        <div class="col-xs-8">
            <p class="form-control">${project.createTime}</p>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">项目创建者</label>

        <div class="col-xs-8">
            <p class="form-control">${project.createrChineseName}</p>
        </div>
    </div>
</form>

<div class="container">
    <button class="btn btn-primary btn-lg btn-block" onclick="onCreate(CREATE_PROJECT)"
            style="margin-top: 5px; margin-bottom: 5px">保存项目
    </button>
</div>

<script>
    $(document).ready(function () {
        onProjectCreateDocumentReady();
    });
</script>
</body>
</html>
