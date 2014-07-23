<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>微办公</title>
</head>
<body onload="document.getElementById('postfix').focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>申请后缀</h4>
        </div>
    </div>
</div>

<div class="panel-body">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-xs-4 control-label">账号后缀</label>

            <label class="col-xs-2 control-label">@</label>

            <div class="col-xs-4">
                <input type="email" class="form-control" id="postfix" value="${postfix}">
            </div>
            <label class="col-xs-2 control-label">.com</label>
        </div>
    </form>
    <a href="javascript:onPostfixApply()" class="btn btn-success btn-lg btn-block btn-block-bottom" role="button">
        提交</a>

    <p>提示：</p>

    <p>1、员工账号后缀是企业员工的统一识别码</p>

    <p>2、提交成功后可为企业员工申请账号</p>

    <p>3、后缀一经确认后不可修改</p>
</div>

<script>
    function onPostfixApply() {
        var postfix = $("#postfix").val();
        if (postfix == "") {
            toastr.warning("后缀不能为空");
            return;
        }
        var c = new RegExp();
        c = /^[A-Za-z0-9]+$/;
        if (!c.test(postfix)) {
            toastr.warning("后缀只支持英文或数字，请正确填写");
            return;
        }
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {postfix: postfix},
            success: function (data) {
                if (!data) {
                    toastr.error("后缀已确认，不得修改");
                    return;
                }
                toastr.success("提交成功！可以开始创建员工账号！");
                setTimeout("window.history.back()", 1000);
            },
            error: function () {
                toastr.error("后缀已被占用，请使用其它后缀");
            }
        });
    }
</script>
</body>
</html>
