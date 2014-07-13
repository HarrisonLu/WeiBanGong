<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>审批流</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-6 title-bar-col">
            <a href="/index"><img class="title-bar-image" src="/static_resources/images/bar_item_home.png"></a>
        </div>
        <div class="col-xs-6 title-bar-col">
            <a href="/approval/create"><img class="title-bar-image" src="/static_resources/images/bar_item_create.png"
                    ></a>
        </div>
        <%--<div class="col-xs-3 title-bar-col">--%>
        <%--<a href="/approval/draft"><img class="title-bar-image" src="/static_resources/images/bar_item_filter.png"--%>
        <%--></a>--%>
        <%--</div>--%>
        <%--<div class="col-xs-3 title-bar-col">--%>
        <%--<a href="/approval/archive"><img class="title-bar-image" src="/static_resources/images/bar_item_search.png"--%>
        <%--></a>--%>
        <%--</div>--%>
    </div>
</div>

<div class="panel-group">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseOne">
                    我的审批
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <c:if test="${empty myApprovals}">
                <div class="list-group-item" style="min-height: 100px">
                    <p style="text-align: center; color: #8E8E8E; margin-top: 30px">当前尚未提交任何审批申请</p>
                </div>
            </c:if>

            <c:forEach items="${myApprovals}" var="approval">
                <a href="/approval/info/${approval.id}" class="row list-group-item">
                    <div class="col-xs-4 title-bar-col">
                        <p>${approval.displaySubmitTime}</p>
                    </div>
                    <div class="col-xs-4 title-bar-col">
                        <p>${approval.approvalTypeName}</p>
                    </div>
                    <div class="col-xs-4 title-bar-col">
                        <p>${approval.approvalStageName}</p>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<div class="panel-group">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseTwo">
                    待审申请
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse in">
            <c:if test="${empty myWaitingApprovals}">
                <div class="list-group-item" style="min-height: 100px">
                    <p style="text-align: center; color: #8E8E8E; margin-top: 30px">未收到需审批申请</p>
                </div>
            </c:if>

            <c:forEach items="${myWaitingApprovals}" var="approval">
                <a href="/approval/info/add/${approval.id}" class="row list-group-item">
                    <div class="col-xs-4 title-bar-col">
                        <p>${approval.displaySubmitTime}</p>
                    </div>
                    <div class="col-xs-4 title-bar-col">
                        <p>${approval.approvalTypeName}</p>
                    </div>
                    <div class="col-xs-4 title-bar-col">
                        <p>${approval.approvalStageName}</p>
                    </div>
                </a>
            </c:forEach>

        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        if (localStorage[REFRESH_APPROVAL] == 1) {
            localStorage[REFRESH_APPROVAL] = 0;
            window.location.reload();
        }
    });
</script>
</body>
</html>
