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
            <c:if test="${month == 1}">
                <h4>2014年1月</h4>
            </c:if>
            <c:if test="${month == 2}">
                <h4>2014年2月</h4>
            </c:if>
            <c:if test="${month == 3}">
                <h4>2014年3月</h4>
            </c:if>
            <c:if test="${month == 4}">
                <h4>2014年4月</h4>
            </c:if>
            <c:if test="${month == 5}">
                <h4>2014年5月</h4>
            </c:if>
            <c:if test="${month == 6}">
                <h4>2014年6月</h4>
            </c:if>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${approvals}" var="approval">
        <a href="#" class="row list-group-item">
            <div class="col-xs-4 title-bar-col">
                <p>${approval.displaySubmitTime}</p>
            </div>
            <div class="col-xs-4 title-bar-col">
                <p>${approval.approvalTypeName}</p>
            </div>
        </a>
    </c:forEach>
</div>

</body>
</html>
