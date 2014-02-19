<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>通讯录</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/contacts.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-xs-2">
            <a href="/contacts" class="btn btn-primary navbar-btn pull-left" role="button">返回</a>
        </div>
        <div class="col-xs-8">
            <h4>名片详情</h4>
        </div>
        <div class="col-xs-2">
            <c:if test="${user.id==1}">
                <a href="/contacts/user/edit" class="btn btn-primary navbar-btn pull-right" role="button">编辑</a>
            </c:if>
            <c:if test="${user.id!=1}">
                <a href="/contacts" class="btn btn-primary navbar-btn pull-right" role="button">首页</a>
            </c:if>
        </div>
    </div>

    <div class="media well">
        <a class="pull-left" href="#"><img class="media-object" data-src="holder.js/60x60" alt=""></a>
        <div class="media-body">
            <p><c:out value="${user.englishName}"/> (<c:out value="${user.chineseName}"/>)</p>
            <p><c:out value="${user.status}"/></p>
            <c:forEach items="${user.groupList}" var="group">
                <p>部门：<c:out value="${group.departmentName}"/> - <c:out value="${group.name}"/></p>
            </c:forEach>
            <p>职位：<c:out value="${user.position}"/></p>
            <p>职级：<c:out value="${user.positionLevel}"/></p>
        </div>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">联系方式</h4>
        </div>
        <ul class="list-group">
            <li class="list-group-item">微信号：<c:out value="${user.wechatNum}"/></li>
            <li class="list-group-item">座机：<c:out value="${user.telephoneNum}"/></li>
            <li class="list-group-item">手机：<c:out value="${user.mobilePhoneNum}"/></li>
            <li class="list-group-item">QQ号：<c:out value="${user.qqNum}"/></li>
            <li class="list-group-item">邮箱：<c:out value="${user.email}"/></li>
        </ul>
    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">组织架构</h4>
        </div>
        <div class="list-group">
            <c:forEach items="${user.groupList}" var="group">
                <a href="/contacts/group/${group.id}" class="list-group-item">
                    <c:out value="${group.departmentName}"/> - <c:out value="${group.name}"/>
                </a>
            </c:forEach>
        </div>
    </div>

</div>
</body>
</html>
