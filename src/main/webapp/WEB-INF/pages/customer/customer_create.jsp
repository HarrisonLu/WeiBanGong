<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <h4>新建客户</h4>
        </div>
        <div class="col-xs-2">
            <button type="submit" class="btn btn-success navbar-btn pull-right" onclick="document.form1.submit()">保存</button>
        </div>
    </div>
</div>

<form name="form1" class="form-horizontal" role="form" action="/customer/save" method="post">
    <div class="panel-group" id="accordion">
        <div class="panel panel-success">
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
                        <input type="text" class="form-control" name="chineseName">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">英文姓名</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="englishName">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">性别</label>
                    <div class="col-xs-4">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>男
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">女
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-success">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapseOne">
                        关联项目
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">关联项目</label>
                    <div class="col-xs-8" style="text-align: left">
                        <a href="/customer/create/project"><img src="/static_resources/images/ic_input_add.png"/></a>
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">所处阶段</label>
                    <div class="col-xs-8">
                        <select class="form-control">
                            <option>未洽谈</option>
                            <option>洽谈中</option>
                            <option>合作期</option>
                            <option>其他</option>
                        </select>
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">客户价值</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="value">
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-success">
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
                        <input type="number" class="form-control" name="mobilePhoneNum">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">微信号</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="wechatNum">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">座机号码</label>
                    <div class="col-xs-8">
                        <input type="number" class="form-control" name="telephoneNum">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">QQ号码</label>
                    <div class="col-xs-8">
                        <input type="number" class="form-control" name="qqNum">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">电子邮箱</label>
                    <div class="col-xs-8">
                        <input type="email" class="form-control" name="email">
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-success">
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
                        <input type="text" class="form-control" name="birthday">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">爱好</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="hobby">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <div class="checkbox">
                        <label class="control-label"><strong>是否设置节假日提醒</strong>
                            <input type="checkbox" class="pull-right" style="margin-right: 20px">
                        </label>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-success">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapseFour">
                        共享设置
                    </a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse in">
                <div class="form-group list-group-item">
                    <div class="checkbox">
                        <label class="control-label"><strong>是否与项目（任务）成员共享客户信息</strong>
                            <input type="checkbox" class="pull-right" style="margin-right: 20px">
                        </label>
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">添加其他共享成员</label>
                    <div class="col-xs-8" style="text-align: left">
                        <a href="/index"><img src="/static_resources/images/ic_input_add.png"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript" src="/static_resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/static_resources/js/bootstrap.min.js"></script>
</body>
</html>
