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
            <p class="form-control-static">航空公司</p>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">手机号码</label>

        <div class="col-xs-8">
            <p class="form-control-static">143353453443</p>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">邮箱</label>

        <div class="col-xs-8">
            <p class="form-control-static">jim@163.com</p>
        </div>
    </div>
</form>

<div class="list-group">
    <a href="/account/password" class="list-group-item" style="min-height: 49px">
        <p class="list-group-item-text" style="text-align: center; margin-top: 5px">修改密码 >></p>
    </a>
    <a href="/account/admin/suffix" class="list-group-item" style="min-height: 49px">
        <p class="list-group-item-text" style="text-align: center; margin-top: 5px">申请员工账号后缀 >></p>
    </a>
</div>

<div class="container">
    <a href="javascript:onAccountSave()" class="btn btn-primary btn-lg btn-block" role="button"
       style="margin-bottom: 10px">
        保存</a>
</div>

<script>
    function onAccountSave() {
        toastr.success("保存成功");
        setTimeout("window.location.href='/index'", 1000);
    }
</script>
</body>
</html>
