<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>通讯录</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>${user.id == sessionScope.account_id ? "个人信息" : "名片详情"}</h4>
        </div>
        <%--<c:if test="${user.id == sessionScope.account_id}">--%>
        <%--<div class="col-xs-2">--%>
        <%--<a href="/contacts/user/edit" class="btn btn-primary navbar-btn pull-right" role="button">编辑</a>--%>
        <%--</div>--%>
        <%--</c:if>--%>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/head.png">

    <div class="media-body">
        <h4 class="media-heading">${user.englishName} (${user.chineseName})
            <c:if test="${user.id != sessionScope.account_id}">
                <a href="javascript:onLinkChange()">
                    <img class="pull-right" id="img_star"
                         src="${isCollected ? '/static_resources/images/rate_star_big_on_holo_dark.png' : '/static_resources/images/rate_star_big_off_holo_dark.png'}">
                </a>
            </c:if>
        </h4>

        <p></p>

        <c:forEach items="${user.departmentList}" var="department">
            <p>部门：${department.name}</p>
        </c:forEach>

        <c:forEach items="${user.groupList}" var="group">
            <p>部门：${group.departmentName} - ${group.name}</p>
        </c:forEach>

        <p>职位：${user.position}</p>

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
    $(document).ready(function () {
        if (localStorage[REFRESH_USER] == 1) {
            localStorage[REFRESH_USER] = 0;
            window.location.reload();
        }
    });

    function onLinkChange() {
        $.ajax({
            type: "GET",
            url: "/contacts/user/link/${user.id}",
            success: function (data) {
                localStorage[REFRESH_CONTACTS] = 1;
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
