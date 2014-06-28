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
            <button class="btn btn-primary navbar-btn pull-right" onclick="onCreate(CREATE_MODULE, ${projectId})">保存
            </button>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" role="form" style="padding-right: 15px">
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">模块名称</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="module_name" value="${module.name}">
        </div>
    </div>

    <div class="form-group list-group-item">
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

    <div class="form-group list-group-item">
        <label class="col-xs-6 control-label">添加模块成员</label>

        <div class="col-xs-6" style="text-align: left">
            <a href="/project/module/create/member"><img src="/static_resources/images/ic_input_add.png"/></a>
        </div>
    </div>

    <div class="list-group" id="member">
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-6 control-label">添加模块关联客户</label>

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

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">创建时间</label>

        <div class="col-xs-8">
            <p class="form-control-static pull-right">${module.createTime}</p>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">创建者</label>

        <div class="col-xs-8">
            <p class="form-control-static pull-right">${module.createrEnglishName} (${module.createrChineseName})</p>
        </div>
    </div>

</form>

<div class="container">
    <button class="btn btn-primary btn-lg btn-block btn-block-bottom" onclick="onCreate(CREATE_MODULE, ${projectId})">
        保存模块
    </button>
</div>

<script>
    $(document).ready(function () {
        onProjectCreateDocumentReady();
    });
</script>
</body>
</html>