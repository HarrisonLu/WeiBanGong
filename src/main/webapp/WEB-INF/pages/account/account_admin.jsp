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
            <h4>管理员账号</h4>
        </div>
    </div>
</div>

<div class="panel-body">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-xs-4 control-label">公司名称</label>

            <div class="col-xs-8">
                <input type="text" class="form-control" value="${admin.companyName}" readonly/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-4 control-label">手机号码</label>

            <div class="col-xs-8">
                <input type="number" class="form-control" id="phoneNum" value="${admin.phoneNum}"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-4 control-label">邮箱</label>

            <div class="col-xs-8">
                <input type="email" class="form-control" id="email" value="${admin.email}"/>
            </div>
        </div>
        <a href="/account/password/change" class="form-group list-group-item" style="min-height: 49px">
            <p class="list-group-item-text" style="text-align: center; margin-top: 5px">修改密码 >></p>
        </a>
        <a href="/account/admin/postfix" class="form-group list-group-item" style="min-height: 49px">
            <p class="list-group-item-text" style="text-align: center; margin-top: 5px">申请员工账号后缀 >></p>
        </a>
    </form>
    <a href="javascript:onAccountUpdate()" class="btn btn-success btn-lg btn-block btn-block-bottom"
       role="button">保存</a>
    <a href="javascript:$('#logoutModal').modal('show')"
       class="btn btn-danger btn-lg btn-block btn-block-bottom-no-top-margin"
       role="button">退出账号</a>
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
        var phoneNum = $("#phoneNum").val();
        var email = $("#email").val();
        if (phoneNum == "") {
            toastr.warning("手机号码不能为空")
            return;
        }
        if (email == "") {
            toastr.warning("邮箱不能为空")
            return;
        }
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/account/admin/update")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {phoneNum: phoneNum,
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
