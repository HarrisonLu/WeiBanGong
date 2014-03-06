<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户管理</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/customer.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <div class="row title-bar">
        <div class="col-xs-2">
            <a class="btn btn-success navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8">
            <h4>新建客户</h4>
        </div>
        <div class="col-xs-2">
            <a href="#" class="btn btn-success navbar-btn pull-right" role="button">保存</a>
        </div>
    </div>

    <form name="form1" class="form-horizontal" role="form">
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
    </form>
</div>

<div class="panel-group" id="accordion">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseOne">
                    关联项目
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <form name="form2" class="form-horizontal">
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">关联项目</label>
                    <div class="col-xs-8">
                        <p class="form-control-static">选择</p>
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
            </form>
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
        <div id="collapseTwo" class="panel-collapse collapse in">
            <form name="form3" class="form-horizontal" role="form">
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">手机号码</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="mobilePhoneNum">
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
                        <input type="text" class="form-control" name="telephoneNum">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">QQ号码</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="qqNum">
                    </div>
                </div>
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">电子邮箱</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="email">
                    </div>
                </div>
            </form>
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
        <div id="collapseThree" class="panel-collapse collapse in">
            <form name="form4" class="form-horizontal" role="form">
                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">生日</label>
                    <div class="col-xs-8">

                    </div>
                </div>

                <div class="form-group list-group-item">
                    <label class="col-xs-4 control-label">爱好</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" name="hobby">
                    </div>
                </div>
            </form>
            <div class="checkbox">
                <label class="control-label">
                    是否设置节假日提醒
                    <input type="checkbox" class="pull-right" style="margin-right: 20px">
                </label>
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
            <div class="checkbox">
                <label class="control-label">
                    是否与项目（任务）成员共享客户信息
                    <input type="checkbox" class="pull-right" style="margin-right: 20px">
                </label>
            </div>

            <div>
                <label class="col-xs-6 control-label">添加其他共享成员</label>
                <div class="col-xs-6">
                    <p class="form-control-static">选择</p>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
