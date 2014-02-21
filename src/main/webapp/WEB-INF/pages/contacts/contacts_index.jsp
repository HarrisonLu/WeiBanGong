<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>通讯录</title>
    <link href="${pageContext.request.contextPath}/static_resources/css/index.css" rel="stylesheet">
</head>

<body>
<jsp:include page="../template/header.jsp"/>

<div class="container">
    <div class="input-group">
        <span class="input-group-btn">
            <a class="btn btn-default" href="/index" role="button">
                <span class="glyphicon glyphicon-chevron-left"></span>返回
            </a>
        </span>
        <input id="contacts_search" type="text" class="form-control" placeholder="输入中英文名搜索" data-provide="typeahead">
        <span class="input-group-btn">
            <a class="btn btn-default" href="#" role="button">
                <span class="glyphicon glyphicon-search"></span>搜索
            </a>
        </span>
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
                    <h4 class="list-group-item-heading"><c:out value="${myself.englishName}"/> (<c:out
                            value="${myself.chineseName}"/>)</h4>
                    <c:forEach items="${myself.groupList}" var="group">
                        <p class="list-group-item-text"><c:out value="${group.departmentName}"/> - <c:out value="${group.name}"/></p>
                    </c:forEach>
                </a>
                <c:forEach items="${users}" var="user">
                    <a href="/contacts/user/${user.id}" class="list-group-item">
                        <h4 class="list-group-item-heading"><c:out value="${user.englishName}"/> (<c:out
                                value="${user.chineseName}"/>)</h4>
                        <c:forEach items="${user.groupList}" var="group">
                            <p class="list-group-item-text"><c:out value="${group.departmentName}"/> - <c:out value="${group.name}"/></p>
                        </c:forEach>
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
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static_resources/js/bootstrap-typeahead.js"></script>
<script src="${pageContext.request.contextPath}/static_resources/js/underscore.js"></script>
<script type="text/javascript">

    $(document).ready(function($) {
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
                    console.log(results);
                });
            },

            matcher: function(item) {
                return true;
            },

            highlighter: function(id) {
                var user = _.find(users, function(u) {
                    return u.id == id;
                });
                var lighterItem = user.englishName + '（' + user.chineseName + '）';
                var groups = user.groupList;
                if (groups != null && groups.length>0) {
                    for (var i=0;i<groups.length;++i) {
                        lighterItem += '<p>' + groups[i].departmentName + ' - ' + groups[i].name + '</p>'
                    }
                }
                return lighterItem;
            },

            updater: function(id) {
                var user = _.find(users, function(u) {
                    return u.id == id;
                });
                self.location='/contacts/user/' + id;
                return user.englishName + '（' + user.chineseName + '）';
            }

        })
    })
</script>

</body>
</html>
