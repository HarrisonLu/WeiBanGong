<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
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
            <h4>组织架构管理</h4>
        </div>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/head.png">

    <div class="media-body">
        <h4 class="media-heading">${user.englishName} (${user.chineseName})</h4>

        <p></p>

        <c:forEach items="${user.departmentList}" var="department">
            <p>部门：${department.name}</p>
        </c:forEach>

        <c:forEach items="${user.groupList}" var="group">
            <p>部门：${group.departmentName} - ${group.name}</p>
        </c:forEach>

        <p>职位：${user.position}</p>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">联系方式</h4>
    </div>
    <ul class="list-group">
        <li class="list-group-item">微信号<p class="pull-right">${user.wechatNum}</p></li>
        <li class="list-group-item">座机号码<p class="pull-right">${user.telephoneNum}</p></li>
        <li class="list-group-item">手机号码<p class="pull-right">${user.mobilePhoneNum}</p></li>
        <li class="list-group-item">QQ号码<p class="pull-right">${user.qqNum}</p></li>
        <li class="list-group-item">邮箱<p class="pull-right">${user.email}</p></li>
    </ul>
</div>

</body>
</html>
