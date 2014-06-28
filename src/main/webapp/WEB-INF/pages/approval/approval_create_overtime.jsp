<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>审批流</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>加班申请</h4>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" style="margin-right: 15px">
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">申请人</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="name">
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">所属部门</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="department">
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">开始时间</label>

        <div class="col-xs-8">
            <input type="text" id="startTime" class="form-control form_datetime" value="" readonly>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">结束时间</label>

        <div class="col-xs-8">
            <input type="text" id="endTime" class="form-control form_datetime" value="" readonly>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">加班时数</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="hours">
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">加班事由</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="reason" placeholder="请填写加班事由">
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">一级审批人</label>

        <div class="col-xs-8">
            <input type="text" class="form-control">
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">二级审批人</label>

        <div class="col-xs-8">
            <input type="text" class="form-control">
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">抄送</label>

        <div class="col-xs-8">
            <input type="text" class="form-control">
        </div>
    </div>
</form>

<div class="container">
    <button class="btn btn-success btn-lg btn-block" onclick="onCreateApply()"
            style="margin-top: 15px; margin-bottom: 5px">提交
    </button>

    <button class="btn btn-primary btn-lg btn-block" onclick="onSaveDraft()"
            style="margin-top: 10px; margin-bottom: 15px">保存草稿
    </button>
</div>

<script>
    $('.form_datetime').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        autoclose: true,
        todayBtn: true
    });

    function onCreateApply() {
        toastr.success("提交成功");
        setTimeout("window.history.back()", 1500);
    }

    function onSaveDraft() {
        toastr.success("保存草稿成功");
        setTimeout("window.history.back()", 1500);
    }
</script>
</body>
</html>
