<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>通讯录</title>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" type="text/css" href="/static_resources/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static_resources/css/contacts.css"/>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png"></a>
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
                    <input type="number" class="form-control" name="telephoneNum" value="<c:out value="${user.telephoneNum}"/>" style="text-align: right">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">手机号码</label>
                <div class="col-xs-8">
                    <input type="number" class="form-control" name="mobilePhoneNum" value="<c:out value="${user.mobilePhoneNum}"/>" style="text-align: right">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">QQ号码</label>
                <div class="col-xs-8">
                    <input type="number" class="form-control" name="qqNum" value="<c:out value="${user.qqNum}"/>" style="text-align: right">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">邮箱</label>
                <div class="col-xs-8">
                    <input type="email" class="form-control" name="email" value="<c:out value="${user.email}"/>" style="text-align: right">
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="/static_resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
