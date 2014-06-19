<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>通讯录</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
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
        <p>${user.englishName} (${user.chineseName})</p>
        <p>${user.status}</p>
        <c:forEach items="${user.groupList}" var="group">
            <p>部门：${group.departmentName} - ${group.name}</p>
        </c:forEach>
        <p>职位：${user.position}</p>
        <p>职级：${user.positionLevel}</p>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">联系方式</h4>
    </div>
    <div class="panel-body">
        <form name="form1" class="form-horizontal" role="form" action="/contacts/user/update" method="post">
            <div class="form-group">
                <label class="col-xs-4 control-label">微信号</label>
                <div class="col-xs-8">
                    <p class="form-control-static pull-right">${user.wechatNum}</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">座机号码</label>
                <div class="col-xs-8">
                    <input type="number" class="form-control" name="telephoneNum" value=${user.telephoneNum}>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">手机号码</label>
                <div class="col-xs-8">
                    <input type="number" class="form-control" name="mobilePhoneNum" value=${user.mobilePhoneNum}>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">QQ号码</label>
                <div class="col-xs-8">
                    <input type="number" class="form-control" name="qqNum" value=${user.qqNum}>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">邮箱</label>
                <div class="col-xs-8">
                    <input type="email" class="form-control" name="email" value=${user.email}>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
