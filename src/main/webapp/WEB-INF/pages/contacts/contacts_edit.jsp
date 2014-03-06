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
            <a class="btn btn-primary navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8">
            <h4>编辑信息</h4>
        </div>
        <div class="col-xs-2">
            <button type="submit" class="btn btn-primary navbar-btn pull-right" onclick="document.form1.submit()">保存</button>
        </div>
    </div>
</div>

<div class="media well">
    <a class="pull-left" href="#"><img class="pull-left" src="/static_resources/images/head.png"></a>
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
    <div class="panel-body">
        <form name="form1" class="form-horizontal" role="form" action="/contacts/user/save" method="post">
            <div class="form-group">
                <label class="col-xs-4 control-label">微信号</label>
                <div class="col-xs-8">
                    <p class="form-control-static pull-right"><c:out value="${user.wechatNum}"/></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">座机号码</label>
                <div class="col-xs-8">
                    <input type="text" class="form-control" name="telephoneNum" value="<c:out value="${user.telephoneNum}"/>">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">手机号码</label>
                <div class="col-xs-8">
                    <input type="text" class="form-control" name="mobilePhoneNum" value="<c:out value="${user.mobilePhoneNum}"/>">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">QQ号码</label>
                <div class="col-xs-8">
                    <input type="text" class="form-control" name="qqNum" value="<c:out value="${user.qqNum}"/>">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">邮箱</label>
                <div class="col-xs-8">
                    <input type="text" class="form-control" name="email" value="<c:out value="${user.email}"/>">
                </div>
            </div>
        </form>
    </div>
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

</body>
</html>
