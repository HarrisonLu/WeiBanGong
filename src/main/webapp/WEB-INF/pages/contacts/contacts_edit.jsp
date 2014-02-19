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
            <h4>个人信息编辑</h4>
        </div>
        <div class="col-xs-2">
            <a href="/contacts" class="btn btn-primary navbar-btn pull-right" role="button">首页</a>
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
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-xs-1 control-label">微信号</label>
                <div class="col-sm-11">
                    <p class="form-control-static"><c:out value="${user.wechatNum}"/></p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-1 control-label">座机</label>
                <div class="col-sm-11">
                    <input type="text" class="form-control" id="input2" placeholder="<c:out value="${user.telephoneNum}"/>">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-1 control-label">手机</label>
                <div class="col-sm-11">
                    <input type="text" class="form-control" id="input3" placeholder="<c:out value="${user.mobilePhoneNum}"/>">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-1 control-label">QQ号</label>
                <div class="col-sm-11">
                    <input type="text" class="form-control" id="input4" placeholder="<c:out value="${user.qqNum}"/>">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-1 control-label">邮箱</label>
                <div class="col-sm-11">
                    <input type="text" class="form-control" id="input5" placeholder="<c:out value="${user.email}"/>">
                </div>
            </div>
        </form>
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
