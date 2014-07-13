<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <h4>新建项目</h4>
        </div>
    </div>
</div>

<div class="panel-body">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-xs-4 control-label">项目名称</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="project_name">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">项目描述</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="project_info">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">项目阶段</label>

            <div class="col-xs-8">
                <select class="form-control" id="project_stage">
                    <option class="form-control" value="1">未开始</option>
                    <option class="form-control" value="2">进行中</option>
                    <option class="form-control" value="3">已完成</option>
                    <option class="form-control" value="4">已关闭</option>
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
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">创建时间</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd"
                                                                          value="${current}"/>" readonly>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">创建者</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" value="${user.englishName} (${user.chineseName})" readonly>
            </div>
        </div>
    </form>
    <button class="btn btn-success btn-lg btn-block btn-block-bottom" onclick="onCreate(CREATE_PROJECT)">保存项目
    </button>
</div>


<script>
    $(document).ready(function () {
        onProjectCreateDocumentReady();
    });
</script>
</body>
</html>
