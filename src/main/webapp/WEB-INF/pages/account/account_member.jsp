<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h4>我的账号</h4>
        </div>
    </div>
</div>

<form class="form-horizontal" style="margin-right: 15px">
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">中文名</label>

        <div class="col-xs-8">
            <p class="form-control-static pull-right">${user.chineseName}</p>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">英文名</label>

        <div class="col-xs-8">
            <p class="form-control-static pull-right">${user.englishName}</p>
        </div>
    </div>

    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">归属部门</label>

        <div class="col-xs-8">
            <p class="form-control-static pull-right">
                <c:forEach items="${user.groupList}" var="group">
                    ${group.departmentName} - ${group.name}
                </c:forEach>
            </p>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">职位名称</label>

        <div class="col-xs-8">
            <p class="form-control-static pull-right">
                ${empty user.position ? "暂无" : user.position}
            </p>
        </div>
    </div>
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">账号</label>

        <div class="col-xs-8">
            <p class="form-control-static pull-right">${user.email}</p>
        </div>
    </div>
    <a href="/account/password/change" class="form-group list-group-item" style="min-height: 49px">
        <p class="list-group-item-text" style="text-align: center; margin-top: 5px">修改密码 >></p>
    </a>
</form>


<div class="panel panel-primary" style="margin-top: 20px">
    <div class="panel-heading">
        <h4 class="panel-title">联系方式</h4>
    </div>
    <div class="panel-body">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-xs-4 control-label">微信号</label>

                <div class="col-xs-8">
                    <input type="text" class="form-control" id="weChatNum" placeholder="请输入您的微信号"
                           value="${user.wechatNum}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">座机</label>

                <div class="col-xs-8">
                    <input type="number" class="form-control" id="telephoneNum" placeholder="请输入您的座机号码"
                           value="${user.telephoneNum}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">手机</label>

                <div class="col-xs-8">
                    <input type="number" class="form-control" id="mobilePhoneNum" placeholder="请输入您的手机号码"
                           value="${user.mobilePhoneNum}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">QQ号</label>

                <div class="col-xs-8">
                    <input type="number" class="form-control" id="qqNum" placeholder="请输入您的QQ号码"
                           value="${user.qqNum}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-4 control-label">邮箱</label>

                <div class="col-xs-8">
                    <input type="email" class="form-control" id="email" placeholder="请输入您的邮箱" value="${user.email}"/>
                </div>
            </div>
        </form>
        <a href="javascript:onAccountUpdate()" class="btn btn-success btn-lg btn-block btn-block-bottom"
           role="button">保存</a>
        <a href="javascript:$('#logoutModal').modal('show')"
           class="btn btn-danger btn-lg btn-block btn-block-bottom-no-top-margin"
           role="button">退出账户</a>
    </div>
</div>

<div class="modal" id="logoutModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="text-align: center">
                <h4>确认退出账号吗？</h4>

                <p>退出后不会删除任何数据，下次登录依然可以使用本账号</p>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-danger btn-block btn-block-bottom-no-top-margin"
                        onclick="onAccountLogout()">退出账号
                </button>
                <button type="button" class="btn btn-default btn-block btn-block-bottom" data-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    function onAccountUpdate() {
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
            success: function (data) {
                if (data) {
                    toastr.success("保存成功");
                    setTimeout("window.history.back()", 1000);
                }
            }
        });
    }
</script>
</body>
</html>
