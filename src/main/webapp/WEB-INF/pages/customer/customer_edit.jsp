<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>客户管理</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/icheck.css">
    <link rel="stylesheet" href="/static_resources/css/wiwork.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2">
            <a class="btn btn-primary navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>名片详情</h4>
        </div>
        <div class="col-xs-2">
            <button type="submit" class="btn btn-primary navbar-btn pull-right" onclick="document.form1.submit()">保存</button>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" role="form" action="/customer/save" method="post">
    <div class="panel-group" id="accordion">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapseMain">
                        个人信息
                    </a>
                </h4>
            </div>
            <div id="collapseMain" class="panel-collapse collapse in">
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">中文姓名</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="chineseName" value="${customer.chineseName}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">英文姓名</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="englishName" value="${customer.englishName}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">性别</label>
                    <div class="col-xs-4" style="margin-top: 4px">
                        <input type="radio" name="gender" id="optionsRadios1" value="male" checked>
                        <label for="optionsRadios1">男</label>
                    </div>
                    <div class="col-xs-4" style="margin-top: 4px">
                        <input type="radio" name="gender" id="optionsRadios2" value="female">
                        <label for="optionsRadios2">女</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapseOne">
                        关联项目
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">关联</label>
                    <div class="col-xs-8" style="text-align: left">
                        <a href="/customer/create/project"><img src="/static_resources/images/ic_input_add.png"/></a>
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">所处阶段</label>
                    <div class="col-xs-8">
                        <select class="form-control" name="discussStageId">
                            <option class="form-control" value="1">未洽谈</option>
                            <option class="form-control" value="2">洽谈中</option>
                            <option class="form-control" value="3">合作期</option>
                            <option class="form-control" value="4">其他</option>
                        </select>
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">客户价值</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="customerValue" value="${customer.customerValue}">
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapseTwo">
                        联系方式
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">手机号码</label>
                    <div class="col-xs-8">
                        <input type="number" class="form-control" name="phone" value="${customer.phone}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">微信号</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="wechatNum" value="${customer.wechatNum}}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">座机号码</label>
                    <div class="col-xs-8">
                        <input type="number" class="form-control" name="telephoneNum" value="${customer.phone}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">QQ号码</label>
                    <div class="col-xs-8">
                        <input type="number" class="form-control" name="qqNum" value="${customer.qqNum}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">电子邮箱</label>
                    <div class="col-xs-8">
                        <input type="email" class="form-control" name="email" value="${customer.email}">
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapseThree">
                        个性信息
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">生日</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="birthday" placeholder="MM/DD/YYYY" value="${customer.birthdayString}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">爱好</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="hobby" value="${customer.hobby}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="control-label" style="margin-left: 15px"><strong>是否设置节假日提醒</strong>
                        <input type="checkbox">
                    </label>
                </div>
            </div>
        </div>

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapseFour">
                        共享设置
                    </a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse in">
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">添加其他共享成员</label>
                    <div class="col-xs-8" style="text-align: left">
                        <a href="#"><img src="/static_resources/images/ic_input_add.png"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
<script src="/static_resources/js/icheck.min.js"></script>
<script>
    $(document).ready(function(){
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>
</html>
