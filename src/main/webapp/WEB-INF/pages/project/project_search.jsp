<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>项目管理</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/wiwork.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="javascript:history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>搜索项目</h4>
        </div>
    </div>
</div>

<div class="container">
    <div class="input-group" style="margin-top: 10px">
        <input id="project_search" type="text" class="form-control" placeholder="搜索">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" onclick="onSearch()">查找</button>
        </span>
    </div>
</div>

<div id="search_result" style="margin-top: 10px">
</div>

<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
<script src="/static_resources/js/bootstrap-typeahead.min.js"></script>
<script src="/static_resources/js/underscore-min.js"></script>
<script>
    function onSearch() {
        var query = $("#project_search").val();
        if (query == "") {
            alert("请输入搜索内容")
        } else {
            $.ajax({
                type: "POST",
                url: encodeURI(encodeURI(window.location)),
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                data: {query: query},
                success: function (data) {
                    var html = "";
                    for (var i in data) {
                        html += "<a href='/project/comment/" + data[i].id + "' class='list-group-item' style='min-height: 64px'>" +
                                    "<h4 class='list-group-item-text'>" + data[i].name + "</h4>" +
                                "</a>";
                    }
                    $("#search_result").html(html);
                }
            });
        }
    }
</script>
</body>
</html>
