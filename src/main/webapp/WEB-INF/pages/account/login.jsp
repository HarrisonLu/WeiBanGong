<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>微办公</title>
</head>
<body onload="document.getElementById('email').focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2"></div>
        <div class="col-xs-8 title-bar-text">
            <h4>登陆账号</h4>
        </div>
        <div class="col-xs-2 pull-right" style="text-align: center; margin-top: 10px"><a
                href="javascript:onHelpToast()"><img src="/static_resources/images/btn_head.png" width="30" height="30"></a>
        </div>
    </div>
</div>

<div class="well">
    <form class="form-horizontal">
        <div class="form-group list-group-item">
            <input type="email" class="form-control input-larger-text" id="email" placeholder="邮箱">
        </div>
        <div class="form-group list-group-item">
            <input type="password" class="form-control input-larger-text" id="password" placeholder="密码">
        </div>
    </form>
</div>

<div class="container">
    <a href="javascript:onLogin()" class="btn btn-success btn-lg btn-block" role="button"
       style="margin-bottom: 5px">
        登陆</a>
    <a href="/register" class="btn btn-primary btn-lg btn-block" role="button"
       style="margin-top: 15px; margin-bottom: 5px">
        注册企业账号</a>
</div>

<script>
    function onLogin() {
        var email = $("#email").val();
        var password = $("#password").val();
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {email: email,
                password: password},
            success: function (data) {
                if (!data) {
                    toastr.error("登陆失败");
                    return;
                }
                toastr.success("登陆成功，正在跳转");
                window.location.href = "/index";
            }
        });
    }

    function onHelpToast() {
        toastr.options = {
            "positionClass": "toast-bottom-full-width",
            "timeOut": "5000"
        }
        toastr.info("企业账号是服务于企业管理人员的高级账号，成功注册后您可以：" +
                "为公司员工申请账号并管理这些账号；" +
                "设置与管理公司组织架构；" +
                "设置各位公司审批流程");
    }
</script>
</body>
</html>
