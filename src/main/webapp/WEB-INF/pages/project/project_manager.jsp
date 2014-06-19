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
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>管理项目</h4>
        </div>
    </div>
</div>

<div class="list-group">
    <c:forEach items="${projects}" var="project">
        <li class="list-group-item" style="min-height: 64px">
                <%--<div class="btn-group pull-right" style="margin-top: 4px">--%>
                <%--<button type="button" class="btn btn-info" onclick="showModal(${project.id})">选项</button>--%>
                <%--</div>--%>
            <div class="btn-group navbar-btn pull-right">
                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">选项<b
                        class="caret" style="margin-left: 5px;"></b>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="/project/detail/${project.id}">查看</a></li>
                    <li class="divider"></li>
                    <li><a href="/project/edit/${project.id}">编辑</a></li>
                    <li class="divider"></li>
                    <li><a href="javascript:onDeleteProject(<c:out value="${project.id}"/>)">删除</a></li>
                </ul>
            </div>
            <h4 class="list-group-item-heading" style="margin-top: 10px">${project.name}</h4>
        </li>
    </c:forEach>
</div>

<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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

<script>
    function showModal(id) {
        $('.modal').modal('show');
        $(".btn-success").attr('href', '/project/' + id);
        $(".btn-primary").attr('href', '/project/edit/' + id);
        $(".btn-danger").attr('href', 'javascript:onDeleteProject(' + id + ')');
    }

    function onDeleteProject(pid) {
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/project/delete")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {projectId: pid},
            success: function (data) {
                console.log(data)
                location.reload(false);
            }
        });
    }
</script>
</body>
</html>