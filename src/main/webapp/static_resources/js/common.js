toastr.options = {
    "closeButton": false,
    "debug": false,
    "positionClass": "toast-bottom-full-width",
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "2000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
}

var SEARCH_USER = 1;
var SEARCH_CUSTOMER = 2;
var SEARCH_PROJECT = 3;
var SEARCH_APPROVER_FIRST = 4;
var SEARCH_APPROVER_SECOND = 5;

var STORAGE_MANAGER = 10;
var STORAGE_MEMBER = 11;
var STORAGE_CUSTOMER = 12;
var STORAGE_PROJECT = 13;
var STORAGE_APPROVER_FIRST = 14;
var STORAGE_APPROVER_SECOND = 15;
var STORAGE_ARRAY = [STORAGE_MANAGER, STORAGE_MEMBER, STORAGE_CUSTOMER];

var CREATE_PROJECT = 20;
var CREATE_MODULE = 21;
var CREATE_TASK = 22;
var CREATE_CUSTOMER = 23;

var REFRESH_PROJECT = 30;
var REFRESH_MODULE = 31;
var REFRESH_TASK = 32;
var REFRESH_CUSTOMER = 33
var REFRESH_USER = 34;
var REFRESH_CONTACTS = 35;
var REFRESH_APPROVAL = 36;

function iCheckUpdate() {
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%'
    });
}

function onSearch(type) {
    var query = $("#input_search").val();
    if (query == "") {
        toastr.warning("请输入搜索内容")
        return;
    }
    toastr.info("正在搜索，请稍候");

    if (type == SEARCH_USER) {
        ajaxSearchUser(query);
    } else if (type == SEARCH_CUSTOMER) {
        ajaxSearchCustomer(query);
    } else if (type == SEARCH_PROJECT) {
        ajaxSearchProject(query);
    } else if (type == SEARCH_APPROVER_FIRST || type == SEARCH_APPROVER_SECOND) {
        ajaxSearchApprover(query);
    }
}

function ajaxSearchUser(query) {
    $.ajax({
        type: "POST",
        url: encodeURI(encodeURI("/project/create/user")),
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        data: {query: query},
        success: function (data) {
            if (data.length == 0) {
                toastr.error("搜索不到结果");
                $("#search_result").html("");
                return;
            }
            toastr.clear();
            var html = "";
            for (var i in data) {
                html += "<li class='list-group-item' style='min-height: 64px'>" +
                    "<img class='pull-left' src='/static_resources/images/head.png' alt='' style='margin-left: 4px'>" +
                    "<h4 class='list-group-item-heading head-pic-text_'>" + data[i].englishName + " (" + data[i].chineseName + ")" +
                    "<input type='checkbox' id=" + data[i].id + " value='" + data[i].englishName + " (" + data[i].chineseName + ")'></h4>";
                var groups = data[i].groupList;
                for (var j in groups) {
                    html += "<p class='list-group-item-text head-pic-text_ info-detail'>" + groups[j].departmentName + " - " + groups[j].name + "</p>";
                }
                if (groups.length == 0) {
                    html += "<p class='list-group-item-text head-pic-text_ info-detail'>暂无分组</p>";
                }
                html += "</li>";
            }
            $("#search_result").html(html);
            iCheckUpdate();
        }
    });
}

function ajaxSearchCustomer(query) {
    $.ajax({
        type: "POST",
        url: encodeURI(encodeURI("/project/create/customer")),
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
                html += "<li class='list-group-item' style='min-height: 64px'>" +
                    "<img class='pull-left' src='/static_resources/images/head.png' alt='' style='margin-left: 4px'>" +
                    "<h4 class='list-group-item-text head-pic-text_'>" + data[i].englishName + " (" + data[i].chineseName + ")" +
                    "<input type='checkbox' id=" + data[i].id + " value='" + data[i].englishName + " (" + data[i].chineseName + ")'></h4></li>";
            }
            $("#search_result").html(html);
            iCheckUpdate();
        }
    });
}
function ajaxSearchProject(query) {
    $.ajax({
        type: "POST",
        url: encodeURI(encodeURI(window.location)),
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        data: {query: query},
        success: function (data) {
            if (data.length == 0) {
                toastr.error("搜索不到结果");
                $("#search_result").html("");
                return;
            }
            toastr.clear();
            var html = "";
            for (var i in data) {
                html += "<li class='list-group-item' style='min-height: 64px'>" +
                    "<h4 class='list-group-item-text'>" + data[i].name +
                    "<input type='radio' name='project_info' id=" + data[i].id + " value='" + data[i].name + "'></h4></li>";
            }
            $("#search_result").html(html);
            iCheckUpdate();
        }
    });
}

function ajaxSearchApprover(query) {
    $.ajax({
        type: "POST",
        url: encodeURI(encodeURI("/project/create/user")),
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        data: {query: query},
        success: function (data) {
            if (data.length == 0) {
                toastr.error("搜索不到结果");
                $("#search_result").html("");
                return;
            }
            toastr.clear();
            var html = "";
            for (var i in data) {
                html += "<li class='list-group-item' style='min-height: 64px'>" +
                    "<img class='pull-left' src='/static_resources/images/head.png' alt='' style='margin-left: 4px'>" +
                    "<h4 class='list-group-item-heading head-pic-text_'>" + data[i].englishName + " (" + data[i].chineseName + ")" +
                    "<input type='radio' name='approver_info' id=" + data[i].id + " value='" + data[i].englishName + " (" + data[i].chineseName + ")'></h4>";
                var groups = data[i].groupList;
                for (var j in groups) {
                    html += "<p class='list-group-item-text head-pic-text_ info-detail'>" + groups[j].departmentName + " - " + groups[j].name + "</p>";
                }
                if (groups.length == 0) {
                    html += "<p class='list-group-item-text head-pic-text_ info-detail'>暂无分组</p>";
                }
                html += "</li>";
            }
            $("#search_result").html(html);
            iCheckUpdate();
        }
    });
}


// ==========================================================================================

function onProjectCreateDocumentReady() {
    for (var i in STORAGE_ARRAY) {
        var list = localStorage[STORAGE_ARRAY[i]];
        console.log(list);
        if (list != null) {
            var items = JSON.parse(list);
            var html = "";
            if (i == 0) {
                $.each(items, function (i, item) {
                    html += "<a href='/contacts/user/" + item.uid + "' class='list-group-item' style='min-height: 20px'>" + item.name + "</a>";
                });
                $("#manager").append(html);
            } else if (i == 1) {
                $.each(items, function (i, item) {
                    html += "<a href='/contacts/user/" + item.uid + "' class='list-group-item' style='min-height: 20px'>" + item.name + "</a>";
                });
                $("#member").append(html);
            } else if (i == 2) {
                $.each(items, function (i, item) {
                    html += "<a href='/customer/" + item.uid + "' class='list-group-item' style='min-height: 20px'>" + item.name + "</a>";
                });
                $("#customer").append(html);
            }

        }
    }
}

function onCustomerCreateDocumentReady() {
    iCheckUpdate();
    var item = localStorage[STORAGE_PROJECT];
    if (item != null) {
        item = JSON.parse(item);
        var html = "<a href='/project/detail/" + item.pid + "' class='list-group-item' style='min-height: 20px'>" + item.name + "</a>";
        $("#project").append(html);
    }
}

function onClearStorage() {
    for (var i in STORAGE_ARRAY) {
        if (localStorage[STORAGE_ARRAY[i]] != null) {
            localStorage.removeItem(STORAGE_ARRAY[i]);
        }
    }
    if (localStorage[STORAGE_PROJECT] != null) {
        localStorage.removeItem(STORAGE_PROJECT);
    }
    if (localStorage[STORAGE_APPROVER_FIRST] != null) {
        localStorage.removeItem(STORAGE_APPROVER_FIRST);
    }
    if (localStorage[STORAGE_APPROVER_SECOND] != null) {
        localStorage.removeItem(STORAGE_APPROVER_SECOND);
    }
}

function onBack() {
    onClearStorage();
    window.history.back();
}

function onSave(type) {
    if (type == STORAGE_PROJECT) {
        var input = document.getElementsByTagName('input');
        for (i = 0; i < input.length; i++) {
            if (input[i].type == 'radio' && input[i].checked) {
                var pId = input[i].id;
                var pName = input[i].value;
                var pInfo = {pid: pId, name: pName};
            }
        }
        localStorage[STORAGE_PROJECT] = JSON.stringify(pInfo);
    } else if (type == STORAGE_APPROVER_FIRST) {
        var input = document.getElementsByTagName('input');
        for (i = 0; i < input.length; i++) {
            if (input[i].type == 'radio' && input[i].checked) {
                var uId = input[i].id;
                var uName = input[i].value;
                var uInfo = {uid: uId, name: uName};
            }
        }
        localStorage[STORAGE_APPROVER_FIRST] = JSON.stringify(uInfo);
    } else if (type == STORAGE_APPROVER_SECOND) {
        var input = document.getElementsByTagName('input');
        for (i = 0; i < input.length; i++) {
            if (input[i].type == 'radio' && input[i].checked) {
                var uId = input[i].id;
                var uName = input[i].value;
                var uInfo = {uid: uId, name: uName};
            }
        }
        localStorage[STORAGE_APPROVER_SECOND] = JSON.stringify(uInfo);
    } else {
        var list = document.getElementById("search_result");
        var items = list.getElementsByTagName("input");
        var names = [];
        var k = 0;
        $.each(items, function (i, item) {
            if (item.checked == true) {
                names[k++] = {uid: item.id, name: item.value};
            }
        });
        localStorage[type] = JSON.stringify(names);
    }
    window.history.back();
}

function onCreate(type) {
    var name = "";
    if (type == CREATE_PROJECT) {
        name = $('#project_name').val();
        if (name == "") {
            toastr.warning("请输入项目名称");
            return;
        }
    } else if (type == CREATE_MODULE) {
        name = $('#module_name').val();
        if (name == "") {
            toastr.warning("请输入模块名称");
            return;
        }
    } else if (type == CREATE_TASK) {
        name = $('#task_name').val();
        if (name == "") {
            toastr.warning("请输入任务名称");
            return;
        }
    } else if (type == CREATE_CUSTOMER) {
        var chineseName = $("#chineseName").val();
        if (chineseName == "") {
            toastr.warning("请输入客户姓名");
            return;
        }
    }
    toastr.info("正在保存，请稍候");

    var managerIds = [];
    var memberIds = [];
    var customerIds = [];

    var managers = localStorage[STORAGE_MANAGER];
    if (managers != null) {
        var items = JSON.parse(managers);
        $.each(items, function (i, item) {
            managerIds[i] = item.uid;
        });
    }

    var members = localStorage[STORAGE_MEMBER];
    if (members != null) {
        var items = JSON.parse(members);
        $.each(items, function (i, item) {
            memberIds[i] = item.uid;
        });
    }

    var customers = localStorage[STORAGE_CUSTOMER];
    if (customers != null) {
        var items = JSON.parse(customers);
        $.each(items, function (i, item) {
            customerIds[i] = item.uid;
        });
    }

    if (type == CREATE_PROJECT) {
        var project_info = $('#project_info').val();
        var project_stage = $('#project_stage').val();
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            data: {name: name,
                info: project_info,
                stageId: project_stage,
                managerIds: JSON.stringify(managerIds),
                memberIds: JSON.stringify(memberIds),
                customerIds: JSON.stringify(customerIds)},
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                toastr.success("保存成功");
                onClearStorage();
                localStorage[REFRESH_PROJECT] = 1;
                window.history.back();
            }
        });
    } else if (type == CREATE_MODULE) {
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            data: {name: name,
                managerIds: JSON.stringify(managerIds),
                memberIds: JSON.stringify(memberIds),
                customerIds: JSON.stringify(customerIds)},
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                toastr.success("保存成功");
                onClearStorage();
                localStorage[REFRESH_MODULE] = 1;
                window.history.back();
            }
        });
    } else if (type == CREATE_TASK) {
        var task_priority = $('#task_priority').val();
        var task_stage = $('#task_stage').val();
        var task_deadline = $('#task_deadline').val();
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            data: {name: name,
                priorityId: task_priority,
                stageId: task_stage,
                deadline: task_deadline,
                managerIds: JSON.stringify(managerIds),
                memberIds: JSON.stringify(memberIds),
                customerIds: JSON.stringify(customerIds)},
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                toastr.success("保存成功");
                onClearStorage();
                localStorage[REFRESH_TASK] = 1;
                window.history.back();
            }
        });
    } else if (type == CREATE_CUSTOMER) {
        var englishName = $('#englishName').val();
        var gender = $("input[name='gender']:checked").val();
        var stageElement = document.getElementById("stage");
        var stage = stageElement.options[stageElement.selectedIndex].value;
        var customerValue = $('#customerValue').val();
        var mobilePhoneNum = $('#mobilePhoneNum').val();
        var wechatNum = $('#wechatNum').val();
        var telephoneNum = $('#telephoneNum').val();
        var qqNum = $('#qqNum').val();
        var email = $('#email').val();
        var birthday = $('#birthday').val();
        var hobby = $('#hobby').val();
        var projectId = "";
        var project_info = localStorage[STORAGE_PROJECT];
        if (project_info != null) {
            var item = JSON.parse(project_info);
            projectId = item.pid;
        }

        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            data: {
                chineseName: chineseName,
                englishName: englishName,
                gender: gender,
                stage: stage,
                customerValue: customerValue,
                mobilePhoneNum: mobilePhoneNum,
                telephoneNum: telephoneNum,
                wechatNum: wechatNum,
                qqNum: qqNum,
                email: email,
                stage: stage,
                birthday: birthday,
                hobby: hobby,
                projectId: projectId
            },
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                toastr.success("保存成功");
                onClearStorage();
                localStorage[REFRESH_CUSTOMER] = 1;
                window.history.back();
            }
        });
    }
}

function onAccountLogout() {
    $.ajax({
        type: "POST",
        url: encodeURI(encodeURI("/logout")),
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        success: function () {
            toastr.success("退出成功");
            setTimeout("window.location.href='/login'", 1000);
        }
    });
}

// 审批
function onApprovalCreateInit() {
    $('.form_datetime').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        autoclose: true,
        todayBtn: true
    });

    var item_first = localStorage[STORAGE_APPROVER_FIRST];
    if (item_first != null) {
        item_first = JSON.parse(item_first);
        document.getElementById("firstApprover").value = item_first.name;
    }

    var item_second = localStorage[STORAGE_APPROVER_SECOND];
    if (item_second != null) {
        item_second = JSON.parse(item_second);
        document.getElementById("secondApprover").value = item_second.name;
    }
}

function onCreateApply() {
    var type = $('#type').val();
    var reason = $('#reason').val();
    var startTime = $('#startTime').val();
    var endTime = $('#endTime').val();
    var departure = $('#departure').val();
    var destination = $('#destination').val();
    var amount = $('#amount').val();

    if (startTime == "" || endTime == "") {
        toastr.warning("请输入开始和结束时间");
        return;
    }

    if (departure == "" || destination == "") {
        toastr.warning("请输入出发地和目的地");
        return;
    }

    if (amount == "") {
        toastr.warning("请输入费用");
        return;
    }

    if (localStorage[STORAGE_APPROVER_FIRST] == null && localStorage[STORAGE_APPROVER_SECOND] == null) {
        toastr.warning("请指定审批人");
        return;
    }

    var firstApproverId = "";
    var item_first = localStorage[STORAGE_APPROVER_FIRST];
    if (item_first != null) {
        item_first = JSON.parse(item_first);
        firstApproverId = item_first.uid;
    }
    var secondApproverId = "";
    var item_second = localStorage[STORAGE_APPROVER_SECOND];
    if (item_second != null) {
        item_second = JSON.parse(item_second);
        secondApproverId = item_second.uid;
    }

    $.ajax({
        type: "POST",
        url: encodeURI(encodeURI(window.location)),
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        data: {type: type,
            reason: reason,
            startTime: startTime,
            endTime: endTime,
            departure: departure,
            destination: destination,
            amount: amount,
            firstApprover: firstApproverId,
            secondApprover: secondApproverId},
        success: function (data) {
            if (data) {
                toastr.success("提交成功");
                onClearStorage();
                localStorage[REFRESH_APPROVAL] = 1;
                window.history.go(-2);
            }
        }
    });

}