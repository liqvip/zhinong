//存放主要交互逻辑js代码
//javascript 模块化
var raiseKill = {
    //封装秒杀相关ajax的url
    URL:{
        now:function () {
            return "/home/raise/time/now";
        },
        exposer:function (id) {
            return '/home/raise/'+id+'/exposer';
        },
        execution:function (md5) {
            return '/home/raise/'+md5+'/execution';
        },
        signin:function () {
            return "/home/signin";
        }
    },
    handleKill:function (id,kill_btn) {
        //获取秒杀地址，控制实现逻辑，执行秒杀
        kill_btn.hide().html("立即认养").attr("href","javascript:void(0)").addClass("raise_btn02");
        $.post(raiseKill.URL.exposer(id),{},function (result) {
            //在回调函数中执行交互流程
            if(result && result['success']){
                var exposer = result['data'];
                if(exposer['exposed']){
                    //开启秒杀
                    var md5 = exposer['md5'];
                    var killUrl = raiseKill.URL.execution(md5);
                    console.log('killUrl:'+killUrl);
                    //绑定一次点击事件
                    kill_btn.one('click',function () {
                        //执行秒杀请求
                        //1.先禁用按钮
                        $(this).addClass('disabled');
                        //2.发送秒杀请求
                        var params = {
                            raiseId:id,
                            amount:$("input[name=amount]").val()
                        };
                        $.ajax({
                            url:killUrl,
                            type:"post",
                            data:params,
                            dataType:"json",
                            success:function (result,status,jqXHR) {
                                if(result && result['success']){
                                    var killResult = result['data'];
                                    var status = killResult['status'];
                                    var statusInfo = killResult['statusInfo'];
                                    //3.显示秒杀结果
                                    kill_btn.html(statusInfo);
                                }
                            },
                            error:function (jqXHR) {
                                window.location.href="/home/signin";
                            }
                        });
                    });
                    kill_btn.show();
                }else{
                    //未开启秒杀
                    var now = exposer['now'];
                    var start = exposer['start'];
                    var end = exposer['end'];
                    //重新计算计时逻辑
                    raiseKill.countDown(id,now,start,end);
                }
            }else{
                console.log('result:'+result);
            }
        });
    },
    //验证手机号
    validatePhone:function (phone) {
        if(phone && phone.length == 11 && !isNaN(phone)){
            return true;
        }else{
            return false;
        }
    },
    countDown:function (id,nowTime,startTime,endTime) {
        var kill_btn = $("#kill_btn");
        if(nowTime > endTime){
            //秒杀结束
            kill_btn.attr("href","javascript:void(0)").addClass("raise_btn03");
            kill_btn.html('秒杀结束');
        }else if(nowTime < startTime){
            //秒杀未开始，计时事件绑定
            var killTime = new Date(startTime + 1000);
             kill_btn.countdown(killTime,function (event) {
                 //时间格式
                 var format = event.strftime("%D天 %H时 %M分 %S秒");
                 kill_btn.html(format).attr("href","javascript:void(0)").addClass("raise_btn01");
                 //时间完成后回调事件
             }).on('finish.countdown',function () {
                 //获取秒杀地址，控制实现逻辑，执行秒杀
                 raiseKill.handleKill(id,kill_btn);
             });
        }else{
            //秒杀开始
            raiseKill.handleKill(id,kill_btn);
        }
    },
    detail:{
        //详情页初始化
        init:function (params) {
            //规划我们的交互流程
            //计时交互
            var startTime = params['startTime'];
            var endTime = params['endTime'];
            var id = params['id'];
            $.get(raiseKill.URL.now(),{},function (result) {
                if(result && result['success']){
                    var nowTime = result['data'];
                    //时间判断
                    raiseKill.countDown(id,nowTime,startTime,endTime);
                }else{
                    console.log('result:'+result);
                }
            });
        }
    }
};