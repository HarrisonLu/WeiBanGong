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
            <h4>评论</h4>
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

<div class="container widget-content padded">
    <ul>
        <li>
            <img width="30" height="30" src="images/avatar-male.jpg" />
            <div class="bubble">
                <a class="user-name" href="#">兰若</a>
                <p class="message">
                    aaaaa
                </p>
                <p class="time">
                    <strong>今天 </strong>3:53 pm
                </p>
            </div>
        </li>
        <li class="current-user">
            <img width="30" height="30" src="images/avatar-female.jpg" />
            <div class="bubble">
                <a class="user-name" href="#">王晓</a>
                <p class="message">
                    bbbbb
                </p>
                <p class="time">
                    <strong>今天 </strong>3:53 pm
                </p>
            </div>
        </li>
        <li>
            <img width="30" height="30" src="images/avatar-male.jpg" />
            <div class="bubble">
                <a class="user-name" href="#">兰若</a>
                <p class="message">
                    ccccc
                </p>
                <p class="time">
                    <strong>今天 </strong>3:53 pm
                </p>
            </div>
        </li>
        <li>
            <img width="30" height="30" src="images/avatar-male.jpg" />
            <div class="bubble">
                <a class="user-name" href="#">兰若</a>
                <p class="message">
                    ddddd
                </p>
                <p class="time">
                    <strong>今天 </strong>3:53 pm
                </p>
            </div>
        </li>
        <li class="current-user">
            <img width="30" height="30" src="images/avatar-female.jpg" />
            <div class="bubble">
                <a class="user-name" href="#">王晓</a>
                <p class="message">
                    eeeee
                </p>
                <p class="time">
                    <strong>今天 </strong>3:53 pm
                </p>
            </div>
        </li>
        <li>
            <img width="30" height="30" src="images/avatar-male.jpg" />
            <div class="bubble">
                <a class="user-name" href="#">兰若</a>
                <p class="message">
                    fffff
                </p>
                <p class="time">
                    <strong>今天 </strong>3:53 pm
                </p>
            </div>
        </li>
        <li class="current-user">
            <img width="30" height="30" src="images/avatar-female.jpg" />
            <div class="bubble">
                <a class="user-name" href="#">王晓</a>
                <p class="message">
                    ggggg
                </p>
                <p class="time">
                    <strong>今天 </strong>3:53 pm
                </p>
            </div>
        </li>
        <li class="current-user">
            <img width="30" height="30" src="images/avatar-female.jpg" />
            <div class="bubble">
                <a class="user-name" href="#">王晓</a>
                <p class="message">
                    hhhhh
                </p>
                <p class="time">
                    <strong>今天 </strong>3:53 pm
                </p>
            </div>
        </li>
        <li>
            <img width="30" height="30" src="images/avatar-male.jpg" />
            <div class="bubble">
                <a class="user-name" href="#">兰若</a>
                <p class="message">
                    iiiii
                </p>
                <p class="time">
                    <strong>今天 </strong>3:53 pm
                </p>
            </div>
        </li>
    </ul>

    <div class="navbar navbar-fixed-bottom">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="输入需要发送的信息…">
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit">发送</button>
            </span>
        </div>
    </div>
</div>

</body>
</html>
