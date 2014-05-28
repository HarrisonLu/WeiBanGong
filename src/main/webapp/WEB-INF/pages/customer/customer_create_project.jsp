<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>选择项目</h4>
        </div>
        <div class="col-xs-2">
            <a href="#" class="btn btn-primary navbar-btn pull-right" role="button">保存</a>
        </div>
    </div>
</div>

<div class="container">
    <div class="input-group" style="margin-top: 10px">
        <input id="customer_create_search" type="text" class="form-control" placeholder="搜索">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" onclick="onSearch()">查找</button>
        </span>
    </div>
</div>

<div id="search_result" class="list-group" style="margin-top: 10px">

</div>

<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
<script src="/static_resources/js/icheck.min.js"></script>
<script>
    function onSearch() {
        var query = $("#customer_create_search").val();
        if (query == "") {
            alert("请输入搜索内容")
        } else {
            $.ajax({
                type: "POST",
                url: encodeURI(encodeURI(window.location)),
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                data: {query: query},
                success: function (data) {
                    console.log(data);
                    var html = "";
                    for (var i in data) {
                        html += "<li class='list-group-item' style='min-height: 64px'>" +
                                    "<input type='checkbox' id='manager_checked'>" +
                                    "<h4 class='list-group-item-text'>" + data[i].name + "</h4>" +
                                "</li>";
                    }
                    $("#search_result").html(html);
                    $('input').iCheck({
                        checkboxClass: 'icheckbox_square-blue',
                        radioClass: 'iradio_square-blue',
                        increaseArea: '20%'
                    });
                }
            });
        }
    }
</script>
</body>
</html>
