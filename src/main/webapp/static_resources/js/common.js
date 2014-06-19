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

var STORAGE_MANAGER = 10;
var STORAGE_MEMBER = 11;
var STORAGE_CUSTOMER = 12;
var STORAGE_PROJECT = 13;
var STORAGE_ARRAY = [STORAGE_MANAGER, STORAGE_MEMBER, STORAGE_CUSTOMER];

var CREATE_PROJECT = 20;
var CREATE_MODULE = 21;
var CREATE_TASK = 22;
var CREATE_CUSTOMER = 23;

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
                    "<h4 class='list-group-item-text head-pic-text_'>" + data[i].englishName + " (" + data[i].chineseName + ")" +
                    "<input type='checkbox' id=" + data[i].id + " value='" + data[i].englishName + " (" + data[i].chineseName + ")'></h4></li>";
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


// ==========================================================================================

function onProjectCreateDocumentReady() {
    for (var i in STORAGE_ARRAY) {
        var list = localStorage[STORAGE_ARRAY[i]];
        if (list != null) {
            var items = JSON.parse(list);
            var html = "";
            $.each(items, function (i, item) {
                html += "<li class='list-group-item' style='min-height: 20px'>" +
                    item.name +
                    "</li>";
            });
            if (i == 0) {
                $("#manager").append(html);
            } else if (i == 1) {
                $("#member").append(html);
            } else if (i == 2) {
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
        var html = "<li class='list-group-item' style='min-height: 20px'>" +
            item.name +
            "</li>";
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

function onCreate(type, id) {
    if (type == CREATE_PROJECT) {
        var name = $('#project_name').val();
        if (name == "") {
            toastr.warning("请输入项目名称");
            return;
        }
    } else if (type == CREATE_MODULE) {
        var name = $('#module_name').val();
        if (name == "") {
            toastr.warning("请输入模块名称");
            return;
        }
    } else if (type == CREATE_TASK) {
        var name = $('#task_name').val();
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

    var managerList = localStorage[STORAGE_MANAGER];
    if (managerList != null) {
        var items = JSON.parse(managerList);
        $.each(items, function (i, item) {
            managerIds[i] = item.uid;
        });
    }

    var memberList = localStorage[STORAGE_MEMBER];
    if (memberList != null) {
        var items = JSON.parse(memberList);
        $.each(items, function (i, item) {
            memberIds[i] = item.uid;
        });
    }

    var customerList = localStorage[STORAGE_CUSTOMER];
    if (customerList != null) {
        var items = JSON.parse(customerList);
        $.each(items, function (i, item) {
            customerIds[i] = item.uid;
        });
    }

    if (type == CREATE_PROJECT) {
        var info = $('#project_info').val();
        var stage = $('#project_stage').val();
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            data: {name: name,
                info: info,
                stage: stage,
                managerIds: JSON.stringify(managerIds),
                memberIds: JSON.stringify(memberIds),
                customerIds: JSON.stringify(customerIds)},
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                toastr.success("保存成功");
                onClearStorage();
                window.location.href = "/project";
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
                window.location.href = "/project/" + id;
            }
        });
    } else if (type == CREATE_TASK) {
        var task_priority = document.getElementById("task_priority").value;
        var task_stage = document.getElementById("task_stage").value;
        var task_deadline = document.getElementById("task_deadline").value;
        $.ajax({
            type: "POST",
            url: encodeURI(encodeURI(window.location)),
            data: {name: name,
                deadline: task_deadline,
                priorityId: task_priority,
                stageId: task_stage,
                memberIds: JSON.stringify(memberIds),
                customerIds: JSON.stringify(customerIds)},
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                toastr.success("保存成功");
                onClearStorage();
                window.location.href = "/project/module/" + id;
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
                window.location.href = "/customer";
            }
        });
    }
}
