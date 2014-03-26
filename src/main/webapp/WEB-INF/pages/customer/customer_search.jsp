<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户管理</title>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1"/>
    <link rel="stylesheet" type="text/css" href="/static_resources/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static_resources/css/customer.css"/>
</head>
<body>
<div class="container">
    <div class="input-group">
        <span class="input-group-btn">
            <a class="btn btn-success" role="button" onclick="history.go(-1)">返回</a>
        </span>
        <input id="customer_search" type="text" class="form-control" placeholder="输入中英文名搜索" data-provide="typeahead">
    </div>
</div>
<script type="text/javascript" src="/static_resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/static_resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static_resources/js/bootstrap-typeahead.min.js"></script>
<script type="text/javascript" src="/static_resources/js/underscore-min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        var customers;
        $('#customer_search').typeahead({
            source:function(query, process) {
                var parameter = {query: query};
                $.post('/customer/search', parameter, function (data) {
                    customers = data;
                    var results = _.map(data, function(customer) {
                        return customer.id + "";
                    });
                    process(results);
                });
            },

            matcher: function(item) {
                return true;
            },

            highlighter: function(id) {
                var customer = _.find(customers, function(u) {
                    return u.id == id;
                })
                var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
                var itemEnglishName = customer.englishName.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                    return '<span style="color:#79CDCD">' + match + '</span>'
                })
                var item = '<img style="margin-right: 8px; margin-top: 8px" class="pull-left" src="/static_resources/images/head.png">'
                item += '<div style="margin-top: 8px; min-width: 150px">' + itemEnglishName + '（' + customer.chineseName + ')'
                item += '<p>' + customer.projectName + '</p>'
                item += '</div>'
                return item;
            },

            updater: function(id) {
                var customer = _.find(customers, function(c) {
                    return c.id == id;
                })
                self.location='/customer/' + id
                return customer.englishName + '（' + customer.chineseName + '）';
            }

        })
    })
</script>
</body>
</html>
