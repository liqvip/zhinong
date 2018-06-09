<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../../public/bs/css/bootstrap.css">
	<link rel="stylesheet" href="../css/register.css">
    <%--必须在引入bootstrap.js之前导入--%>
    <script src="../../public/js/jquery.js"></script>
    <script src="../../public/bs/js/bootstrap.js"></script>
    <script src="../../public/js/docs.min.js"></script>
	<meta charset="UTF-8">
    <link rel="shortcut icon" href="../images/favicon.ico">
	<title>知农-注册</title>
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
                            <a href="../user/user.jsp">
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span>个人中心</span>
                            </a>
                        </li>
                      
                        <li>
                            <a href="../login/login.jsp">
                                <span class="glyphicon glyphicon-user"></span>
                                <span>登录</span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <span class="glyphicon glyphicon-cog"></span>
                                <span>注册</span>
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
                    <a href="../index.jsp"><img src="../images/logo.png" title="乐农" alt="乐农"></a>
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
                                <a href="" alt="首页" style=" " class="">首页</a>
                             </li>                                
                             <li>
                                <a href="../raise/raise.jsp" alt="掘金农场" style="" class="">掘金农场</a>
                             </li>                                
                             <li>
                                <a href="" alt="欢乐集市" style="" class="">欢乐集市</a>
                             </li>                                
                             <li>
                                <a href="" alt="科学种养" style="" class="uline">科学种养</a>
                             </li>                                
                             <li>
                                <a href="../user/user.jsp" alt="用户中心" style="" class="">用户中心</a>
                             </li>                                
                             <li>
                                <a href="" alt="关于我们" style="" class="">关于我们</a>
                             </li>                        
                             <li><a href="" alt="媒体报道" style="" class="">媒体报道</a>
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
	
	<div class="register_content">
		<div class="" style="width: 800px;margin: 0 auto;">
			<div class="panel panel-success">
			  <div class="panel-heading">
			    <h3 class="panel-title" style="font-size: 20px;">欢迎注册</h3>
			  </div>
			  <div class="panel-body">
			  	<form action="register" method="post">
			  		<div class="form-group">
		  				<label for="">账号：</label>
		  				<input type="text" class="form-control auth" name="loginName" placeholder="请输入账号">
		  				<p>6-10位英文、数字、 符号，区分大小写!</p>
		  			</div>
		  			<div class="form-group">
		  				<label for="">密码：</label>
		  				<input type="password" class="form-control auth" name="loginPwd" placeholder="请输入密码">
		  				<p>8-20位英文、数字、 符号，区分大小写!</p>
		  			</div>
		  			<div class="form-group">
		  				<label for="">确认密码：</label>
		  				<input type="password" class="form-control auth" name="repassWord" placeholder="再次输入密码">
		  				<p>两次密码不一致!</p>
		  			</div>
		  			<input type="submit" value="立即注册" class="btn btn-success">
                    <input type="reset" class="btn btn-danger" value="重置">
			  	</form>
			  </div>
			</div>
		</div>
	</div>
	<script>
		var uO = $("input[name=loginName]");
		var pO = $("input[name=loginPwd]");
		var rpO = $("input[name=repassWord]");	

		uO.blur(function(){
			var userV = uO.val();
			if(userV.length<6||userV.length>10){
				$(this).data({"s":0});
				$(this).next().show();
			}else{
				$(this).data({"s":1});
				$(this).next().hide();
			}
		});
		pO.blur(function(){
			var passV = pO.val();
			if(passV.length<8||passV.length>20){
				$(this).data({"s":0});
				$(this).next().show();
				count=0;
			}else{
				$(this).data({"s":1});
				$(this).next().hide();
			}
		});
		rpO.blur(function(){
			if(pO.val()!=rpO.val()){
				$(this).data({"s":0});
				$(this).next().show();
			}else{
				$(this).data({"s":1});
				$(this).next().hide();
			}
		});

		$("form").submit(function(){
			$(".auth").blur();
			var tot = 0;

			$(".auth").each(function(){
				tot+=$(this).data("s");
			});

			if(tot!=3){
			return false;
			}
		});

	</script>


    <footer class="footer">
            <div class="" style="width: 1200px;margin: 0 auto">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3"><img src="../images/logo.png" alt="" style="margin-top: 20px;"></div>
                        <div class="col-md-6">
                            <div class="footer_menu">
                                <ul>
                                    <li>关于我们</li>
                                    <li>联系我们</li>
                                    <li>常见问题</li>
                                    <li>加入我们</li>
                                </ul>
                                <div class="copytright">
                                    <img src="../images/footer/copyright.png" alt="" style="width: 20px">
                                    <span style="margin-left: 10px;">赣公网安备14010902000157号 赣ICP备14001940号-4 </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <img src="../images/footer/mywx.png" alt="" width="100px">
                            <img src="../images/footer/mygzh.jpg" alt="" width="100px" style="margin-left: 10px;">
                        </div>
                    </div>
                </div>
            </div>
    </footer>
</body>
</html>