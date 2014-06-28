<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>微办公</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>管理员账户</h4>
        </div>
        <div class="col-xs-2">
            <a href="javascript:onAccountSave()" class="btn btn-primary navbar-btn pull-right" role="button">保存</a>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" style="margin-right: 15px">
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">公司名称</label>

        <div class="col-xs-8">
            <p class="form-control-static pull-right">${admin.companyName}</p>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">手机号码</label>

        <div class="col-xs-8">
            <input type="number" class="form-control" id="phoneNum"
                   value="${admin.phoneNum}"/>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">邮箱</label>

        <div class="col-xs-8">
            <input type="email" class="form-control" id="email"
                   value="${admin.email}"/>
        </div>
    </div>
    <a href="/account/password/change" class="form-group list-group-item" style="min-height: 49px">
        <p class="list-group-item-text" style="text-align: center; margin-top: 5px">修改密码 >></p>
    </a>
    <a href="/account/admin/postfix" class="form-group list-group-item" style="min-height: 49px">
        <p class="list-group-item-text" style="text-align: center; margin-top: 5px">申请员工账号后缀 >></p>
    </a>
</form>

<div class="container" style="margin-top: 10px">
    <a href="javascript:onAccountSave()" class="btn btn-primary btn-lg btn-block btn-block-bottom" role="button">
        保存</a>
</div>

<script>
    function onAccountSave() {
        var phoneNum = $("#phoneNum").val();
        var email = $("#email").val();

        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/account/admin/update")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {phoneNum: phoneNum,
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
