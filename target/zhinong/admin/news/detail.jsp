<%--
  Created by LiQiang at 2018/5/27
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>新闻详情</title>
    <script src="../../..//public/js/jquery.js"></script>
    <script src="../../../public/bs/js/bootstrap.js"></script>
    <link rel="stylesheet" href="../../../public/bs/css/bootstrap.css">
    <style>
        #title{
            margin-bottom: 20px;
            text-align: center;
        }
        #news_content{
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <h2 id="title">${newsTitle}</h2>
            <div id="news_content">${newsContent}</div>
         </div>
    </div>
</body>
</html>
