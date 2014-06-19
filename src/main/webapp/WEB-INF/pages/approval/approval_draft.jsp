<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>审批流</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>草稿箱</h4>
        </div>
        <div class="col-xs-2 pull-right" style="text-align: center; margin-top: 10px"><a
                href="javascript:onDeleteDraft()"><img src="/static_resources/images/btn_head.png" width="30"
                                                       height="30"></a>
        </div>
    </div>
</div>

<div class="list-group">
    <a href="#" class="list-group-item" style="min-height: 64px">
        <h4 class="list-group-item-text">当前没有任何草稿</h4>
    </a>
</div>

<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <h4 class="modal-title">确定要删除所有草稿吗？</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<script>
    function onDeleteDraft() {
        $('#myModal').modal('show')
    }
</script>
</body>
</html>
