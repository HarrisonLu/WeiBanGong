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
    <link rel="stylesheet" href="/static_resources/css/style.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2">
            <a class="btn btn-primary navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>评论</h4>
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
    <ul class="content-reply-box mg10">
        <c:forEach items="${comments}" var="comment">
            <li class="odd">
                <a class="user" href="#"><img class="img-responsive avatar_" src="/static_resources/images/head.png" alt=""><span class="user-name"><c:out value="${comment.userEnglishName}"/></span></a>
                <div class="reply-content-box">
                    <span class="reply-time"><c:out value="${comment.time}"/></span>
                    <div class="reply-content pr">
                        <span class="arrow">&nbsp;</span>
                        <c:out value="${comment.details}"/>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>

    <div class="navbar navbar-fixed-bottom" style="margin-bottom: -5px">
        <div class="input-group">
            <input type="text" class="form-control" id="message" placeholder="输入需要发送的信息…">
            <span class="input-group-btn">
                <button class="btn btn-default" onclick="onSend()">发送</button>
            </span>
        </div>
    </div>
</div>
<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
<script>
    function onSend() {
        alert("发送成功");
        document.getElementById("message").value="";

    }
</script>
</body>
</html>
