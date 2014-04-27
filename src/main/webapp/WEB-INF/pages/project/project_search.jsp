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
        <div class="col-xs-2">
            <a class="btn btn-primary navbar-btn pull-left" role="button" onclick="history.go(-1)">返回</a>
        </div>
        <div class="col-xs-8 title-bar-text">
            <h4>搜索项目</h4>
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
        var projects;
        $('#project_search').typeahead({
            source: function (query, process) {
                var parameter = {query: query};
                $.post('/project/search', parameter, function (data) {
                    projects = data;
                    var results = _.map(data, function (project) {
                        return project.id + "";
                    });
                    process(results);
                });
            },

            matcher: function (item) {
                return true;
            },

            highlighter: function (id) {
                var project = _.find(projects, function (u) {
                    return u.id == id;
                })
                var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
                var item = '<div style="min-width: 200px">' + project.name
                item += '</div>'
                return item;
            },

            updater: function (id) {
                var project = _.find(projects, function (c) {
                    return c.id == id;
                })
                self.location = '/project/comment/' + id
                return project.name;
            }

        })
    })
</script>
</body>
</html>
