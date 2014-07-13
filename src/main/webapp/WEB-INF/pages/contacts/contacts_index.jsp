<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../template/header.jsp"/>
<html>
<head>
    <title>通讯录</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid title-bar">
        <div class="col-xs-2 title-bar-btn">
            <a href="/index"><img class="title-bar-image" src="/static_resources/images/bar_item_home.png"></a>
        </div>
        <div class="col-xs-10" style="margin-top: 10px">
            <input id="contacts_search" type="text" class="form-control" placeholder="输入中英文名搜索"
                   data-provide="typeahead">
        </div>
    </div>
</div>

<div class="panel-group">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseOne">
                    收藏联系人
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <a href="/contacts/user/${user.id}" class="list-group-item list-group-item-higher">
                <img class="pull-left head-pic" src="/static_resources/images/head.png">

                <h4 class="list-group-item-heading head-pic-text">${user.englishName} (${user.chineseName})</h4>
                <c:forEach items="${user.groupList}" var="group">
                    <p class="list-group-item-text head-pic-text info-detail">${group.departmentName}
                        - ${group.name}</p>
                </c:forEach>
                <c:if test="${user.groupList.size() == 0}">
                    <p class="list-group-item-text head-pic-text info-detail">暂无分组</p>
                </c:if>
            </a>

            <div id="coll_users">
                <c:forEach items="${collUsers}" var="user">
                    <a href="/contacts/user/${user.id}" class="list-group-item list-group-item-higher">
                        <img class="pull-left head-pic" src="/static_resources/images/head.png">

                        <h4 class="list-group-item-heading head-pic-text">${user.englishName} (${user.chineseName})</h4>
                        <c:forEach items="${user.groupList}" var="group">
                            <p class="list-group-item-text head-pic-text info-detail">${group.departmentName}
                                - ${group.name}</p>
                        </c:forEach>
                        <c:if test="${user.groupList.size() == 0}">
                            <p class="list-group-item-text head-pic-text info-detail">暂无分组</p>
                        </c:if>
                    </a>
                </c:forEach>
            </div>

        </div>
    </div>
</div>

<div class="panel-group">
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
                <a href="/contacts/department/${department.id}" class="list-group-item list-group-item-higher">
                    <img class="pull-left head-pic-small" src="/static_resources/images/btn_head.png">
                    <h4 class="list-group-item-text head-pic-text">${department.name}</h4>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        if (localStorage[REFRESH_CONTACTS] == 1) {
            localStorage[REFRESH_CONTACTS] = 0;
            window.location.reload();
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

    function onCollectionUpdate() {
        $.ajax({
            type: "GET",
            url: encodeURI(encodeURI("/contacts/collection")),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            cache: false,
            success: function (data) {
                var html = "";
                for (var i in data) {
                    html += "<a href='/contacts/user/" + data[i].id + "' class='list-group-item list-group-item-higher'>" +
                            "<img class='pull-left head-pic' src='/static_resources/images/head.png'>" +
                            "<h4 class='list-group-item-heading head-pic-text'>" + data[i].englishName + " (" + data[i].chineseName + ")" + "</h4>";
                    var groups = data[i].groupList;
                    for (var j in groups) {
                        html += "<p class='list-group-item-text head-pic-text info-detail'>" + groups[j].departmentName + " - " + groups[j].name + "</p>";
                    }
                    if (groups.length == 0) {
                        html += "<p class='list-group-item-text head-pic-text info-detail'>暂无分组</p>";
                    }
                    html += "</a>";
                }
                $("#coll_users").html(html);
            }
        });
    }
</script>

</body>
</html>
