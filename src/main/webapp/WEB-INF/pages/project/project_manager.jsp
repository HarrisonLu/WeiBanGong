<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="/project"><img class="title-bar-image" src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>管理项目</h4>
        </div>
    </div>
</div>

<ul class="list-group">
    <c:forEach items="${projects}" var="project">
        <li class="list-group-item list-group-item-higher">
            <div class="btn-group pull-right" style="margin-top: 4px">
                <button type="button" class="btn btn-info" onclick="showModal(${project.id})">选项</button>
            </div>
            <h4 class="list-group-item-heading" style="margin-top: 10px">${project.name}</h4>
        </li>
    </c:forEach>
</ul>

<div class="modal" id="choiceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="text-align: center">
                <a href="#" class="btn btn-success">查看</a>
                <hr>
                <a href="#" class="btn btn-primary">编辑</a>
                <hr>
                <a href="#" class="btn btn-danger">删除</a>
                <hr>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <h4 class="modal-title">确定删除该项目吗？删除后，该项目下所属模块及任务都将一并删除。请谨慎操作！</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<script>
    function showModal(id) {
        $('#choiceModal').modal('show');
        $('.btn-success').attr('href', '/project/detail/' + id);
        $('.btn-primary').attr('href', '/project/edit/' + id);
        $('.btn-danger').attr('href', 'javascript:onDeleteProject(' + id + ')');
    }

    function onDeleteProject(pid) {
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/project/delete")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {projectId: pid},
            success: function (data) {
                location.reload(false);
            }
        });
    }
</script>
</body>
</html>