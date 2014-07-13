<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>微办公</title>
</head>
<body>
<div class="container-fluid">
    <h4 style="text-align: center; margin-top: 20px">当前为管理员账户
        <hr>
        请先前往 <img src="/static_resources/images/ic_menu_admin.png" width="40" height="40"> 管理权限
        <hr>
        新建组织架构和成员
        <hr>
        再切换至成员账户查看
    </h4>
</div>

<div class="container" style="margin-top: 20px">
    <a href="javascript:history.go(-1)" class="btn btn-primary btn-lg btn-block btn-block-bottom" role="button">
        返回</a>
</div>

</body>
</html>
