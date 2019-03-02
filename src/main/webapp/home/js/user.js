/*
* 存放主要交互逻辑js代码
* javascript 模块化
* */
var user = {
    URL: {
        verifycheck: function () {
            return "/home/user/verifycheck";
        },
        bindemail: function () {
            return "/home/user/bindemail";
        },
        bindphone: function () {
            return "/home/user/bindphone";
        },
        setpwd:function () {
            return "/home/user/setpwd";
        }
    },
    validate: function (username, password) {
        if (username == null || username == "" || username.length == 0 ||
            username.match(/^[ ]*$/)) {
            $(".noty_text").hide().html("账号不能为空").slideDown(500, function () {
                setTimeout(function () {
                    $(".noty_text").slideUp(1000);
                }, 500);
            });
            return false;
        }
        if (password == null || password == "" || password.length == 0 ||
            password.match(/^[ ]*$/)) {
            $(".noty_text").hide().html("密码不能为空").slideDown(500, function () {
                setTimeout(function () {
                    $(".noty_text").slideUp(1000);
                }, 500);
            });
            return false;
        }
        return true;
    },
    verifycheck: function () {
        var params = {
            password:$("input[name=password]").val()
        };
        $.post(user.URL.verifycheck(), params, function (result) {
            if (result && result['success']) {
                /*验证成功*/
                $(".modal-title").html("修改邮箱");
                $(".modal-body").html(
                    '<form >' +
                        '<div class="form-group">' +
                            '<label for="email" class="control-label">邮箱地址:</label>' +
                            '<input type="text" class="form-control" name="email" placeholder="请输入您的邮箱">' +
                        '</div>' +
                    '</form>' +
                    '<p class="text-danger"></p>');
                $(".modal-footer").html(
                    '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>' +
                    '<button type="button" class="btn btn-primary" id="yes">确定</button>'
                );
                $("#yes").click(function () {
                    /*绑定邮箱*/
                    user.bindEmail();
                });
            } else {
                /*验证失败，提示错误原因*/
                var data = result['data'];
                $(".text-danger").hide().html(data['statusInfo']).show();
            }
        });
    },
    bindEmail: function () {
        var params = {
            email:$("input[name=email]").val()
        };
        $.post(user.URL.bindemail(), params, function (result) {
            if (result && result['success']) {
                /*验证成功*/
                window.location.reload();
            } else {
                /*验证失败，提示错误原因*/
                var data = result['data'];
                $(".text-danger").hide().html(data['statusInfo']).show();
            }
        });
    },
    bindPhone: function () {
        var params = {
            phone:$("input[name=phone]").val()
        };
        $.post(user.URL.bindphone(), params, function (result) {
            if (result && result['success']) {
                /*验证成功*/
                window.location.reload();
            } else {
                /*验证失败，提示错误原因*/
                var data = result['data'];
                $(".text-danger").hide().html(data['statusInfo']).show();
            }
        });
    },
    setPwd: function () {
        var params = {
            oldPwd:$("input[name=oldPwd]").val(),
            newPwd:$("input[name=newPwd]").val(),
            secNewPwd:$("input[name=secNewPwd]").val()
        };
        $.post(user.URL.setpwd(), params, function (result) {
            if (result && result['success']) {
                /*修改成功*/
                window.location.reload();
            } else {
                /*修改失败，提示错误原因*/
                var data = result['data'];
                $(".text-danger").hide().html(data['statusInfo']).show();
            }
        });
    },
    init: {
        jsEmail: function () {
            $("#jsEmail").click(function () {
                $(".modal-title").html("验证身份");
                $(".modal-body").html(
                    '<div class="keybox">' +
                        '<span class="glyphicon glyphicon-edit"></span>' +
                    '</div>' +
                    '<p class="font1">请输入登录密码验证身份<br></p>' +
                    '<form >' +
                        '<div class="form-group">' +
                            '<label for="password" class="control-label">密码:</label>' +
                            '<input type="password" class="form-control" name="password" placeholder="请输入密码">' +
                        '</div>' +
                    '</form>' +
                    '<p class="text-danger"></p>');
                $(".modal-footer").html(
                    '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>' +
                    '<button type="button" class="btn btn-primary" id="yes">确定</button>'
                );
                $('#myModal').modal('show');
                $("#yes").click(function () {
                    user.verifycheck();
                });
            });
        },
        jsPhone: function () {
            $("#jsPhone").click(function () {
                $(".modal-title").html("绑定手机");
                $(".modal-body").html(
                    '<form >' +
                        '<div class="form-group">' +
                            '<label for="password" class="control-label">手机号码:</label>' +
                            '<input type="text" class="form-control" name="phone" placeholder="请输入您的手机号">' +
                        '</div>' +
                    '</form>' +
                    '<p class="text-danger"></p>');
                $(".modal-footer").html(
                    '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>' +
                    '<button type="button" class="btn btn-primary" id="yes">确定</button>'
                );
                $('#myModal').modal('show');
                $("#yes").click(function () {
                    user.bindPhone();
                });
            });
        },
        jsPwd: function () {
            $("#jsPwd").click(function () {
                $(".modal-title").html("修改密码");
                $(".modal-body").html(
                    '<form >' +
                        '<div class="form-group">' +
                            '<label for="password" class="control-label">输入原始密码:</label>' +
                            '<input type="password" class="form-control" name="oldPwd" placeholder="输入密码">' +
                        '</div>' +
                        '<div class="form-group">' +
                            '<label for="password" class="control-label">输入新密码:</label>' +
                            '<input type="password" class="form-control" name="newPwd" placeholder="输入密码">' +
                        '</div>' +
                        '<div class="form-group">' +
                            '<label for="password" class="control-label">确认新密码:</label>' +
                            '<input type="password" class="form-control" name="secNewPwd" placeholder="再次输入密码">' +
                        '</div>' +
                    '</form>' +
                    '<p class="text-danger"></p>');
                $(".modal-footer").html(
                    '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>' +
                    '<button type="button" class="btn btn-primary" id="yes">确定</button>'
                );
                $('#myModal').modal('show');
                $("#yes").click(function () {
                    user.setPwd();
                });
            });
        }
    }
};