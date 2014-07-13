<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>客户管理</title>
</head>
<body onload="document.getElementById('input_search').focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>选择项目</h4>
        </div>
    </div>
</div>

<div class="container">
    <div class="input-group" style="margin-top: 10px">
        <input id="input_search" type="text" class="form-control" placeholder="搜索">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" onclick="onSearch(SEARCH_PROJECT)">查找</button>
        </span>
    </div>
</div>

<div id="search_result" class="list-group" style="margin-top: 10px">
</div>

<div class="container">
    <button class="btn btn-primary btn-lg btn-block btn-block-bottom-no-top-margin" onclick="onSave(STORAGE_PROJECT)">
        确定
    </button>
</div>

</body>
</html>
