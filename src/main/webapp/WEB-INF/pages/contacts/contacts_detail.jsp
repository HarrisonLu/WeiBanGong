<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>通讯录</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/wiwork.css">
    <link rel="stylesheet" href="/static_resources/css/toastr.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <c:if test="${user.id == sessionScope.user_id}">
                <h4>个人信息</h4>
            </c:if>
            <c:if test="${user.id != sessionScope.user_id}">
                <h4>名片详情</h4>
            </c:if>
        </div>
        <div class="col-xs-2">
            <c:if test="${user.id == sessionScope.user_id}">
                <a href="/contacts/user/edit" class="btn btn-primary navbar-btn pull-right" role="button">编辑</a>
            </c:if>
            <c:if test="${user.id != sessionScope.user_id}">
                <a href="/contacts" class="btn btn-primary navbar-btn pull-right" role="button">首页</a>
            </c:if>
        </div>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/head.png">

    <div class="media-body">
        <p><c:out value="${user.englishName}"/> (<c:out value="${user.chineseName}"/>)
            <c:if test="${user.id != sessionScope.user_id}">
                <a href="javascript:onLinkChange()">
                    <img class="pull-right" id="img_star" src="${isCollected ? '/static_resources/images/rate_star_big_on_holo_dark.png' : '/static_resources/images/rate_star_big_off_holo_dark.png'}">
                </a>
            </c:if>
        </p>

        <p><c:out value="${user.status}"/></p>
        <c:forEach items="${user.groupList}" var="group">
            <p>部门：<c:out value="${group.departmentName}"/> - <c:out value="${group.name}"/></p>
        </c:forEach>
        <p>职位：<c:out value="${user.position}"/></p>

        <p>职级：<c:out value="${user.positionLevel}"/></p>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">联系方式</h4>
    </div>
    <ul class="list-group">
        <li class="list-group-item">微信号<p class="pull-right"><c:out value="${user.wechatNum}"/></p></li>
        <li class="list-group-item">座机号码<p class="pull-right"><c:out value="${user.telephoneNum}"/></p></li>
        <li class="list-group-item">手机号码<p class="pull-right"><c:out value="${user.mobilePhoneNum}"/></p></li>
        <li class="list-group-item">QQ号码<p class="pull-right"><c:out value="${user.qqNum}"/></p></li>
        <li class="list-group-item">邮箱<p class="pull-right"><c:out value="${user.email}"/></p></li>
    </ul>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">组织架构</h4>
    </div>
    <div class="list-group">
        <c:forEach items="${user.groupList}" var="group">
            <a href="/contacts/group/${group.id}" class="list-group-item">
                <c:out value="${group.departmentName}"/> - <c:out value="${group.name}"/>
            </a>
        </c:forEach>
        <c:if test="${user.groupList.size() == 0}">
            <p class="list-group-item">暂无分组</p>
        </c:if>
    </div>
</div>
<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
<script src="/static_resources/js/toastr.min.js"></script>
<script>

    function onLinkChange() {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "positionClass": "toast-bottom-full-width",
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "2000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        $.ajax({
            type: "GET",
            url: "/contacts/user/link/${user.id}",
            success: function(result) {
                if (result) {
                    document.getElementById("img_star").src="/static_resources/images/rate_star_big_on_holo_dark.png";
                    toastr.success("该员工已收藏至常用联系人列表");
                } else {
                    document.getElementById("img_star").src="/static_resources/images/rate_star_big_off_holo_dark.png";
                    toastr.error("已取消收藏");
                }
            }
        })
    }

</script>
</body>
</html>
