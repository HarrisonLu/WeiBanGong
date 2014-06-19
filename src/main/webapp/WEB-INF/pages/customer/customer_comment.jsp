<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>客户管理</title>
    <link rel="stylesheet" href="/static_resources/css/style.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>评论</h4>
        </div>
    </div>
</div>

<div class="media well">
    <img class="pull-left" src="/static_resources/images/head.png">
    <div class="media-body">
        <h4 class="media-heading">${customer.englishName} (${customer.chineseName})</h4>
        <p></p><p>${customer.projectName}</p>
        <p>${customer.moduleName}</p>
        <p>${customer.taskName}</p>
    </div>
</div>

<div class="container">
    <ul class="content-reply-box mg10">
        <c:forEach items="${comments}" var="comment">
            <li class="odd">
                <a class="user" href="#"><img class="img-responsive avatar_" src="/static_resources/images/head.png"
                                              alt="">
                    <span class="user-name">${comment.userEnglishName}</span></a>

                <div class="reply-content-box">
                    <span class="reply-time">${comment.displayTime}</span>

                    <div class="reply-content pr">
                        <span class="arrow">&nbsp;</span>${comment.details}
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>

    <div class="navbar navbar-fixed-bottom" style="margin-bottom: -4px">
        <div class="input-group">
            <input type="text" class="form-control" id="customer_message" placeholder="输入需要发送的信息…">
            <span class="input-group-btn">
                <button class="btn btn-default" onclick="onSend()">发送</button>
            </span>
        </div>
    </div>
</div>

<script>
    function onSend() {
        var message = $("#customer_message").val();
        if (message == "") {
            alert("请输入评论")
            return;
        }
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {message: message},
            success: function () {
                document.getElementById("customer_message").value = "";
                location.reload(false);
            }
        });
    }
</script>
</body>
</html>