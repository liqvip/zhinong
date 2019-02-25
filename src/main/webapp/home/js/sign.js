/*
* 存放主要交互逻辑js代码
* javascript 模块化
* */
var sign = {
    URL:{
      signin:function () {
          return "/home/user/signin";
      },
      signup:function () {
          return "/home/user/signup";
      }
    },
    validate:function (username,password) {
        if(username == null || username == "" || username.length == 0 ||
            username.match(/^[ ]*$/)){
            $(".noty_text").hide().html("账号不能为空").slideDown(500,function () {
                setTimeout(function () {
                    $(".noty_text").slideUp(1000);
                },500);
            });
            return false;
        }
        if(password == null || password == "" || password.length == 0 ||
            password.match(/^[ ]*$/)){
            $(".noty_text").hide().html("密码不能为空").slideDown(500,function () {
                setTimeout(function () {
                    $(".noty_text").slideUp(1000);
                },500);
            });
            return false;
        }
        return true;
    },
    signIn:function () {
        var params = $("#sign_in_form").serialize();
        $.post(sign.URL.signin(),params,function (result) {
            if(result && result['success']){
                /*登录成功,跳转到主页*/
                location.href = "/home";
            }else{
                /*登录失败，提示错误原因*/
                var data = result['data'];
                $(".noty_text").hide().html(data['statusInfo']).slideDown(500,function () {
                    setTimeout(function () {
                        $(".noty_text").slideUp(1000);
                    },500);
                });
            }
        });
    },
    signUp:function () {
        var params = $("#sign_up_form").serialize();
        $.post(sign.URL.signup(),params,function (result) {
            if(result && result['success']){
                /*注册成功*/
                layer.msg("注册成功！",function () {
                    location.href = "/home/signin";
                });
            }else{
                /*注册失败，提示错误原因*/
                var data = result['data'];
                $(".noty_text").hide().html(data['statusInfo']).slideDown(500,function () {
                    setTimeout(function () {
                        $(".noty_text").slideUp(1000);
                    },500);
                });
            }
        });
    },
    init:{
        signIn:function () {
            //绑定点击事件
            /*账号或密码不能为空*/
            $("#sign_in_btn").click(function () {
                var username = $("input[name=username]").val();
                var password = $("input[name=password]").val();
                if (sign.validate(username,password))
                /*登录操作*/
                    sign.signIn();
            });
        },
        signUp:function () {
            $("#sign_up_btn").click(function () {
                var username = $("input[name=username]").val();
                var password = $("input[name=password]").val();
                if (sign.validate(username,password))
                /*注册操作*/
                    sign.signUp();
            });
        }
    }
};