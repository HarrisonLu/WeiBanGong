<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>客户管理</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/wiwork.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2">
            <a class="btn btn-primary navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>搜索客户</h4>
        </div>
    </div>
</div>

<div class="container">
    <input id="project_search" type="text" class="form-control" placeholder="搜索" data-provide="typeahead"
           style="margin-top: 10px">
</div>
<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
<script src="/static_resources/js/bootstrap-typeahead.min.js"></script>
<script src="/static_resources/js/underscore-min.js"></script>
<script>
    $(document).ready(function () {
        var customers;
        $('#project_search').typeahead({
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
</script>
</body>
</html>
