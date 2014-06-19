<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>微办公</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>我的账户</h4>
        </div>
        <div class="col-xs-2">
            <a href="javascript:onAccountSave()" class="btn btn-primary navbar-btn pull-right" role="button">保存</a>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" style="margin-right: 15px">
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">中文名</label>

        <div class="col-xs-8">
            <p class="form-control-static">${user.chineseName}</p>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">英文名</label>

        <div class="col-xs-8">
            <p class="form-control-static">${user.englishName}</p>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">归属部门</label>

        <div class="col-xs-8">
            <p class="form-control-static"><c:forEach items="${user.departmentList}" var="department">
                ${department.name}
            </c:forEach></p>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">职位名称</label>

        <div class="col-xs-8">
            <p class="form-control-static">${user.position}</p>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">账号</label>

        <div class="col-xs-8">
            <p class="form-control-static">${user.email}</p>
        </div>
    </div>
</form>

<div class="list-group">
    <a href="/account/password" class="list-group-item" style="min-height: 49px">
        <p class="list-group-item-text" style="text-align: center; margin-top: 5px">修改密码 >></p>
    </a>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">联系方式</h4>
    </div>
    <div class="panel-body">
        <form name="form2" class="form-horizontal">
            <div class="form-group">
                <label class="col-xs-4 control-label">微信号</label>

                <div class="col-xs-8">
                    <input type="text" class="form-control" id="weChatNum" placeholder="请输入您的微信号"
                           value="${user.wechatNum}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">座机</label>

                <div class="col-xs-8">
                    <input type="number" class="form-control" id="telephoneNum" placeholder="请输入您的座机号码"
                           value="${user.telephoneNum}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">手机</label>

                <div class="col-xs-8">
                    <input type="number" class="form-control" id="mobilePhoneNum" placeholder="请输入您的手机号码"
                           value="${user.mobilePhoneNum}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">QQ号</label>

                <div class="col-xs-8">
                    <input type="number" class="form-control" id="qqNum" placeholder="请输入您的QQ号码"
                           value="${user.qqNum}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">邮箱</label>

                <div class="col-xs-8">
                    <input type="email" class="form-control" id="email" placeholder="请输入您的邮箱" value="${user.email}"/>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="container">
    <a href="javascript:onAccountSave()" class="btn btn-primary btn-lg btn-block" role="button"
       style="margin-bottom: 10px">
        保存</a>
</div>

<script>
    function onAccountSave() {
        var weChatNum = $("#weChatNum").val();
        var telephoneNum = $("#telephoneNum").val();
        var mobilePhoneNum = $("#mobilePhoneNum").val();
        var qqNum = $("#qqNum").val();
        var email = $("#email").val();

        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/account/update")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {weChatNum: weChatNum,
                telephoneNum: telephoneNum,
                mobilePhoneNum: mobilePhoneNum,
                qqNum: qqNum,
                email: email},
            success: function () {
                toastr.success("保存成功");
                setTimeout("window.history.back()", 1000);
            }
        });
    }
</script>
</body>
</html>
