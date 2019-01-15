$(document).ready(function() {
    $("#end").val(Format(new Date(), "yyyy-MM-dd"));
    $("#start").val(Format(new Date().getTime() - 6 * 24 * 60 * 60 * 1000, "yyyy-MM-dd"));
    initNewsCountByStatus(); //初始化已发表/草稿箱/垃圾箱新闻数目
    //initResourceCountByStatus(); //初始化已发表资源数目
    initNewsCountByDate(); //初始化昨日/今日新闻发表数目
    initVisitCount("now"); //初始化今日访客
    initVisitCount("history"); //初始化历史访客
    //initVisitCountByWeek(7); //初始化num日访客

});

$('#start').datepicker({
    keyboardNavigation : false,
    forceParse : false,
    autoclose : true,
    format : 'mm/dd/yyyy',
    todayHighlight : true,
    endDate : new Date(),
}).on('changeDate', function(ev) {
    var start = ev.date.valueOf();
    $('#start').val(Format(start, "yyyy-MM-dd"));
    if ($('#end').val() != "" && $('#start').val() > $('#end').val()) {
        swal("指定日期范围出错", "请重新检查", "error");
    } else if ($('#start').val() != "" && $('#end').val() != "") {
        initVisitCountByRange($('#start').val(), $('#end').val());
    }
});

$('#end').datepicker({
    keyboardNavigation : false,
    forceParse : false,
    autoclose : true,
    format : 'mm/dd/yyyy',
    todayHighlight : true,
    endDate : new Date(),
}).on('changeDate', function(ev) {
    var end = ev.date.valueOf();
    $('#end').val(Format(end, "yyyy-MM-dd"));
    if ($('#start').val() != "" && $('#start').val() > $('#end').val()) {
        swal("指定日期范围出错", "请重新检查", "error");
    } else if ($('#start').val() != "" && $('#end').val() != "") {
        initVisitCountByRange($('#start').val(), $('#end').val());
    }
})

//初始化新闻数目
var initNewsCountByStatus = function() {
    $.ajax({
        url : "home/selectNewsCountByStatus",
        type : 'get',
        dataType : 'json',
        success : function(data) {
            if(data.msg.success){
                var allCount = 0;
                for (var i = 0; i < data.list.length; i++) {
                    allCount += data.list[i].count;
                }
                for (var i = 0; i < data.list.length; i++) {
                    //草稿
                    if (data.list[i].status == -1) {
                        $(".draft").html(data.list[i].count);
                        var draftPercent = Math.round(data.list[i].count / allCount * 100) / 1.00 + '%<i class="fa fa-bolt"></i>';
                        $(".draftPercent").html(draftPercent);
                        //已发表
                    } else if (data.list[i].status == 1) {
                        $(".allNews").html(data.list[i].count);
                        var allNewsPercent = Math.round(data.list[i].count / allCount * 100) / 1.00 + '%<i class="fa fa-bolt"></i>';
                        $(".allNewsPercent").html(allNewsPercent);
                        //垃圾箱
                    } else if (data.list[i].status == 0) {
                        $(".delete").html(data.list[i].count);
                        var deletePercent = Math.round(data.list[i].count / allCount * 100) / 1.00 + '%<i class="fa fa-bolt"></i>';
                        $(".deletePercent").html(deletePercent);
                    }
                }
            }
        },
        error : function() {
            layer.msg("新闻状态接口错误，请检查后重试！");
        }
    });
};

//今日、昨日发表
var initNewsCountByDate = function() {
    var date = new Date();
    var qiantian = Format(new Date(date.getTime() - 2 * 24 * 60 * 60 * 1000), "yyyy-MM-dd");
    var yesterday = Format(new Date(date.getTime() - 24 * 60 * 60 * 1000), "yyyy-MM-dd");
    var today = Format(date, "yyyy-MM-dd");
    var params = {
        qiantian : qiantian,
        today : today,
        status : "1"
    };
    $.ajax({
        url : 'home/selectNewsCountByDate',
        type : 'post',
        data : params,
        dataType : 'json',
        success : function(data) {
            if(data.msg.success){
                var now = 0;
                var yes = 0;
                var yes2 = 0;
                for (var i = 0; i < data.list.length; i++) {
                    var time = data.list[i].addTime;
                    if (time == yesterday) {
                        yes = data.list[i].count;
                        $(".yesNews").html(data.list[i].count);
                    }
                    if (time == today) {
                        now = data.list[i].count;
                        $(".nowNews").html(data.list[i].count);
                    }
                    if (time == qiantian) {
                        yes2 = data.list[i].count;
                    }
                }

                var nowNewsPercent = level(now, yes);
                $(".nowNewsPercent").html(nowNewsPercent);

                var yesNewsPercent = level(yes, yes2);
                $(".yesNewsPercent").html(yesNewsPercent);
            }
        },
        error : function() {
            layer.msg("接口错误，请检查后重试！");
        }
    });
};

//今日、历史访客
var initVisitCount = function(e) {
    var date = null;
    var yesterday = null;
    var today = null;
    if (e == "now") {
        date = new Date();
        yesterday = Format(new Date(date.getTime() - 24 * 60 * 60 * 1000), "yyyy-MM-dd");
        today = Format(date, "yyyy-MM-dd");
    } else if (e == "history") {
        yesterday = "";
        today = "";
    }
    var params = {
        yesterday : yesterday,
        today : today,
        format : "day",
    };
    $.ajax({
        url : 'home/selectVisitCountByDate',
        type : 'post',
        data : params,
        dataType : 'json',
        success : function(data) {
            if (e == "now") {
                var now = 0;
                var yes = 0;
                for (var i = 0; i < data.list.length; i++) {
                    var time = Format(data.list[i].time, "yyyy-MM-dd");
                    if (time == today) {
                        now = data.list[i].count;
                        $(".nowVisitors").html(data.list[i].count);
                    }
                    if (time == yesterday) {
                        yes = data.list[i].count;
                    }
                }
                var nowVisitorsPercent = level(now, yes);
                $(".nowVisitorsPercent").html(nowVisitorsPercent);
            } else if (e == "history") {
                var num = 0;
                for (var i = 0; i < data.list.length; i++) {
                    num += data.list[i].count;
                }
                var sum = toThousands(num);
                $(".visitors").html(sum);
            }
        },
        error : function() {
            layer.msg("访问接口错误！请检查后重试!")
        }
    });
};

//根据今天/昨天 计算出 增长率/下降率
var level = function(now, yes) {
    var pm = now - yes;
    var level = '<span class="glyphicon glyphicon-arrow-up"></span>';
    if (pm < 0) {
        pm = -pm;
        level = '<span class="glyphicon glyphicon-arrow-down"></span>';
    }
    if (yes == 0) {
        return Math.round(pm * 100) / 1.00 + '%' + level;
    }
    return Math.round(pm / yes * 100) / 1.00 + '%' + level;
};

//获取前num个月的日期
var dataMonth = function(num) {
    //创建现在的时间
    var data = new Date();
    //获取年
    var year = data.getFullYear();
    //获取月
    var mon = data.getMonth() + 2;
    var arry = new Array();
    for (var i = num - 1; i >= 0; i--) {
        mon = mon - 1;
        if (mon <= 0) {
            year = year - 1;
            mon = mon + 12;
        }
        if (mon < 10) {
            mon = "0" + mon;
        }
        arry[i] = year + "-" + mon;
    }
    return arry;
};

//获取前num年的日期
var dataYear = function(num) {
    //创建现在的时间
    var data = new Date();
    //获取年
    var year = data.getFullYear() + 1;
    var arry = new Array();
    for (var i = num - 1; i >= 0; i--) {
        year = year - 1;
        arry[i] = year;
    }
    return arry;
};

//格式化时间
function Format(datetime, fmt) {
    if (parseInt(datetime) == datetime) {
        if (datetime.length == 10) {
            datetime = parseInt(datetime) * 1000;
        } else if (datetime.length == 13) {
            datetime = parseInt(datetime);
        }
    }
    datetime = new Date(datetime);
    var o = {
        "M+" : datetime.getMonth() + 1, //月份
        "d+" : datetime.getDate(), //日
        "h+" : datetime.getHours(), //小时
        "m+" : datetime.getMinutes(), //分
        "s+" : datetime.getSeconds(), //秒
        "q+" : Math.floor((datetime.getMonth() + 3) / 3), //季度
        "S" : datetime.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

var toThousands = function(num) {
    var num = (num || 0).toString(),
        result = '';
    while (num.length > 3) {
        result = ',' + num.slice(-3) + result;
        num = num.slice(0, num.length - 3);
    }
    if (num) {
        result = num + result;
    }
    return result;
}