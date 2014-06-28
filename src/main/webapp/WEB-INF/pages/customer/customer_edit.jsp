<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>客户管理</title>
</head>
<body onload="document.getElementById('chineseName').focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:onBack()"><img class="title-bar-image" src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>编辑客户</h4>
        </div>
        <div class="col-xs-2">
            <button type="submit" class="btn btn-primary navbar-btn pull-right" onclick="onCreate(CREATE_CUSTOMER)">保存
            </button>
        </div>
    </div>
</div>

<form class="form-horizontal">
    <div class="panel-group">
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
                        <input type="text" class="form-control" id="chineseName" value="${customer.chineseName}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">英文姓名</label>

                    <div class="col-xs-8">
                        <input type="text" class="form-control" id="englishName" value="${customer.englishName}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">性别</label>

                    <div class="col-xs-4" style="margin-top: 6px">
                        <input type="radio" name="gender" id="optionsRadios1" value="男" checked>
                        <label for="optionsRadios1">男</label>
                    </div>
                    <div class="col-xs-4" style="margin-top: 6px">
                        <input type="radio" name="gender" id="optionsRadios2" value="女">
                        <label for="optionsRadios2">女</label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="panel-group">
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

                <div class="list-group" id="project">
                </div>

                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">所处阶段</label>

                    <div class="col-xs-8">
                        <select class="form-control" id="stage">
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
                        <input type="text" class="form-control" id="customerValue" value="${customer.customerValue}">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="panel-group">
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
                        <input type="number" class="form-control" id="mobilePhoneNum"
                               value="${customer.mobilePhoneNum}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">微信号</label>

                    <div class="col-xs-8">
                        <input type="text" class="form-control" id="wechatNum" value="${customer.wechatNum}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">座机号码</label>

                    <div class="col-xs-8">
                        <input type="number" class="form-control" id="telephoneNum" value="${customer.telephoneNum}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">QQ号码</label>

                    <div class="col-xs-8">
                        <input type="number" class="form-control" id="qqNum" value="${customer.qqNum}">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">电子邮箱</label>

                    <div class="col-xs-8">
                        <input type="email" class="form-control" id="email" value="${customer.email}">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="panel-group">
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
                        <input type="text" id="birthday" class="form-control form_datetime"
                               value="${customer.birthdayString}" readonly>
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">爱好</label>

                    <div class="col-xs-8">
                        <input type="text" class="form-control" id="hobby" value="${customer.hobby}">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</form>

<script>
    $('.form_datetime').datetimepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
        minView: 2,
        startView: 4,
        pickerPosition: "bottom-left"
    });

    $(document).ready(function () {
        onCustomerCreateDocumentReady();
    });
</script>
</body>
</html>
