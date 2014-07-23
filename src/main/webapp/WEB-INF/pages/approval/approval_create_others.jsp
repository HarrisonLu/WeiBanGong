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
            <a href="javascript:onBack()"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>其它申请</h4>
        </div>
    </div>
</div>

<div class="panel-body">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-xs-4 control-label">申请人</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" value="${user.englishName} (${user.chineseName})"
                       readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">所属部门</label>

            <div class="col-xs-8">
                <input type="text" class="form-control"
                       value="<c:if test="${not empty user.departmentList}">${user.departmentList[0].name}</c:if>
                       <c:if test="${not empty user.groupList}">${user.groupList[0].departmentName} - ${user.groupList[0].name}</c:if>"
                       readonly>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">金额</label>

            <div class="col-xs-8">
                <input type="number" class="form-control" id="amount" placeholder="请填写申请的金额">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">申请事由</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="reason" placeholder="请填写申请事由">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label"><a href="/approval/create/approver/1"
                                                     style="text-decoration: underline">一级审批人</a></label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="firstApprover" readonly>
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label"><a href="/approval/create/approver/2"
                                                     style="text-decoration: underline">二级审批人</a></label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="secondApprover" readonly>
            </div>
        </div>
    </form>
    <button class="btn btn-success btn-lg btn-block" onclick="onCreateApply()"
            style="margin-top: 15px; margin-bottom: 5px">提交
    </button>
</div>

<script>
    $(document).ready(function () {
        onApprovalCreateInit();
    });
</script>
</body>
</html>
