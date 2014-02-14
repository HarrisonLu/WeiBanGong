<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/static_resources/css/index.css" rel="stylesheet">
</head>
<body>
<jsp:include page="template/header.jsp"/>

<div class="container">
    <ul id="menu" class="nav nav-pills">
        <li><a href="#" data-toggle="tab">动态<span class="badge">3</span></a></li>
        <li class="active"><a href="#" data-toggle="tab">办公</a></li>
    </ul>

    <div class="row">
        <div class="col-xs-4">
            <div class="media">
                <a href="#">
                    <img class="media-object" data-src="holder.js/60x60" alt="">
                </a>
                <div class="media-body">
                    项目管理
                </div>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="media">
                <a href="#">
                    <img class="media-object" data-src="holder.js/60x60" alt="">
                </a>
                <div class="media-body">
                    客户管理
                </div>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="media">
                <a href="#"><img class="media-object" data-src="holder.js/60x60" alt=""></a>
                <div class="media-body">
                    审批流
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-4">
            <div class="media">
                <a href="/contacts">
                    <img class="media-object" data-src="holder.js/60x60" alt="">
                </a>
                <div class="media-body">
                    通讯录
                </div>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="media">
                <a href="#">
                    <img class="media-object" data-src="holder.js/60x60" alt="">
                </a>
                <div class="media-body">
                    帮助
                </div>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="media">
                <a href="#">
                    <img class="media-object" data-src="holder.js/60x60" alt="">
                </a>
                <div class="media-body">
                    反馈
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-xs-4">
            <div class="media">
                <a href="#">
                    <img class="media-object" data-src="holder.js/60x60" alt="">
                </a>
                <div class="media-body">
                    共享平台
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>