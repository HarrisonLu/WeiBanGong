<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>客户管理</title>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" type="text/css" href="/static_resources/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static_resources/css/customer.css"/>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2">
            <a class="btn btn-success navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8">
            <h4>评论</h4>
        </div>
    </div>
</div>

<div class="list-group">
    <div class="list-group-item" style="min-height: 64px">
        <img class="pull-left" src="/static_resources/images/head.png" alt="">
        <h4 class="list-group-item-heading head-pic-text"><c:out value="${customer.chineseName}"/></h4>
        <p class="list-group-item-text head-pic-text"><c:out value="${customer.projectName}"/></p>
    </div>
</div>

<div class="container widget-content padded">
    <ul>
        <li>
            <img width="30" height="30" src="/static_resources/images/head.png" />
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
            <img width="30" height="30" src="/static_resources/images/head.png" />
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
            <img width="30" height="30" src="/static_resources/images/head.png" />
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
            <img width="30" height="30" src="/static_resources/images/head.png" />
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
            <img width="30" height="30" src="/static_resources/images/head.png" />
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
            <img width="30" height="30" src="/static_resources/images/head.png" />
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
            <img width="30" height="30" src="/static_resources/images/head.png" />
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
            <img width="30" height="30" src="/static_resources/images/head.png" />
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
            <img width="30" height="30" src="/static_resources/images/head.png" />
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
<script type="text/javascript" src="/static_resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
