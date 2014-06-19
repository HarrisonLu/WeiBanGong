<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>通讯录</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <c:if test="${user.id == sessionScope.user_id}">
                <h4>个人信息</h4>
            </c:if>
            <c:if test="${user.id != sessionScope.user_id}">
                <h4>名片详情</h4>
            </c:if>
        </div>
        <c:if test="${user.id == sessionScope.user_id}">
            <div class="col-xs-2">
                <a href="/contacts/user/edit" class="btn btn-primary navbar-btn pull-right" role="button">编辑</a>
            </div>
        </c:if>
        <%--<c:if test="${user.id != sessionScope.user_id}">--%>
        <%--<div class="col-xs-2" style="margin-top: 10px">--%>
        <%--<a href="/contacts"><img src="/static_resources/images/btn_head.png" width="32" height="32"></a>--%>
        <%--</div>--%>
        <%--</c:if>--%>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/head.png">

    <div class="media-body">
        <h4 class="media-heading">${user.englishName} (${user.chineseName})
            <c:if test="${user.id != sessionScope.user_id}">
                <a href="javascript:onLinkChange()">
                    <img class="pull-right" id="img_star"
                         src="${isCollected ? '/static_resources/images/rate_star_big_on_holo_dark.png' : '/static_resources/images/rate_star_big_off_holo_dark.png'}">
                </a>
            </c:if>
        </h4>

        <p></p><p>${user.status}</p>
        <c:forEach items="${user.groupList}" var="group">
            <p>部门：${group.departmentName} - ${group.name}</p>
        </c:forEach>
        <p>职位：${user.position}</p>

        <p>职级：${user.positionLevel}</p>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">联系方式</h4>
    </div>
    <ul class="list-group">
        <li class="list-group-item">微信号<p class="pull-right">${user.wechatNum}</p></li>
        <li class="list-group-item">座机号码<p class="pull-right">${user.telephoneNum}</p></li>
        <li class="list-group-item">手机号码<p class="pull-right">${user.mobilePhoneNum}</p></li>
        <li class="list-group-item">QQ号码<p class="pull-right">${user.qqNum}</p></li>
        <li class="list-group-item">邮箱<p class="pull-right">${user.email}</p></li>
    </ul>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">组织架构</h4>
    </div>
    <div class="list-group">
        <c:forEach items="${user.groupList}" var="group">
            <a href="/contacts/group/${group.id}" class="list-group-item">
                    ${group.departmentName} - ${group.name}
            </a>
        </c:forEach>
        <c:if test="${user.groupList.size() == 0}">
            <p class="list-group-item">暂无分组</p>
        </c:if>
    </div>
</div>

<script>
    function onLinkChange() {
        $.ajax({
            type: "GET",
            url: "/contacts/user/link/${user.id}",
            success: function (data) {
                if (data) {
                    document.getElementById("img_star").src = "/static_resources/images/rate_star_big_on_holo_dark.png";
                    toastr.success("该员工已收藏至常用联系人列表");
                } else {
                    document.getElementById("img_star").src = "/static_resources/images/rate_star_big_off_holo_dark.png";
                    toastr.error("已取消收藏");
                }
            }
        })
    }

</script>
</body>
</html>
