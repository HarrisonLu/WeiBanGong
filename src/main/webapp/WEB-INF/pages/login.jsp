<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
<div title="协同办公平台"   >
    <input type="hidden"  id="islonin" value="false" />
    <div class="formGroupHead">
        用户名</div>
    <input type='text' id="txtusername" class='af-ui-forms' placeholder="Enter your user" style="background-color:Black">
    <div class="formGroupHead">
        密码</div>
    <input type='password' id="txtpassword" class='af-ui-forms' placeholder="Enter your pwd" style="background-color:Black"><br />
    <div>
        <label>
            记住密码</label><input id="forgetPwd" type="checkbox" name="forgetPwd" value="1" class="toggle"><label
            for="forgetPwd" data-on="On" data-off="Off"><span></span></label><br />
        <label>
            自动登录</label><input id="outologin" type="checkbox" name="outologin" value="0" class="toggle"><label
            for="outologin" data-on="On" data-off="Off"><span></span></label>
    </div>
    <br />
    <a class="button block" id="btnLogin">登录</a>
</div>
<script type="text/javascript">
    var serviceUrl = "http://localhost:57843/Eas.WebsiteUpdate/";
    $("#btnLogin").bind("click", loginFun);
    function loginFun() {
        var para = {
            j_username: $("#txtusername").val(),
            j_password: $("#txtpassword").val()
        };
        var url = serviceUrl + "UIPhoneAjax/MobLogin.ashx";
        $.ui.showMask("登录中……");
        $.post(url, para, function (res) {
            if (res.IsSuccess) {
                $.ui.hideMask();
                $("#loginlink").hide();
                $("#logoutlink").show();
                $("a").remove("#loginlink");
                $.ui.hideModal();
                $("#islonin").val(true);
                $("#home").show();
                //   alert( $("#islonin").val());
            } else {
                $.ui.hideMask();
                $("#afui").popup(res.Msg);
            }
        }, "json", function () { $.ui.hideMask(); $("#afui").popup("网络连接失败！"); })
    }
</script>
</body>
</html>
