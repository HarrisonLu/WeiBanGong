<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>项目管理</title>
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
            <a href="javascript: history.go(-1)"><img src="/static_resources/images/btn_back.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>添加项目成员</h4>
        </div>
    </div>
</div>

<div class="container">
    <div class="input-group" style="margin-top: 10px">
        <input id="project_create_search" type="text" class="form-control" placeholder="搜索">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" onclick="onSearch()">查找</button>
        </span>
    </div>
</div>

<div id="search_result" class="list-group" style="margin-top: 10px">
    <c:forEach items="${groupUsers}" var="user">
        <li class="list-group-item" style="min-height: 64px">
            <img class="pull-left" src="/static_resources/images/head.png" width="40" height="40">
            <input type="checkbox" id="manager_checked" value="false">
            <h4 class="list-group-item-heading head-pic-text"><c:out value="${user.englishName}"/> (<c:out
                    value="${user.chineseName}"/>)</h4>
            <c:forEach items="${user.groupList}" var="group">
                <p class="list-group-item-text head-pic-text"><c:out value="${group.departmentName}"/> - <c:out
                        value="${group.name}"/></p>
            </c:forEach>
        </li>
    </c:forEach>
</div>

<div class="container">
    <button type="submit" class="btn btn-primary btn-lg btn-block" onclick="onSave()" style="margin-top: 5px; margin-bottom: 5px">确定
    </button>
</div>

<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
<script src="/static_resources/js/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%'
        });
    });

    function onSave() {
        window.history.back();
    }

    function onSearch() {
        var query = $("#project_create_search").val();
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
                        html += "<li class='list-group-item' style='min-height: 64px'>" +
                                    "<img class='pull-left' src='/static_resources/images/head.png' alt='' style='margin-left: 4px'>" +
                                    "<input type='checkbox' id='manager_checked'>" +
                                    "<h4 class='list-group-item-heading head-pic-text_'>" + data[i].englishName + " (" + data[i].chineseName + ")" + "</h4>" +
                                    "<p class='list-group-item-text head-pic-text_'>" + "项目部" + "</p>" +
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