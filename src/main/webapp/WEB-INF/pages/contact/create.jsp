<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%@ include file="../template/header.jsp" %>

<div class="container">
    <form class="form-horizontal" role="form" action="/index/contact/create" method="post">
        <h2 style="text-align:center">新建通讯录</h2>

        <div class="form-group">
            <label for="inputName" class="col-sm-4 control-label">姓名</label>

            <div class="col-sm-6">
                <input name="name" type="text" class="form-control" id="inputName" placeholder="" required autofocus>
            </div>
        </div>
        <div class="form-group">
            <label for="inputDepartment" class="col-sm-4 control-label">部门</label>

            <div class="col-sm-6">
                <input name="department" type="text" class="form-control" id="inputDepartment" placeholder="" required>
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail" class="col-sm-4 control-label">邮箱</label>

            <div class="col-sm-6">
                <input name="email" type="text" class="form-control" id="inputEmail" placeholder="" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-6">
                <button type="submit" class="btn btn-default btn-primary">新建</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
