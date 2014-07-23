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
            <h4>组织架构管理</h4>
        </div>
        <div class="col-xs-2">
            <div class="btn-group navbar-btn pull-right">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><b
                        class="caret"></b>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="javascript:$('#deleteUserModal').modal('show')">删除该成员</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/head.png">

    <div class="media-body">
        <h4 class="media-heading">${user.englishName} (${user.chineseName})</h4>

        <p></p>

        <c:forEach items="${user.departmentList}" var="department">
            <p>部门：${department.name}</p>
        </c:forEach>

        <c:forEach items="${user.groupList}" var="group">
            <p>部门：${group.departmentName} - ${group.name}</p>
        </c:forEach>

        <p>职位：${user.position}</p>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">联系方式</h4>
    </div>
    <ul class="list-group">
        <li class="list-group-item">微信号<p class="pull-right">${user.wechatNum}</p></li>
        <li class="list-group-item">座机号码<p class="pull-right">${user.telephoneNum}</p></li>
        <li class="list-group-item">手机号码<p class="pull-right">${user.mobilePhoneNum}</p></li>
        <li class="list-group-item">QQ号码<p class="pull-right">${user.qqNum}</p></li>
        <li class="list-group-item">邮箱<p class="pull-right">${user.email}</p></li>
    </ul>
</div>

<div class="modal" id="deleteUserModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="text-align: center">
                <h4>确认删除"${user.chineseName}"吗？</h4>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-danger btn-block btn-block-bottom-no-top-margin"
                        onclick="onUserDelete()">删除成员
                </button>
                <button type="button" class="btn btn-default btn-block btn-block-bottom" data-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    function onUserDelete() {
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/admin/structure/user/delete")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {userId: ${user.id}},
            success: function (data) {
                if (data) {
                    toastr.success("删除成功");
                    localStorage[REFRESH_USER] = 1;
                    window.history.back();
                }
            }
        })
    }
</script>

</body>
</html>
