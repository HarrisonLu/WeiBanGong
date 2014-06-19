<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>微办公</title>
</head>
<body onload="document.form1.suffix.focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>申请后缀</h4>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" style="margin-right: 15px">
    <div class="form-group list-group-item">
        <label class="col-xs-4 control-label">账号后缀</label>

        <div class="col-xs-8">
            <input type="email" class="form-control" id="suffix" placeholder="@_____.com">
        </div>
    </div>
</form>

<div class="container">
    <a href="javascript:onApplySuffix()" class="btn btn-primary btn-lg btn-block" role="button"
       style="margin-top: 25px; margin-bottom: 10px">
        提交</a>

    <p>提示：</p>

    <p>1、员工账号后缀是企业员工的统一识别码</p>

    <p>2、提交成功后可为企业员工申请账号</p>

    <p>3、后缀一经确认后不可修改</p>
</div>


<script>
    function onApplySuffix() {
        var suffix = $("#suffix").val();
        if (suffix == "") {
            toastr.warning("后缀不能为空");
            return;
        }
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/account/admin/suffix/apply")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {suffix: suffix},
            success: function (data) {
                if (!data) {
                    toastr.error("后缀已被占用");
                    return;
                }
                toastr.success("提交成功！可以开始创建员工账号！");
                setTimeout("window.history.back()", 1500);
            }
        });
    }
</script>
</body>
</html>
