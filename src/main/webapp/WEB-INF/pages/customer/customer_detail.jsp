<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>客户管理</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>名片详情</h4>
        </div>
        <div class="col-xs-2">
            <c:choose>
                <c:when test="${isMine}">
                    <div class="btn-group navbar-btn pull-right">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">选项<b
                                class="caret" style="margin-left: 5px;"></b>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="/customer/edit/${customer.id}">编辑</a></li>
                            <li class="divider"></li>
                            <li><a href="/customer/comment/${customer.id}">评论</a></li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="/customer/comment/${customer.id}" class="btn btn-primary navbar-btn pull-right"
                       role="button">评论</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/head.png">

    <div class="media-body">
        <h4 class="media-heading">${customer.englishName} (${customer.chineseName})</h4>

        <p></p>

        <p>${customer.projectName}</p>

        <p>${customer.moduleName}</p>

        <p>${customer.taskName}</p>
    </div>
</div>

<ul class="list-group">
    <li class="list-group-item">所处阶段
        <c:choose>
            <c:when test="${customer.discussStageId == 1}">
                <p class="pull-right" style="color: #75ba81">
                        ${customer.discussStageName}
                </p>
            </c:when>
            <c:when test="${customer.discussStageId == 2}">
                <p class="pull-right" style="color: #fbc584">
                        ${customer.discussStageName}
                </p>
            </c:when>
            <c:when test="${customer.discussStageId == 3}">
                <p class="pull-right" style="color: #fd797c">
                        ${customer.discussStageName}
                </p>
            </c:when>
            <c:otherwise>
                <p class="pull-right">
                        ${customer.discussStageName}
                </p>
            </c:otherwise>
        </c:choose>
    </li>
    <li class="list-group-item">客户价值<p></p>

        <p>${empty customer.customerValue ? "无" : customer.customerValue}</p></li>
</ul>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" href="#collapseOne">
                联系方式
            </a>
        </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in">
        <li class="list-group-item">手机号码<p class="pull-right">${customer.mobilePhoneNum}</p></li>
        <li class="list-group-item">微信号<p class="pull-right">${customer.wechatNum}</p></li>
        <li class="list-group-item">座机号码<p class="pull-right">${customer.telephoneNum}</p></li>
        <li class="list-group-item">QQ号码<p class="pull-right">${customer.qqNum}</p></li>
        <li class="list-group-item">电子邮箱<p class="pull-right">${customer.email}</p></li>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" href="#collapseTwo">
                个性信息
            </a>
        </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse in">
        <li class="list-group-item">生日<p class="pull-right">${customer.birthdayString}</p></li>
        <li class="list-group-item">爱好<p class="pull-right">${customer.hobby}</p></li>
    </div>
</div>

<script>
    $(document).ready(function () {
        if (localStorage[REFRESH_CUSTOMER] == 1) {
            localStorage[REFRESH_CUSTOMER] = 0;
            window.location.reload();
        }
    });
</script>
</body>
</html>
