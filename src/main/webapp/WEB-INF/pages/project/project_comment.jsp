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
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>动态</h4>
        </div>
    </div>
</div>

<div class="media well">
    <h4 class="media-heading">${project.name}</h4>

    <p></p>

    <p>${project.info}</p>
</div>

<div class="container">
    <ul class="content-reply-box mg10">
        <c:forEach items="${commentProjects}" var="commentProject">
            <li class="odd">
                <a class="user" href="#"><img class="img-responsive avatar_" src="/static_resources/images/head.png"
                                              alt=""><span
                        class="user-name">${commentProject.userEnglishName}</span></a>

                <div class="reply-content-box">
                    <span class="reply-time">${commentProject.displayTime}</span>

                    <div class="reply-content pr">
                        <span class="arrow">&nbsp;</span>${commentProject.details}
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>

    <div class="navbar navbar-fixed-bottom" style="margin-bottom: -4px">
        <div class="input-group">
            <input type="text" class="form-control" id="project_message" placeholder="输入需要发送的信息…">
            <span class="input-group-btn">
                <button class="btn btn-default" onclick="onSend()">发送</button>
            </span>
        </div>
    </div>
</div>

<script>
    function onSend() {
        var message = $("#project_message").val();
        if (message == "") {
            alert("请输入评论")
            return;
        }
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {message: message},
            success: function (data) {
                document.getElementById("project_message").value = "";
                location.reload(false);
            }
        });
    }
</script>
</body>
</html>