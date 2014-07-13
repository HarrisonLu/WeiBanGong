<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>审批流</title>
</head>
<body onload="document.getElementById('input_search').focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript: history.go(-1)"><img class="title-bar-image"
                                                      src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <c:if test="${level == 1}">
                <h4>一级审批人</h4>
            </c:if>
            <c:if test="${level == 2}">
                <h4>二级审批人</h4>
            </c:if>
        </div>
    </div>
</div>

<div class="container">
    <div class="input-group" style="margin-top: 10px">
        <input id="input_search" type="text" class="form-control" placeholder="搜索">
        <span class="input-group-btn">
            <c:if test="${level == 1}">
                <button class="btn btn-default" type="button" onclick="onSearch(SEARCH_APPROVER_FIRST)">查找</button>
            </c:if>
            <c:if test="${level == 2}">
                <button class="btn btn-default" type="button" onclick="onSearch(SEARCH_APPROVER_SECOND)">查找</button>
            </c:if>
        </span>
    </div>
</div>

<div id="search_result" class="list-group" style="margin-top: 10px">
</div>

<div class="container">
    <c:if test="${level == 1}">
        <button class="btn btn-primary btn-lg btn-block btn-block-bottom-no-top-margin"
                onclick="onSave(STORAGE_APPROVER_FIRST)">
            确定
        </button>
    </c:if>
    <c:if test="${level == 2}">
        <button class="btn btn-primary btn-lg btn-block btn-block-bottom-no-top-margin"
                onclick="onSave(STORAGE_APPROVER_SECOND)">
            确定
        </button>
    </c:if>
</div>

</body>
</html>