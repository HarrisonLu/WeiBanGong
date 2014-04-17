<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>客户管理</title>
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
            <h4>名片详情</h4>
        </div>
        <div class="col-xs-2">
            <c:choose>
                <c:when test="${isMine}">
                    <div class="btn-group navbar-btn pull-right">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">选项<b class="caret" style="margin-left: 5px;"></b>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="/customer/edit/${customer.id}">编辑</a></li>
                            <li class="divider"></li>
                            <li><a href="/customer/comment/${customer.id}">评论</a></li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="/customer/comment/${customer.id}" class="btn btn-primary navbar-btn pull-right" role="button">评论</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/head.png">
    <div class="media-body">
        <p><strong><c:out value="${customer.englishName}"/> (<c:out value="${customer.chineseName}"/>)</strong></p>
        <p><c:out value="${customer.projectName}"/></p>
        <p><c:out value="${customer.moduleName}"/></p>
        <p><c:out value="${customer.taskName}"/></p>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <p>所处阶段</p>
        </div>
        <div class="col-xs-6">
            <p class="pull-right"><c:out value="${customer.discussStageName}"/></p>
        </div>
    </div>

    <hr>
    <p>客户价值</p>
    <c:out value="${customer.customerValue}"/>

</div>

<div class="panel-group" id="accordion">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseOne">
                    联系方式
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <li class="list-group-item">手机号码<p class="pull-right"><c:out value="${customer.mobilePhoneNum}"/></p></li>
            <li class="list-group-item">微信号<p class="pull-right"><c:out value="${customer.wechatNum}"/></p></li>
            <li class="list-group-item">座机号码<p class="pull-right"><c:out value="${customer.telephoneNum}"/></p></li>
            <li class="list-group-item">QQ号码<p class="pull-right"><c:out value="${customer.qqNum}"/></p></li>
            <li class="list-group-item">电子邮箱<p class="pull-right"><c:out value="${customer.email}"/></p></li>
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
            <li class="list-group-item">生日<p class="pull-right"><c:out value="${customer.birthdayString}"/></p></li>
            <li class="list-group-item">爱好<p class="pull-right"><c:out value="${customer.hobby}"/></p></li>
        </div>
    </div>
    <div class="panel-footer">此客户为项目（任务）成员lisali（李莎）共享</div>
</div>
<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
