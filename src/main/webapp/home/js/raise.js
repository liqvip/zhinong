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
        }
    },
    handleKill:function (id,killBox) {
        //获取秒杀地址，控制实现逻辑，执行秒杀
        killBox.hide()
            .html('<button class="btn btn-primary btn-lg" id="killBtn">开始秒杀</button>');
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
                    $('#killBtn').one('click',function () {
                        //执行秒杀请求
                        //1.先禁用按钮
                        $(this).addClass('disabled');
                        //2.发送秒杀请求
                        $.post(killUrl,{},function (result) {
                            if(result && result['success']){
                                var killResult = result['data'];
                                var status = killResult['status'];
                                var statusInfo = killResult['statusInfo'];
                                //3.显示秒杀结果
                                killBox.html('<span class="label label-success">'+statusInfo+'</span>');
                            }
                        });
                    });
                    killBox.show();
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
        var killBox = $('#killBox');
        if(nowTime > endTime){
            //秒杀结束
            killBox.html('秒杀结束');
        }else if(nowTime < startTime){
            //秒杀未开始，计时事件绑定
            var killTime = new Date(startTime + 1000);
             killBox.countdown(killTime,function (event) {
                 //时间格式
                 var format = event.strftime("倒计时:%D天%H时%M分%S秒");
                 killBox.html(format);
                 //时间完成后回调事件
             }).on('finish.countdown',function () {
                 //获取秒杀地址，控制实现逻辑，执行秒杀
                 raiseKill.handleKill(id,killBox);
             });
        }else{
            //秒杀开始
            raiseKill.handleKill(id,killBox);
        }
    },
    detail:{
        //详情页初始化
        init:function (params) {
            //手机验证和登录，计时交互
            //规划我们的交互流程
            //在cookie中查找手机号
            var phone = $.cookie("phone");

            //验证手机号
            if(!raiseKill.validatePhone(phone)){
                //绑定phone
                //控制输出
                var phoneModal = $("#phoneModal");
                //显示弹出层
                phoneModal.modal({
                    show:true,//显示弹出层
                    backdrop:'static',//禁止位置关闭
                    keyboard:false//关闭键盘事件
                });
                $('#phoneBtn').click(function () {
                    var inputPhone = $('#phoneKey').val();
                    if(raiseKill.validatePhone(inputPhone)){
                        //电话写入cookie
                        $.cookie('phone',inputPhone,{expires:7,path:'/home/raise'})
                        //刷新页面
                        window.location.reload();
                    }else {
                        $('#phoneMessage').hide().html('<label class="label label-danger">手机号错误!</label>').show(300);
                    }
                });
            }
            //已经登录
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