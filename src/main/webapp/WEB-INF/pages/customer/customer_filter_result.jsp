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
            <h4>筛选结果</h4>
        </div>
    </div>
</div>

<div class="panel-group" id="accordion">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseOne">
                    我的客户
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <c:forEach items="${myCustomerList}" var="customer">
                <a href="/customer/${customer.id}" class="list-group-item" style="min-height: 64px">
                    <c:if test="${customer.discussStageId == 1}">
                        <img class="pull-left" src="/static_resources/images/line_green.png" alt="">
                    </c:if>
                    <c:if test="${customer.discussStageId == 2}">
                        <img class="pull-left" src="/static_resources/images/line_yellow.png" alt="">
                    </c:if>
                    <c:if test="${customer.discussStageId == 3}">
                        <img class="pull-left" src="/static_resources/images/line_red.png" alt="">
                    </c:if>
                    <img class="pull-left" src="/static_resources/images/head.png" alt="" style="margin-left: 4px">
                    <h4 class="list-group-item-heading head-pic-text_"><c:out value="${customer.englishName}"/> (<c:out
                            value="${customer.chineseName}"/>)</h4>

                    <p class="list-group-item-text head-pic-text_"><c:out value="${customer.projectName}"/></p>
                </a>
            </c:forEach>

        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseTwo">
                    共享客户
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse in">
            <c:forEach items="${sharedCustomerList}" var="customer">
                <a href="/customer/${customer.id}" class="list-group-item" style="min-height: 64px">
                    <c:if test="${customer.discussStageId == 1}">
                        <img class="pull-left" src="/static_resources/images/line_green.png" alt="">
                    </c:if>
                    <c:if test="${customer.discussStageId == 2}">
                        <img class="pull-left" src="/static_resources/images/line_yellow.png" alt="">
                    </c:if>
                    <c:if test="${customer.discussStageId == 3}">
                        <img class="pull-left" src="/static_resources/images/line_red.png" alt="">
                    </c:if>
                    <img class="pull-left" src="/static_resources/images/head.png" alt="" style="margin-left: 4px">
                    <h4 class="list-group-item-heading head-pic-text_"><c:out value="${customer.englishName}"/> (<c:out
                            value="${customer.chineseName}"/>)</h4>

                    <p class="list-group-item-text head-pic-text_"><c:out value="${customer.projectName}"/></p>
                </a>
            </c:forEach>
        </div>
    </div>
</div>
<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
