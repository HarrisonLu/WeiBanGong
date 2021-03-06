<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>权限管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>新建成员</h4>
        </div>
    </div>
</div>

<div class="panel-body">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-xs-4 control-label">中文名</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="chineseName" placeholder="请输入员工中文名字"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">英文名</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="englishName" placeholder="请输入员工英文名字"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">主管部门</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" value="${group.departmentName}" readonly/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">组</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" value="${group.name}" readonly/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">职位名称</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="position" placeholder="请输入员工职位名字"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">申请账号</label>

            <div class="col-xs-8">
                <div class="input-group">
                    <input type="text" class="form-control" id="email" placeholder="账号">
                    <span class="input-group-addon">@${postfix}.com</span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">初始密码</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" id="password" placeholder="请输入6位或以上初始密码"/>
            </div>
        </div>
    </form>
    <a href="javascript:onUserCreate()" class="btn btn-primary btn-lg btn-block btn-block-bottom" role="button">
        提交</a>
</div>

<script>
    function onUserCreate() {
        var chineseName = $("#chineseName").val();
        var englishName = $("#englishName").val();
        var position = $("#position").val();
        var email = $("#email").val() + "@${postfix}.com";
        var password = $("#password").val();

        if (chineseName == "" || englishName == "" || position == "" || email == "" || password == "") {
            toastr.warning("输入信息不完整");
            return;
        }
        if (password.length < 6) {
            toastr.warning("密码长度不够");
            return;
        }

        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {chineseName: chineseName,
                englishName: englishName,
                position: position,
                email: email,
                password: password},
            success: function () {
                toastr.success("创建成功");
                localStorage[REFRESH_USER] = 1;
                setTimeout("window.history.back()", 1000);
            }
        });
    }
</script>
</body>
</html>
