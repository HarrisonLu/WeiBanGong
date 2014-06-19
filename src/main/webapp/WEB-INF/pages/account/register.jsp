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
            <h4>注册企业账号</h4>
        </div>
    </div>
</div>

<div class="well">
    <form class="form-horizontal">
        <div class="form-group list-group-item">
            <input type="text" class="form-control input-larger-text" id="companyName" placeholder="公司名称">
        </div>
        <div class="form-group list-group-item">
            <input type="number" class="form-control input-larger-text" id="mobilePhone" placeholder="手机号码">
        </div>
        <div class="form-group list-group-item">
            <input type="email" class="form-control input-larger-text" id="email" placeholder="邮箱，即管理员账号">
        </div>
        <div class="form-group list-group-item">
            <input type="password" class="form-control input-larger-text" id="password" placeholder="6位以上密码">
        </div>
        <div class="form-group list-group-item">
            <input type="password" class="form-control input-larger-text" id="confirmPassword" placeholder="再次输入密码">
        </div>
    </form>
</div>

<div class="container">
    <a href="javascript:onRegister()" class="btn btn-primary btn-lg btn-block" role="button"
       style="margin-top: 10px; margin-bottom: 5px">
        确认并提交</a>
</div>

<script>
    function onRegister() {
        var companyName = $("#companyName").val();
        var mobilePhone = $("#mobilePhone").val();
        var email = $("#email").val();
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();

        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {companyName: companyName,
                mobilePhone: mobilePhone,
                email: email,
                password: password,
                confirmPassword: confirmPassword
            },
            success: function (data) {
                if (!data) {
                    toastr.warning("注册失败");
                    return;
                }
                toastr.success("恭喜你，您已经成功注册微办公企业管理员账号，3秒钟后自动为您跳转回主页");
                setTimeout("window.location.href='/login'", 3000);
            }
        });
    }
</script>

</body>
</html>