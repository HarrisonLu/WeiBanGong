<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户管理</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/customer.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <div class="input-group">
        <span class="input-group-btn">
            <a class="btn btn-success" role="button" onclick="history.go(-1)">返回</a>
        </span>
        <input id="contacts_search" type="text" class="form-control" placeholder="输入中英文名搜索" data-provide="typeahead">
    </div>
</div>

</body>
</html>
