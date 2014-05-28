<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>项目管理</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/wiwork.css">
    <link rel="stylesheet" href="/static_resources/css/style.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>动态</h4>
        </div>
    </div>
</div>

<div class="media well">
    <p><strong><c:out value="${project.name}"/></strong></p>
    <p><c:out value="${project.info}"/></p>
</div>

<div class="container">
    <ul class="content-reply-box mg10">
        <c:forEach items="${commentProjects}" var="commentProject">
            <li class="odd">
                <a class="user" href="#"><img class="img-responsive avatar_" src="/static_resources/images/head.png"
                                              alt=""><span class="user-name"><c:out
                        value="${commentProject.userEnglishName}"/></span></a>

                <div class="reply-content-box">
                    <span class="reply-time"><c:out value="${commentProject.displayTime}"/></span>

                    <div class="reply-content pr">
                        <span class="arrow">&nbsp;</span>
                        <c:out value="${commentProject.details}"/>
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

<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
<script>
    function onSend() {
        var message = $("#project_message").val();
        if (message == "") {
            alert("请输入评论")
        } else {
            $.ajax({
                type: "GET",
                url: encodeURI(encodeURI(window.location + "/" + message)),
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                success: function (data) {
                    alert("评论成功!")
                    document.getElementById("project_message").value = "";
                    location.reload(false);
                }
            });
        }
    }
</script>
</body>
</html>