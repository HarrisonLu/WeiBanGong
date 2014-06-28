<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>权限管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>审批流管理</h4>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-4 title-bar-text">
            <a href="#"><img class="title-bar-image" src="/static_resources/images/bar_item_create.png"></a>
        </div>
        <div class="col-xs-4 title-bar-text">
            <a href="#"><img class="title-bar-image" src="/static_resources/images/bar_item_create.png"></a>
        </div>
        <div class="col-xs-4 title-bar-text">
            <a href="#"><img class="title-bar-image" src="/static_resources/images/bar_item_search.png"></a>
        </div>
    </div>
</div>

</body>
</html>
