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
                <h1>账号绑定</h1>
            </div>
            <div class="row" style="margin-top: 30px;">
                <div class="col-md-2">
                    <%@include file="left.jsp"%>
                </div>
                <div class="col-md-10" style="border-radius: 5px; border: 1px solid #ccc;background-color: #FFFFFF">
                    <div class="common-title">账号绑定</div>
                    <div class="line"></div>
                    <div class="itemBox">
                        <div class="left">	<i class="glyphicon glyphicon-envelope"></i></div>
                        <div class="center">
                            <p>
                                <span class="font1">邮箱</span>
                                <span class="font3">993555902@qq.com 已绑定</span>
                            </p>
                            <p class="font2">可用邮箱加密码登录知农网，可用邮箱找回密码</p>
                        </div>
                        <div class="right">
                            <button class="btn btn-success">更改</button>
                        </div>
                    </div>
                    <div class="itemBox">
                        <div class="left">	<i class="glyphicon glyphicon-phone"></i></div>
                        <div class="center">
                            <p>
                                <span class="font1">手机</span>
                                <span class="font4" id="jsPhone">未绑定（绑定手机可得1积分）</span>
                            </p>
                            <p class="font2">可用手机号加密码登录知农网，可通过手机号找回密码</p>
                        </div>
                        <div class="right">
                            <button class="btn btn-success">立即绑定</button>
                        </div>
                    </div>
                    <div class="itemBox">
                        <div class="left">	<i class="glyphicon glyphicon-check"></i></div>
                        <div class="center">
                            <p><span class="font1">密码</span> 已设置</p>
                            <p class="font2">用于保护账号信息和登录安全</p>
                        </div>
                        <div class="right">
                            <button class="btn btn-success">修改</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../common/footer.jsp"%>
    <div class="gotop" style="display: none;"></div>
</body>
</html>