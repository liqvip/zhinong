<%@page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<%
    //项目名
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <link rel="stylesheet" href="<%=basePath%>home/css/home.css">
    <link rel="stylesheet" href="<%=basePath%>public/bs/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>home/css/user.css">
    <%--jquery.js必须在引入bootstrap.js之前导入--%>
    <script src="<%=basePath%>public/js/jquery.js"></script>
    <script src="<%=basePath%>public/bs/js/bootstrap.js"></script>
    <script src="<%=basePath%>public/js/docs.min.js"></script>

	<meta charset="UTF-8">
	<link rel="shortcut icon" href="../images/favicon.ico">
	<title>知农之家官方网站-互联网养殖</title>
</head>
<body>
<div class="header">
    <div class="row" style="width: 100%;margin: 0px;">
        <div class="container" style="padding-left: 0px;padding-right: 0px;">
            <div class="col-md-6" style="padding-left: 0px;padding-right: 0px;">
                <p class="" style="line-height: 38px;">
                    <span class="glyphicon glyphicon-equalizer"></span>
                    <span>知农，乐农，富农！</span>
                </p>
            </div>
            <div class="col-md-6" style="padding-left: 0px;padding-right: 0px;">
                <ul class="header-right topullist">
                    <li>
                        <a href="">
                            <span class="glyphicon glyphicon-user"></span>
                            <span>你好，欢迎来到知农之家！</span>
                        </a>
                    </li>
                    <li>
                        <a href="<%=basePath%>home/user">
                            <span class="glyphicon glyphicon-star-empty"></span>
                            <span>个人中心</span>
                        </a>
                    </li>

                    <li>
                        <a href="<%=basePath%>home/signout">
                            <span class="glyphicon glyphicon-cog"></span>
                            <span>退出</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- 导航条 -->
<nav style="height:103px;width:100%;position: relative;margin-top: 6px;">
    <div class="row" style="padding:20px 0px">
        <div class="container" style="padding-right:0px;margin-left: 117px;">
            <div class="col-xs-2 col-md-2" style="padding-left:0px;">
                <a href=""><img src="<%=basePath%>home/images/logo.png" title="乐农" alt="乐农"></a>
            </div>
            <style>
                .nav>li>a:focus,.nav>li>a:hover{
                    background-color: white;
                    color: #338c22;
                }
            </style>
            <div class="col-xs-10 col-md-10" style="margin:6px 0px;padding-right: 0px;padding-left:0px;">
                <nav class="navbar" style="width:100%;margin-left: 15px;">
                    <ul class="nav navbar-nav column">
                        <li>
                            <a href="<%=basePath%>" alt="首页" style=" " class="">首页</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>home/raise" alt="掘金农场" style="" class="">掘金农场</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>home/market" alt="欢乐集市" style="" class="">欢乐集市</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>home/science" alt="科学种养" style="" class="uline">科学种养</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>home/user" alt="用户中心" style="" class="">用户中心</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>home/about" alt="关于我们" style="" class="">关于我们</a>
                        </li>
                        <li><a href="<%=basePath%>home/news" alt="媒体报道" style="" class="">媒体报道</a>
                        </li>
                        </li>
                        <li class="clear"></li>
                    </ul>
                    <style>
                        .btn-primary1{
                            border-radius:0px;
                            color:#fff;
                            background-color:#338c22;
                            border-color:#338c22
                        }
                        .btn-primary1:hover{
                            color:#fff;
                            background-color:#2d9920;
                            border-color:#2d9920;
                        }
                        .Search{
                            float:right;
                            border:1px solid #338c22;
                            height: 36px;
                            line-height: 36px;
                            border-radius: 5px;
                            position: relative;
                            width: 220px;
                            z-index: 105;
                            margin-top:10px;
                            margin-right:23px;
                            overflow:hidden;
                        }
                        .Search button,.Search input{
                            border:none #338c22;
                            outline :0px;
                        }
                        .Search button{
                            height: 34px;
                            width: 80px;
                            font-size: 16px;
                            margin:0;
                            float:right;
                        }
                        .Search input{
                            height: 30px;
                            line-height: 30px;
                            padding:7px;
                            width:135px;
                            margin-left:2px;
                        }

                    </style>
                    <script>
                        $('.column li a').mouseenter(function(){
                            $(this).addClass('uline');
                            $('.column li a').not($(this)).removeClass('uline');
                        });
                    </script>

                    <div class="Search" style="left: 44px;">
                        <form action="/search" method="GET">
                            <input type="text" name="name" placeholder="搜索" class="searchinput">
                            <button type="submit" class="btn btn-primary1">搜索</button>
                        </form>
                    </div>
                </nav>
                <script>


                    $('.searchinput').focus(function(){
                        $(this).attr({'placeholder':'输入农资名称'});
                        $('.Search').animate({
                            'width':'267px'
                        },500);
                        $(this).animate({
                            'width':'183px'
                        },500);
                    });
                    $('.searchinput').blur(function(){
                        $(this).css({'width':'135px'}).attr({'placeholder':'农资搜索'});
                        $('.Search').animate({
                            'width':'220px'
                        },500);
                        $(this).animate({
                            'width':'135px'
                        },500);
                    });
                </script>
            </div>
        </div>
    </div>
</nav>

    <!-- 主体内容 -->
    <div class="content">
        <div style="width: 1200px;position: relative;margin: 0 auto;">
            <div class="head">
                <span></span>
                <h1>用户中心</h1>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <img src="../images/user/user_photo.jpg" alt="" style="box-shadow: 3px 3px 3px #888888;">
                </div>
                <div class="col-md-10">
                    <div class="row section01" style="border-radius: 5px;height:166px;border: 1px solid #ccc;">
                        <div class="col-md-3" style="border-left: 0px;">
                            <h4>账号</h4>
                            <h5>181****0597</h5>
                        </div>
                        <div class="col-md-2">
                            <h4>账户</h4>
                            <h5>0.00元</h5>
                        </div>
                        <div class="col-md-2">
                            <h4>待收收益</h4>
                            <h5>0.00元</h5>
                        </div>
                        <div class="col-md-2">
                            <h4>待返本金</h4>
                            <h5>0.00元</h5>
                        </div>
                        <div class="col-md-3" style="padding-top: 15px;">
                            <a href="" class="btn btn-primary btn-lg">充值</a> 
                            <a href="" class="btn btn-warning btn-lg">兑现</a> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 30px;">
                <div class="col-md-2">
                    <div class="list-group" style="text-align: center;">
                        <a href="<%=basePath%>home/user" class="list-group-item active">用户中心</a>
                        <a href="<%=basePath%>home/user/rich" class="list-group-item active">财富记录</a>
                        <a href="<%=basePath%>home/user/order" class="list-group-item active">我的订单</a>
                        <a href="<%=basePath%>home/user/filed" class="list-group-item active">我的牧场</a>
                        <a href="<%=basePath%>home/user/card" class="list-group-item active">我的银行卡</a>
                        <a href="<%=basePath%>home/user/personal" class="list-group-item active">个人设置</a>
                        <a href="<%=basePath%>home/user/address" class="list-group-item active">我的地址</a>
                    </div>
                </div>
                <div class="col-md-10" style="border-radius: 5px; border: 1px solid #ccc;">
                    <div class="set">
                         <ul>
                             <li>
                                 <em class="glyphicon glyphicon-user"></em>
                                 <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</span>
                                 <span>哎呦哥哥</span>
                                 <a href="javascript:void(0)" class="btn btn-primary ren">设置昵称</a>
                             </li>
                             <li>
                                 <em class="glyphicon glyphicon-phone"></em>
                                 <span>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</span>
                                 <span>181****0597</span>
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
                                 <span>993555902@qq.com</span>
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

<footer class="footer">
    <div class="" style="width: 1200px;margin: 0 auto">
        <div class="container">
            <div class="row">
                <div class="col-md-3"><img src="<%=basePath%>home/images/logo.png" alt="" style="margin-top: 20px;"></div>
                <div class="col-md-6">
                    <div class="footer_menu">
                        <ul>
                            <li>关于我们</li>
                            <li>联系我们</li>
                            <li>常见问题</li>
                            <li>加入我们</li>
                        </ul>
                        <div class="copytright">
                            <img src="<%=basePath%>home/images/footer/copyright.png" alt="" style="width: 20px">
                            <span style="margin-left: 10px;">赣公网安备14010902000157号 赣ICP备14001940号-4 </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <img src="<%=basePath%>home/images/footer/mywx.png" alt="" width="100px">
                    <img src="<%=basePath%>home/images/footer/mygzh.jpg" alt="" width="100px" style="margin-left: 10px;">
                </div>
            </div>
        </div>
    </div>
</footer>

    <div class="gotop" style="display: none;"></div>
</body>
<script src="<%=basePath%>home/js/index.js"></script>
</html>