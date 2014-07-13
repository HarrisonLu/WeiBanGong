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
            <h4>员工权限管理</h4>
        </div>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/head.png">

    <div class="media-body">
        <h4 class="media-heading">${user.englishName} (${user.chineseName})</h4>

        <p></p>

        <p>${user.status}</p>
        <c:forEach items="${user.groupList}" var="group">
            <p>部门：${group.departmentName} - ${group.name}</p>
        </c:forEach>
        <p>职位：${user.position}</p>

    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">权限管理</h4>
    </div>
    <ul class="list-group">
        <li class="list-group-item list-group-item-higher">
            <h4 class="list-group-item-text">新建项目<span class="pull-right">
                <div class="switch">
                    <input type="checkbox" name="my-checkbox"
                           id="createProjectCheckbox" ${hasRightCreateProject == true ? 'checked' : ''}>
                </div>
            </span>
            </h4>
        </li>
    </ul>
</div>

<script>
    $(document).ready(function () {
        $('#createProjectCheckbox').bootstrapSwitch();
        $('#createProjectCheckbox').on('switchChange.bootstrapSwitch', function (event, state) {
            if (state) {
                $.ajax({
                    type: "POST",
                    url: encodeURI(encodeURI("/admin/member/privilege/project/add/${user.id}")),
                    contentType: "application/x-www-form-urlencoded;charset=utf-8"
                });
            } else {
                $.ajax({
                    type: "POST",
                    url: encodeURI(encodeURI("/admin/member/privilege/project/delete/${user.id}")),
                    contentType: "application/x-www-form-urlencoded;charset=utf-8"
                });
            }
        });
    });
</script>

</body>
</html>
