<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>通讯录</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>编辑信息</h4>
        </div>
        <div class="col-xs-2">
            <button type="submit" class="btn btn-primary navbar-btn pull-right" onclick="onUserUpdate()">保存
            </button>
        </div>
    </div>
</div>

<div class="media well">
    <a class="pull-left" href="#"><img class="pull-left" src="/static_resources/images/head.png"></a>

    <div class="media-body">
        <h4 class="media-heading">${user.englishName} (${user.chineseName})</h4>

        <p></p>

        <p>${user.status}</p>
        <c:forEach items="${user.groupList}" var="group">
            <p>部门：${group.departmentName} - ${group.name}</p>
        </c:forEach>
        <p>职位：${user.position}</p>

        <p>职级：${user.positionLevel}</p>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">联系方式</h4>
    </div>
    <div class="panel-body">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-xs-4 control-label">微信号</label>

                <div class="col-xs-8">
                    <input type="text" class="form-control" id="weChatNum" value="${user.wechatNum}" disabled>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">座机号码</label>

                <div class="col-xs-8">
                    <input type="number" class="form-control" id="telephoneNum" value="${user.telephoneNum}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">手机号码</label>

                <div class="col-xs-8">
                    <input type="number" class="form-control" id="mobilePhoneNum" value="${user.mobilePhoneNum}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">QQ号码</label>

                <div class="col-xs-8">
                    <input type="number" class="form-control" id="qqNum" value="${user.qqNum}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">邮箱</label>

                <div class="col-xs-8">
                    <input type="email" class="form-control" id="email" value="${user.email}">
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function onUserUpdate() {
        var weChatNum = $("#weChatNum").val();
        var telephoneNum = $("#telephoneNum").val();
        var mobilePhoneNum = $("#mobilePhoneNum").val();
        var qqNum = $("#qqNum").val();
        var email = $("#email").val();

        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/account/member/update")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {weChatNum: weChatNum,
                telephoneNum: telephoneNum,
                mobilePhoneNum: mobilePhoneNum,
                qqNum: qqNum,
                email: email},
            success: function () {
                toastr.success("保存成功");
                setTimeout("window.location.href='/contacts'", 1000);
            }
        });
    }
</script>
</body>
</html>
