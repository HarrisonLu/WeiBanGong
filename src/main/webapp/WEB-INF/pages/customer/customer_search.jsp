<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <title>客户管理</title>
</head>
<body onload="document.getElementById('input_search').focus()">
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="javascript:history.go(-1)"><img class="title-bar-image"
                                                     src="/static_resources/images/btn_back.png"></a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>搜索客户</h4>
        </div>
    </div>
</div>

<div class="container">
    <div class="input-group" style="margin-top: 10px">
        <input id="input_search" type="text" class="form-control" placeholder="搜索" data-provide="typeahead">
        <span class="input-group-btn">
            <button class="btn btn-default" type="button" onclick="onSearch()">查找</button>
        </span>
    </div>
</div>

<div id="search_result" style="margin-top: 10px">
</div>

<script>
    $(document).ready(function () {
        var customers;
        $('#input_search').typeahead({
            source: function (query, process) {
                var parameter = {query: query};
                $.post('/customer/search', parameter, function (data) {
                    customers = data;
                    var results = _.map(data, function (customer) {
                        return customer.id + "";
                    });
                    process(results);
                });
            },

            matcher: function (item) {
                return true;
            },

            highlighter: function (id) {
                var customer = _.find(customers, function (u) {
                    return u.id == id;
                })
                var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
                var itemEnglishName = customer.englishName.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                    return '<span style="color:#79CDCD">' + match + '</span>'
                })
                var item = '<img style="margin-right: 8px; margin-top: 8px" class="pull-left" src="/static_resources/images/head.png">'
                item += '<div style="margin-top: 8px; min-width: 200px">' + itemEnglishName + '（' + customer.chineseName + ')'
                if (customer.projectName == null)
                    item += '<p>暂无关联项目</p>'
                else
                    item += '<p>' + customer.projectName + '</p>'
                item += '</div>'
                return item;
            },

            updater: function (id) {
                var customer = _.find(customers, function (c) {
                    return c.id == id;
                })
                self.location = '/customer/' + id
                return customer.englishName + '（' + customer.chineseName + '）';
            }

        })
    })

    function onSearch() {
        var query = $("#input_search").val();
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
                    html += "<a href='/customer/" + data[i].id + "' class='list-group-item'>" +
                            "<img class='pull-left' src='/static_resources/images/head.png' alt='' style='margin-left: 4px'>" +
                            "<h4 class='list-group-item-heading head-pic-text_'>" + data[i].englishName + " (" + data[i].chineseName + ")" + "</h4>" +
                            "<p class='list-group-item-text head-pic-text_ info-detail'>" + data[i].projectName + "</p>" +
                            "</a>";
                }
                $("#search_result").html(html);
            }
        });
    }
</script>
</body>
</html>
