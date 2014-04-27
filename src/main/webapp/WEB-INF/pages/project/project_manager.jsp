<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>项目管理</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/wiwork.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2">
            <a class="btn btn-primary navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>管理项目</h4>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${projects}" var="project">
        <li class="list-group-item" style="min-height: 64px">
            <div class="btn-group pull-right" style="margin-top: 4px">
                <button type="button" class="btn btn-info" onclick="showModal(${project.id})">选项</button>
            </div>
            <h4 class="list-group-item-heading" style="margin-top: 10px"><c:out value="${project.name}"/></h4>
        </li>
    </c:forEach>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Title</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success">查看</button>
                <a href="/project/edit/1" class="btn btn-primary">编辑</a>
                <button type="button" class="btn btn-danger">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
<script>
    function showModal(id) {
        $('.modal').modal('show').on('shown', function () {
            $(".btn-primary").attr('href', '/project/edit/' + id);
        })
    }
</script>
</body>
</html>