<%@page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../common/main_home.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>home/css/user.css">
	<meta charset="UTF-8">
	<title>知农之家官方网站-互联网养殖</title>
</head>
<body>
<%@include file="../common/header.jsp"%>
    <!-- 主体内容 -->
    <div class="content">
        <div style="width: 1200px;position: relative;margin: 0 auto;">
            <div class="head">
                <span></span>
                <h1>个人设置</h1>
            </div>
            <div class="row">
                <%@include file="top.jsp"%>
            </div>
            <div class="row" style="margin-top: 30px;">
                <div class="col-md-2">
                    <%@include file="left.jsp"%>
                </div>
                <div class="col-md-10" style="border-radius: 5px; border: 1px solid #ccc;background-color: #FFFFFF">
                    <div class="set">
                         <ul>
                             <li>
                                 <em class="glyphicon glyphicon-user"></em>
                                 <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</span>
                                 <span>${user.name}</span>
                                 <a href="javascript:void(0)" class="btn btn-primary ren">设置昵称</a>
                             </li>
                             <li>
                                 <em class="glyphicon glyphicon-phone"></em>
                                 <span>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</span>
                                 <span>${user.phone}</span>
                                 <a href="javascript:void(0)" class="btn btn-primary ren">手机认证</a>
                                 
                             </li>
                            <li>
                                 <em class="glyphicon glyphicon-credit-card"></em>
                                 <span>实名绑卡：</span>
                                 <span>建设银行(5911)</span>
                                 <a href="javascript:void(0)" class="btn btn-primary ren">添加银行卡</a>
                             </li> 
                             <li>
                                 <em class="glyphicon glyphicon-envelope"></em>
                                 <span>常用邮箱：</span>
                                 <span>${user.email}</span>
                                 <a href="javascript:void(0)" class="btn btn-primary ren">设置</a>
                             </li>
                             <li>
                                 <em class="glyphicon glyphicon-lock"></em>
                                 <span>登录密码：</span>
                                 <span>*****</span>
                                 <a href="javascript:void(0)" class="btn btn-warning ren">重新设置</a>
                             </li>
                            <li>
                                 <em class="glyphicon glyphicon-wrench"></em>
                                 <span>支付密码：</span>
                                 <span>未设置</span>
                                 <a href="javascript:void(0)" class="btn btn-primary ren">设置</a>
                             </li> 
                         </ul>
                         <!-- 设置昵称 -->
                         <div class="panel panel-primary ren_set part01">
                          <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-user"></span> 设置昵称</h3>
                          </div>
                          <div class="panel-body">
                            <form action="">
                                <div class="form-group">
                                    <label for="">设置昵称：</label>
                                    <input type="text" class="form-control">
                                </div>
                                <input type="submit" class="btn btn-primary" value="确认">
                                <input type="button" class="btn btn-danger cancel" value="取消">
                            </form>
                          </div>
                         </div>
                         <!-- 手机认证 part02-->
                         <!-- 实名绑卡 part03-->
                         <!-- 设置邮箱 part04-->
                         <div class="panel panel-primary ren_set part04">
                          <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-envelope"></span> 常用邮箱</h3>
                          </div>
                          <div class="panel-body">
                            <form action="">
                                <div class="form-group">
                                    <label for="">常用邮箱：</label>
                                    <input type="text" class="form-control">
                                </div>
                                <input type="submit" class="btn btn-primary" value="确认">
                                <input type="button" class="btn btn-danger calcel" value="取消">
                            </form>
                          </div>
                         </div>
                         <!-- 设置登录密码 part05-->
                         <div class="panel panel-primary ren_set part05">
                          <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-lock"></span> 登录密码</h3>
                          </div>
                          <div class="panel-body">
                            <form action="">
                                <div class="form-group">
                                    <label for="">旧密码：</label>
                                    <input type="text" class="form-control">
                                    <label for="">新密码：</label>
                                    <input type="text" class="form-control">
                                    <label for="">确认密码：</label>
                                    <input type="text" class="form-control">
                                </div>
                                <input type="submit" class="btn btn-primary" value="确认">
                                <input type="button" class="btn btn-danger cancel" value="取消">
                            </form>
                          </div>
                         </div>
                         <!-- 设置支付密码 part06-->
                    </div> 
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $("a").click(function(){
                    switch($(this).index(".ren")){
                        case 0:
                            $(".ren_set").hide();
                            $(".part01").show();
                            break;
                        case 1:
                            $(".ren_set").hide();
                            $(".part02").show();
                            break;
                        case 2:
                            $(".part03").show();
                            $(".ren_set").hide();
                            break;
                        case 3:
                            $(".ren_set").hide();
                            $(".part04").show();
                            break;
                        case 4:
                            $(".ren_set").hide();
                            $(".part05").show();
                            break;
                        case 5:
                            $(".ren_set").hide();
                            $(".part06").show();
                            break;
                        default:
                            break;
                    }
                });
            });
    </script>
    <%@include file="../common/footer.jsp"%>
    <div class="gotop" style="display: none;"></div>
</body>
</html>