<%@page contentType="text/html;charset=utf-8" language="java" %>
<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="common/main_home.jsp"%>
	<link rel="stylesheet" href="<%=basePath%>home/css/sign.css">
	<title>知农-登录</title>
</head>
<body>
    <%@include file="common/header.jsp"%>
    <div class="sign">
        <div class="noty_message">
            <span class="noty_text"></span>
        </div>
        <div class="main">
            <h4 class="title">
                <div class="normal-title">
                    <a class="active" href="<%=basePath%>home/signin">登录</a>
                    <b>·</b>
                    <a class="" href="<%=basePath%>home/signup">注册</a>
                </div>
            </h4>
            <div>
                <form id="sign_in_form" action="" accept-charset="UTF-8" method="post">
                    <!-- 正常登录登录名输入框 -->
                    <div class="input-prepend restyle js-normal">
                        <input placeholder="账号" name="username"  type="text">
                        <i class="glyphicon glyphicon-user"></i>
                    </div>

                    <div class="input-prepend">
                        <input placeholder="密码" name="password" type="password">
                        <i class="glyphicon glyphicon-lock"></i>
                    </div>
                    <div class="remember-btn">
                        <input value="true" name="rememberMe" type="checkbox"><span>记住我</span>
                    </div>
                    <div class="forget-btn btn-group">
                        <a>忘记密码?</a>
                    </div>
                    <button class="sign-in-button" type="button" id="sign_in_btn">
                        <span id="sign-in-loading"></span>
                        登录
                    </button>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="<%=basePath%>home/js/sign.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        sign.init.signIn();
    });
</script>
</html>