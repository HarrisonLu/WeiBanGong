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

<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-6 title-bar-text">
            <a href="/admin/user/create"><img class="title-bar-image"
                                                        src="/static_resources/images/bar_item_create.png"></a>
        </div>
        <div class="col-xs-6 title-bar-text">
            <a href="javascript:$('#myModal').modal('show')"><img class="title-bar-image"
                                                                  src="/static_resources/images/bar_item_create.png"></a>
        </div>
    </div>

    <c:forEach items="${departments}" var="department">
        <a href="/contacts/department/${department.id}" class="list-group-item list-group-item-higher">
            <img class="pull-left head-pic-small" src="/static_resources/images/btn_head.png">
            <h4 class="list-group-item-text head-pic-text">${department.name}</h4>
        </a>
    </c:forEach>
</div>


<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="text-align: center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">请输入要创建的部门名称</h4>
            </div>
            <div class="modal-body" style="text-align: center">
                <input type="text" id="departmentName">
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-primary" onclick="onCreateDepartment()">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script>
    function onCreateDepartment() {
        var departmentName = $('#departmentName').val();
        if (departmentName == "") {
            return;
        }
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI("/admin/department/create")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {departmentName: departmentName},
            success: function (data) {
                if (data) {
                    toastr.success("创建成功")
                    window.location.reload(false);
                }
            }
        });

        $('#myModal').modal('hide');
    }
</script>

</body>
</html>