<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<form class="form-horizontal" style="margin-right: 15px">
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">中文名</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="chineseName" placeholder="请输入员工中文名字"/>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">英文名</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="englishName" placeholder="请输入员工英文名字"/>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">主管部门</label>

        <div class="col-xs-8">
            <select class="form-control" id="department">
                <option class="form-control" value="1">未洽谈</option>
                <option class="form-control" value="2">洽谈中</option>
                <option class="form-control" value="3">合作期</option>
                <option class="form-control" value="4">其他</option>
            </select>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">职位名称</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="position" placeholder="请输入员工职位名字"/>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">申请账号</label>

        <div class="col-xs-8">
            <input type="text" class="form-control" id="email" placeholder="请输入员工账号"/>
        </div>
    </div>
</form>

<div class="container">
    <a href="javascript:onUserCreate()" class="btn btn-primary btn-lg btn-block btn-block-bottom" role="button">
        提交</a>
</div>

<script>
    function onUserCreate() {
        var chineseName = $("#chineseName").val();
        var englishName = $("#englishName").val();
        var position = $("#position").val();
        var email = $("#email").val();

        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {chineseName: chineseName,
                englishName: englishName,
                position: position,
                email: email},
            success: function () {
                toastr.success("创建成功");
                setTimeout("window.history.back()", 1000);
            }
        });
    }
</script>
</body>
</html>
