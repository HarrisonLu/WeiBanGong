<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>审批流</title>
    <link rel="stylesheet" href="/static_resources/css/style.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>审批信息</h4>
        </div>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/ic_menu_approve.png" width="50" height="50">

    <div class="media-body">
        <h4 class="media-heading">${approval.approvalTypeName}
            <p class="pull-right">${approval.approvalStageName}</p>
        </h4>
        <p></p>

        <p>申请人：${approval.applicantName}</p>

        <p>申请人部门：
            <c:if test="${not empty user.departmentList}">
                ${user.departmentList[0].name}
            </c:if>
            <c:if test="${not empty user.groupList}">
                ${user.groupList[0].departmentName - user.groupList[0].name}
            </c:if>
        </p>

        <c:if test="${not empty approval.leaveTypeId}">
            <p>休假类型：${approval.leaveTypeName}</p>
        </c:if>
        <c:if test="${not empty approval.claimTypeId}">
            <p>报销类型：${approval.claimTypeName}</p>
        </c:if>
        <c:if test="${not empty approval.goodsTypeId}">
            <p>物品类型：${approval.goodsTypeName}</p>
        </c:if>
        <c:if test="${not empty approval.fundsTypeId}">
            <p>经费类型：${approval.fundsTypeName}</p>
        </c:if>

        <c:if test="${not empty approval.startTime}">
            <p>开始时间：${approval.displayStartTime}</p>
        </c:if>
        <c:if test="${not empty approval.endTime}">
            <p>结束时间：${approval.displayEndTime}</p>
        </c:if>
        <c:if test="${not empty approval.travelFrom}">
            <p>出发地：${approval.travelFrom}</p>
        </c:if>
        <c:if test="${not empty approval.travelTo}">
            <p>目的地：${approval.travelTo}</p>
        </c:if>

        <c:if test="${not empty approval.amount}">
            <p>总数：${approval.amount}</p>
        </c:if>

        <c:if test="${not empty approval.reasons}">
            <p>申请理由：${approval.reasons}</p>
        </c:if>
        <c:if test="${not empty approval.currentApprovalUserId}">
            <p>审批人：${approval.currentApprovalUserName}</p>
        </c:if>
    </div>
</div>

<div class="container">
    <ul class="content-reply-box mg10">
        <c:forEach items="${commentApprovals}" var="commentApproval">
            <li class="odd">
                <a class="user" href="#"><img class="img-responsive avatar_" src="/static_resources/images/head.png"
                                              alt=""><span
                        class="user-name">${commentApproval.userEnglishName}</span></a>

                <div class="reply-content-box">
                    <span class="reply-time">${commentApproval.displayCreateTime}</span>

                    <div class="reply-content pr">
                        <span class="arrow">&nbsp;</span>${commentApproval.details}
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
</body>
</html>
