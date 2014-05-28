<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>通讯录</title>
    <meta http-equiv="Content-type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/static_resources/css/bootstrap.css">
    <link rel="stylesheet" href="/static_resources/css/wiwork.css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar" style="min-height: 50px">
        <div class="col-xs-2" style="margin-top: 6px">
            <a href="/index"><img src="/static_resources/images/btn_home.png" width="40" height="40"></a>
        </div>
        <div class="col-xs-10" style="margin-top: 9px">
            <input id="contacts_search" type="text" class="form-control" placeholder="输入中英文名搜索"
                   data-provide="typeahead">
        </div>
    </div>
</div>

<div class="panel-group" id="accordion">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseOne">
                    常用联系人
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <a href="/contacts/user/${self.id}" class="list-group-item" style="min-height: 64px">
                <img class="pull-left" src="/static_resources/images/head.png" width="40" height="40">

                <h4 class="list-group-item-heading head-pic-text"><c:out value="${self.englishName}"/> (<c:out
                        value="${self.chineseName}"/>)</h4>

                <c:forEach items="${self.groupList}" var="group">
                    <p class="list-group-item-text head-pic-text"><c:out value="${group.departmentName}"/> - <c:out
                            value="${group.name}"/></p>
                </c:forEach>
                <c:if test="${self.groupList.size() == 0}">
                    <p class="list-group-item-text head-pic-text">暂无分组</p>
                </c:if>

            </a>

            <c:forEach items="${groupUsers}" var="user">
                <a href="/contacts/user/${user.id}" class="list-group-item" style="min-height: 64px">
                    <img class="pull-left" src="/static_resources/images/head.png" width="40" height="40">

                    <h4 class="list-group-item-heading head-pic-text"><c:out value="${user.englishName}"/> (<c:out
                            value="${user.chineseName}"/>)</h4>
                    <c:forEach items="${user.groupList}" var="group">
                        <p class="list-group-item-text head-pic-text"><c:out value="${group.departmentName}"/> - <c:out
                                value="${group.name}"/></p>
                    </c:forEach>
                    <c:if test="${user.groupList.size() == 0}">
                        <p class="list-group-item-text head-pic-text">暂无分组</p>
                    </c:if>
                </a>
            </c:forEach>

            <c:forEach items="${collUsers}" var="user">
                <a href="/contacts/user/${user.id}" class="list-group-item" style="min-height: 64px">
                    <img class="pull-left" src="/static_resources/images/head.png" width="40" height="40">

                    <h4 class="list-group-item-heading head-pic-text"><c:out value="${user.englishName}"/> (<c:out
                            value="${user.chineseName}"/>)</h4>
                    <c:forEach items="${user.groupList}" var="group">
                        <p class="list-group-item-text head-pic-text"><c:out value="${group.departmentName}"/> - <c:out
                                value="${group.name}"/></p>
                    </c:forEach>
                    <c:if test="${user.groupList.size() == 0}">
                        <p class="list-group-item-text head-pic-text">暂无分组</p>
                    </c:if>
                </a>
            </c:forEach>

        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseTwo">
                    组织架构
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse in">
            <c:forEach items="${departments}" var="department">
                <a href="/contacts/department/${department.id}" class="list-group-item" style="min-height: 64px">
                    <img class="pull-left" src="/static_resources/images/btn_head.png" width="35" height="35" style="margin-top: 4px">
                    <h4 class="list-group-item-text head-pic-text"><c:out value="${department.name}"/></h4>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<script src="/static_resources/js/jquery.min.js"></script>
<script src="/static_resources/js/bootstrap.min.js"></script>
<script src="/static_resources/js/bootstrap-typeahead.min.js"></script>
<script src="/static_resources/js/underscore-min.js"></script>
<script>
    $(document).ready(function () {
        if (window.name != "Contacts") {
            location.reload(false);
            window.name = "Contacts";
        } else {
            window.name = "";
        }

        var users;
        $("#contacts_search").typeahead({
            source: function (query, process) {
                var parameter = {query: query};
                $.post("/contacts/search", parameter, function (data) {
                    users = data;
                    var results = _.map(data, function (user) {
                        return user.id + "";
                    });
                    process(results);
                });
            },

            matcher: function (item) {
                return true;
            },

            highlighter: function (id) {
                var user = _.find(users, function (u) {
                    return u.id == id;
                })
                var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, "\\$&")
                var itemEnglishName = user.englishName.replace(new RegExp("(" + query + ")", "ig"), function ($1, match) {
                    return '<span style="color:#79CDCD">' + match + '</span>'
                })
                var item = '<img style="margin-right: 8px; margin-top: 8px" class="pull-left" src="/static_resources/images/head.png">'
                item += '<div style="margin-top: 8px; min-width: 200px">' + itemEnglishName + '（' + user.chineseName + ')'
                var groups = user.groupList
                if (groups != null && groups.length > 0) {
                    for (var i = 0; i < groups.length; ++i) {
                        item += '<p>' + groups[i].departmentName + ' - ' + groups[i].name + '</p>'
                    }
                } else {
                    item += '<p>暂无分组<p/>'
                }
                item += '</div>'
                return item;
            },

            updater: function (id) {
                var user = _.find(users, function (u) {
                    return u.id == id;
                })
                self.location = '/contacts/user/' + id
                return user.englishName + '（' + user.chineseName + '）';
            }

        });
    });
</script>

</body>
</html>
