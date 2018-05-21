<%--
  Created by LiQiang at 2018/4/22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>页面跳转</title>
</head>
<body>
    <h2 style="margin: 300px auto;width: 500px">用户添加成功，2秒后页面自动跳转...</h2>
</body>
<script>
    setTimeout(function(){
        window.location.href="./add.jsp";
    },2000);
</script>
</html>
