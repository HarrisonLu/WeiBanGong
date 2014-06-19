<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>微办公</title>
</head>
<body onload="document.form1.password.focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>修改密码</h4>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" style="margin-right: 15px">
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">账号</label>

        <div class="col-xs-8">
            <p class="form-control-static">${user.email}</p>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">新密码</label>

        <div class="col-xs-8">
            <input type="password" class="form-control" id="password" placeholder="请输入6位以上密码"/>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">确认密码</label>

        <div class="col-xs-8">
            <input type="password" class="form-control" id="confirmPassword" placeholder="请再次输入新密码"/>
        </div>
    </div>
</form>

<div class="container">
    <a href="javascript:onPasswordReset()" class="btn btn-primary btn-lg btn-block" role="button"
       style="margin-top: 5px; margin-bottom: 10px">
        保存</a>
</div>

<script>
    function onPasswordReset() {
        var newPwd = $("#password").val();
        var confirmPwd = $("#confirmPassword").val();

        if (newPwd != confirmPwd) {
            toastr.warning("两次输入密码不一致");
            return;
        }

        if (newPwd.length < 6) {
            toastr.warning("密码长度不够");
            return;
        }

        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/account/password/change")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {newPwd: newPwd},
            success: function () {
                toastr.success("修改成功");
                setTimeout("window.history.back()", 1000);
            }
        });
    }
</script>
</body>
</html>
