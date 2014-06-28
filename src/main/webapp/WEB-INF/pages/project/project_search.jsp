<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
</head>
<body onload="document.getElementById('project_search').focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
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

<script>
    function onSearch() {
        var query = $('#project_search').val();
        if (query == "") {
            toastr.warning("请输入搜索内容");
            return;
        }
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: {query: query},
            success: function (data) {
                if (data.length == 0) {
                    toastr.error("搜索不到结果");
                    return;
                }
                toastr.clear();
                var html = "";
                for (var i in data) {
                    html += "<a href='/project/detail/" + data[i].id + "' class='list-group-item' style='min-height: 64px'>" +
                            "<h4 class='list-group-item-heading'>" + data[i].name + "</h4>" +
                            "<p class='list-group-item-text info-detail'>" + data[i].info + "</p></a>";
                }
                $("#search_result").html(html);
            }
        });
    }
</script>
</body>
</html>
