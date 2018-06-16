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
	<h1 style="margin: 300px auto;width: 200px;alignment:center;">退出成功...</h1>
</body>
<script>
    window.setTimeout(function () {
		window.location.href="<%=basePath%>";
    },1000);
</script>
</html>
