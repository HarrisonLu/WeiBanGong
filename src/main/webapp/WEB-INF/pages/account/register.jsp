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
            <input type="number" class="form-control input-larger-text" id="phoneNum" placeholder="手机号码">
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
    <a href="javascript:onRegister()" class="btn btn-success btn-lg btn-block" role="button"
       style="margin-bottom: 5px">
        确认并提交</a>
</div>

<script>
    function onRegister() {
        var companyName = $("#companyName").val();
        var phoneNum = $("#phoneNum").val();
        var email = $("#email").val();
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();

        if (companyName == "" || email == "" || password == "") {
            toastr.warning("输入信息不完整");
            return;
        }
        if (phoneNum == "") {
            toastr.warning("请输入合法的手机号码");
            return;
        }
        if (password != confirmPassword) {
            toastr.warning("两次输入密码不一致");
            return;
        }
        if (password.length < 6) {
            toastr.warning("密码长度不够");
            return;
        }

        toastr.info("正在注册，请稍候");
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {companyName: companyName,
                phoneNum: phoneNum,
                email: email,
                password: password
            },
            success: function () {
                toastr.success("恭喜你，您已经成功注册微办公企业管理员账号，自动为您跳转回登陆页");
                setTimeout("window.location.href='/login'", 1500);
            },
            error: function () {
                toastr.error("注册失败，公司名称或邮箱已被注册");
            }
        });
    }
</script>

</body>
</html>
