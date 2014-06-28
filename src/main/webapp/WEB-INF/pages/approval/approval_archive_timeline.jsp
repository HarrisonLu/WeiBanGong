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
            <c:if test="${archiveId == 1}">
                <h4>休假申请</h4>
            </c:if>
            <c:if test="${archiveId == 2}">
                <h4>出差申请</h4>
            </c:if>
            <c:if test="${archiveId == 3}">
                <h4>物品申请</h4>
            </c:if>
            <c:if test="${archiveId == 4}">
                <h4>经费申请</h4>
            </c:if>
            <c:if test="${archiveId == 5}">
                <h4>加班申请</h4>
            </c:if>
            <c:if test="${archiveId == 6}">
                <h4>其它申请</h4>
            </c:if>
        </div>
    </div>
</div>

<div class="list-group">
    <a href="#" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">2014年1月</h4>
    </a>
    <a href="#" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">2014年2月</h4>
    </a>
    <a href="#" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">2014年3月</h4>
    </a>
    <a href="#" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">2014年4月</h4>
    </a>
    <a href="#" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">2014年5月</h4>
    </a>
    <a href="#" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">2014年6月</h4>
    </a>
</div>

</body>
</html>
