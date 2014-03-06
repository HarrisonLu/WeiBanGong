<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>通讯录</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/contacts.css" rel="stylesheet">
</head>

<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <div class="input-group">
        <span class="input-group-btn">
            <a href="/index" class="btn btn-primary" role="button">返回</a>
        </span>
        <input id="contacts_search" type="text" class="form-control" placeholder="输入中英文名搜索" data-provide="typeahead">
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
            <a href="/contacts/user/${myself.id}" class="list-group-item">
                <img class="pull-left" src="/static_resources/images/head.png">
                <h4 class="list-group-item-heading head-pic-text"><c:out value="${myself.englishName}"/> (<c:out
                        value="${myself.chineseName}"/>)</h4>
                <c:forEach items="${myself.groupList}" var="group">
                    <p class="list-group-item-text head-pic-text"><c:out value="${group.departmentName}"/> - <c:out value="${group.name}"/></p>
                </c:forEach>
            </a>
            <c:forEach items="${users}" var="user">
                <a href="/contacts/user/${user.id}" class="list-group-item">
                    <img class="pull-left" src="/static_resources/images/head.png">
                    <h4 class="list-group-item-heading head-pic-text"><c:out value="${user.englishName}"/> (<c:out
                            value="${user.chineseName}"/>)</h4>
                    <c:forEach items="${user.groupList}" var="group">
                        <p class="list-group-item-text head-pic-text"><c:out value="${group.departmentName}"/> - <c:out value="${group.name}"/></p>
                    </c:forEach>
                    <c:if test="${user.groupList.size() == 0}">
                        <p id="user_text" class="list-group-item-text head-pic-text">暂无分组</p>
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
                <a href="/contacts/department/${department.id}" class="list-group-item">
                    <p class="list-group-item-text"><c:out value="${department.name}"/></p>
                </a>
            </c:forEach>
            <c:if test="${departments.size() == 0}">
                <p class="list-group-item">暂无分组</p>
            </c:if>
        </div>
    </div>
</div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/js/bootstrap-typeahead.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>
<script type="text/javascript">
    if(window.name != "Contacts") {
        location.reload();
        window.name = "Contacts";
    } else {
        window.name = "";
    }

    $(document).ready(function() {
        var users;
        $('#contacts_search').typeahead({
            source:function(query, process) {
                var parameter = {query: query};
                $.post('/contacts/search', parameter, function (data) {
                    users = data;
                    var results = _.map(data, function(user) {
                        return user.id + "";
                    });
                    process(results);
                });
            },

            matcher: function(item) {
                return true;
            },

            highlighter: function(id) {
                var user = _.find(users, function(u) {
                    return u.id == id;
                })
                var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
                var itemEnglishName = user.englishName.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                    return '<span style="color:#79CDCD">' + match + '</span>'
                })
                var item = '<img style="margin-right: 8px; margin-top: 8px" class="pull-left" src="/static_resources/images/head.png">'
                item += '<div style="margin-top: 8px; min-width: 150px">' + itemEnglishName + '（' + user.chineseName + ')'
                var groups = user.groupList
                if (groups != null && groups.length>0) {
                    for (var i=0;i<groups.length;++i) {
                        item += '<p>' + groups[i].departmentName + ' - ' + groups[i].name + '</p>'
                    }
                } else {
                    item += '<p>暂无分组<p/>'
                }
                item += '</div>'
                return item;
            },

            updater: function(id) {
                var user = _.find(users, function(u) {
                    return u.id == id;
                })
                self.location='/contacts/user/' + id
                return user.englishName + '（' + user.chineseName + '）';
            }

        })
    })
</script>

</body>
</html>
