<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>客户管理</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/customer.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <div class="row title-bar">
        <div class="col-xs-2">
            <a class="btn btn-success navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8">
            <h4>名片详情</h4>
        </div>
        <div class="col-xs-2">
            <a href="/customer/${customer.id}/comment" class="btn btn-success navbar-btn pull-right" role="button">评论</a>
        </div>
    </div>
</div>

<div class="list-group">
    <div class="list-group-item">
        <img class="pull-left" src="/static_resources/images/head.png" alt="">
        <h4 class="list-group-item-heading head-pic-text"><c:out value="${customer.name}"/></h4>
        <p class="list-group-item-text head-pic-text"><c:out value="${customer.project}"/></p>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <p>所处阶段</p>
        </div>
        <div class="col-xs-6">
            <p class="pull-right">洽谈中</p>
        </div>
    </div>

    <hr>
    <p>客户价值</p>
    <p>该客户是惠州房产项目政府主要负责人，负责进行土地所有权资格审核</p>

</div>
<div class="panel-group" id="accordion">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseOne">
                    联系方式
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <li class="list-group-item">手机号码<c:out value="${customer.mobilePhoneNum}"/></li>
            <li class="list-group-item">微信号<c:out value="${customer.wechatNum}"/></li>
            <li class="list-group-item">座机号码<c:out value="${customer.telephoneNum}"/></li>
            <li class="list-group-item">QQ号码<c:out value="${customer.qqNum}"/></li>
            <li class="list-group-item">电子邮箱<c:out value="${customer.email}"/></li>
        </div>
    </div>
    <div class="panel panel-success">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseTwo">
                    个性信息
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse in">
            <li class="list-group-item">生日<c:out value="${customer.birthday}"/></li>
            <li class="list-group-item">爱好<c:out value="${customer.hobby}"/></li>
        </div>
    </div>
    <div class="panel-footer">此客户为项目（任务）成员lisali（李莎）共享</div>
</div>



</body>
</html>
