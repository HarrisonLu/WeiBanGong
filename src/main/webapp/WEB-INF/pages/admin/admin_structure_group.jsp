<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
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
            <h4>${group.name}</h4>
        </div>
        <div class="col-xs-2">
            <div class="btn-group navbar-btn pull-right">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><b
                        class="caret"></b>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="javascript:$('#deleteGroupModal').modal('show')">删除该分组</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="list-group">
    <div class="row-fluid title-bar">
        <div class="col-xs-12 title-bar-text">
            <a href="javascript:onUserCreate()" class="btn btn-primary" role="button">新建组成员</a>
        </div>
    </div>

    <c:forEach items="${group.userList}" var="user">
        <a href="/admin/structure/detail/${user.id}" class="list-group-item">
            <img class="pull-left" src="/static_resources/images/head.png">
            <h4 class="list-group-item-heading head-pic-text">${user.englishName} (${user.chineseName})</h4>

            <p class="list-group-item-text head-pic-text info-detail">${group.departmentName} - ${group.name}</p>
        </a>
    </c:forEach>
    <c:if test="${empty group.userList}">
        <div class="list-group-item" style="min-height: 100px">
            <p style="text-align: center; color: #8E8E8E; margin-top: 30px">轻触上面按钮新建分组成员</p>
        </div>
    </c:if>
</div>

<div class="modal" id="deleteGroupModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="text-align: center">
                <h4>确认删除"${group.name}"吗？</h4>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-danger btn-block btn-block-bottom-no-top-margin"
                        onclick="onGroupDelete()">删除分组
                </button>
                <button type="button" class="btn btn-default btn-block btn-block-bottom" data-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        if (localStorage[REFRESH_USER] == 1) {
            localStorage[REFRESH_USER] = 0;
            window.location.reload();
        }
    });

    function onUserCreate() {
        if (${!postfixCreated}) {
            toastr.warning("请先前往我的账号设置员工后缀");
            return;
        }
        window.location.href = "/admin/structure/department/" + ${department.id} +"/group/" + ${group.id}+"/user/create/";
    }

    function onGroupDelete() {
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/admin/structure/group/delete")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {groupId: ${group.id}},
            success: function (data) {
                if (data) {
                    toastr.success("删除成功");
                    localStorage[REFRESH_GROUP] = 1;
                    window.history.back();
                }
            }
        })
    }
</script>
</body>
</html>
