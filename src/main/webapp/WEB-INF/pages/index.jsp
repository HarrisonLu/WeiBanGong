<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/static_resources/css/index.css" rel="stylesheet">
</head>
<body>
<jsp:include page="template/header.jsp"/>

<div class="btn-group btn-group-justified" data-toggle="buttons">
    <label class="btn btn-default">
        <input type="radio" name="options" id="option1">动态
    </label>
    <label class="btn btn-default">
        <input type="radio" name="options" id="option2">办公
    </label>
</div>

<div class="container">
    <%--<ul class="nav nav-pills">--%>
    <%--<li><a href="#" data-toggle="tab">动态<span class="badge">3</span></a></li>--%>
    <%--<li class="active"><a href="#" data-toggle="tab">办公</a></li>--%>
    <%--</ul>--%>

    <div class="row">
        <div class="col-xs-4">
            <div align="center" class="media">
                <a href="#"><img class="media-object" data-src="holder.js/60x60" alt=""></a>
                <div class="media-body">项目管理</div>
            </div>
        </div>
        <div class="col-xs-4">
            <div align="center" class="media">
                <a href="#"><img class="media-object" data-src="holder.js/60x60" alt=""></a>
                <div class="media-body">客户管理</div>
            </div>
        </div>
        <div class="col-xs-4">
            <div align="center" class="media">
                <a href="#"><img class="media-object" data-src="holder.js/60x60" alt=""></a>
                <div class="media-body">审批流</div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-4">
            <div align="center" class="media">
                <a href="/contacts"><img class="media-object" data-src="holder.js/60x60" alt=""></a>
                <div class="media-body">通讯录</div>
            </div>
        </div>
        <div class="col-xs-4">
            <div align="center" class="media">
                <a href="#"><img class="media-object" data-src="holder.js/60x60" alt=""></a>
                <div class="media-body">帮助</div>
            </div>
        </div>
        <div class="col-xs-4">
            <div align="center" class="media">
                <a href="#"><img class="media-object" data-src="holder.js/60x60" alt=""></a>
                <div class="media-body">反馈</div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-xs-4">
            <div align="center" class="media">
                <a href="#"><img class="media-object" data-src="holder.js/60x60" alt=""></a>
                <div class="media-body">共享平台</div>
            </div>
        </div>
    </div>
</div>

</body>
</html>