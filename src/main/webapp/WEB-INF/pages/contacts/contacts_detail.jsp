<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>通讯录</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/contacts.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.min.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-xs-2">
            <a class="btn btn-primary navbar-btn pull-left" role="button" onclick="onBack()">返回</a>
        </div>
        <div class="col-xs-8">
            <c:if test="${user.id == sessionScope.user_id}">
                <h4>个人信息</h4>
            </c:if>
            <c:if test="${user.id != sessionScope.user_id}">
                <h4>名片详情</h4>
            </c:if>
        </div>
        <div class="col-xs-2">
            <c:choose>
                <c:when test="${user.id == sessionScope.user_id}">
                    <a href="/contacts/user/edit" class="btn btn-primary navbar-btn pull-right" role="button">编辑</a>
                </c:when>
                <c:when test="${user.id != sessionScope.user_id}">
                    <a href="/contacts" class="btn btn-primary navbar-btn pull-right" role="button">首页</a>
                </c:when>
            </c:choose>
        </div>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/head.png">
    <div class="media-body">
        <p><c:out value="${user.englishName}"/> (<c:out value="${user.chineseName}"/>)
            <c:if test="${user.id != sessionScope.user_id}">
                <c:if test="${isCollected}">
                    <a href="/contacts/user/link/delete/${user.id}" onclick="onCount()">
                        <img name="star_on" class="pull-right" src="/static_resources/images/rate_star_big_on_holo_dark.png">
                    </a>
                </c:if>
                <c:if test="${!isCollected}">
                    <a href="/contacts/user/link/insert/${user.id}" onclick="onCount()">
                        <img name="star_off" class="pull-right" src="/static_resources/images/rate_star_big_off_holo_dark.png">
                    </a>
                </c:if>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.min.js"></script>
<script type="text/javascript">
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

    var backCountKey = "back_count";
    var curCount = sessionStorage.getItem(backCountKey);
    if (curCount == null) {
        curCount = 1;
        sessionStorage.setItem(backCountKey, 1);
    }
    var isCollected = ${isCollected};

    function onBack() {
        if (${user.id == sessionScope.user_id}) {
            window.location.href="/contacts";
        } else {
            history.go(-curCount);
            sessionStorage.setItem(backCountKey, 1);
        }
    }

    if (curCount != 1) {
        if (isCollected && curCount % 2 == 0) {
            toastr.success("该员工已收藏至常用联系人列表");
        } else if (isCollected && curCount % 2 != 0) {
            toastr.success("该员工已收藏至常用联系人列表");
        } else if (!isCollected && curCount % 2 == 0) {
            toastr.error("已取消收藏");
        } else if (!isCollected && curCount % 2 != 0) {
            toastr.error("已取消收藏");
        }
    }

    function onCount() {
        curCount++;
        sessionStorage.setItem(backCountKey, curCount);
    }


</script>
</body>
</html>
