<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
	//项目名
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
	<meta charset="UTF-8">
	<title>跳转提示</title>
</head>
<body>
	<h2 style="margin: 300px auto;width: 500px">恭喜您注册成功!2秒后页面自动跳转...</h2>
</body>
<script>
    window.setTimeout(function () {
		window.location.href="<%=basePath%>home/login";
    },2000);
</script>
</html>
