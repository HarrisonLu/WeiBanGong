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
            <h4>组织架构管理</h4>
        </div>

    </div>
</div>

<div class="list-group">
    <div class="row-fluid title-bar">
        <div class="col-xs-6 title-bar-text">
            <a href="javascript:$('#groupModal').modal('show')" class="btn btn-primary" role="button">新建组</a>
        </div>
        <div class="col-xs-6 title-bar-text">
            <a href="javascript:onUserCreate()" class="btn btn-primary" role="button">新建部门成员</a>
        </div>
    </div>

    <c:forEach items="${department.userList}" var="user">
        <a href="/admin/structure/detail/${user.id}" class="list-group-item">
            <img class="pull-left head-pic" src="/static_resources/images/head.png">
            <h4 class="list-group-item-heading head-pic-text">${user.englishName} (${user.chineseName})</h4>

            <p class="list-group-item-text head-pic-text info-detail">${department.name}</p>
        </a>
    </c:forEach>
    <c:forEach items="${department.groupList}" var="group">
        <a href="/admin/structure/department/${department.id}/group/${group.id}"
           class="list-group-item list-group-item-higher">
            <img class="pull-left head-pic-small" src="/static_resources/images/btn_head.png">
            <h4 class="list-group-item-text head-pic-text">${group.name}</h4>
        </a>
    </c:forEach>
    <c:if test="${empty department.groupList}">
        <li class="list-group-item list-group-item-higher">
            <h4 class="list-group-item-text">暂无部门</h4>
        </li>
    </c:if>
</div>

<div class="modal" id="groupModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="text-align: center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">请输入要创建的组名称</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <input type="text" id="groupName" placeholder="组名称" style="min-height: 40px; min-width: 150px">
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-primary" onclick="onGroupCreate()">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
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

    function onGroupCreate() {
        var groupName = $('#groupName').val();
        if (groupName == "") {
            toastr.warning("请输入组名称");
            return;
        }
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/admin/structure/group/create")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {groupName: groupName,
                departmentId: ${department.id}},
            success: function (data) {
                toastr.success("创建成功")
                window.location.reload();
            }
        });
        $('#groupModal').modal('hide');
    }

    function onUserCreate() {
        if (${!postfixCreated}) {
            toastr.warning("请先前往我的账号设置员工后缀");
            return;
        }
        window.location.href = "/admin/structure/department/" + ${department.id} +"/user/create/";
    }
</script>

</body>
</html>
