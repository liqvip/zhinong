<%@page contentType="text/html;charset=utf-8" language="java" %>
<%@page pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <%@include file="common/main_home.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>home/css/index.css">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href="./images/favicon.ico">
    <title>知农之家官方网站-互联网养殖</title>
</head>
<body>
    <%@include file="common/header.jsp"%>
    <!-- 轮播图 -->
    <div class="row">
        <div class="container">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                </div>
                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>

                <script>
                    $(".carousel").mouseleave(function(){
                        $(this).find(".carousel-caption").slideUp(500);
                    });
                    $(".carousel").mouseenter(function(){
                        $(this).find(".carousel-caption").slideDown(500);
                    });
                </script>
            </div>
        </div>
    </div>

    <!-- 公告 -->
    <div class="row">
        <div class="container">
            <div class="notice">
                <div class="notice_center">
                    <div class="notice_content">
                        <span>公告:</span>
                        <ul class="notices"></ul>
                        <div class="more_notice">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        setInterval("noticeUp('.notice_content ul','-22px',1000)", 3000);

        function noticeUp(obj,top,time) {
            $(obj).animate({
                "marginTop": top
            }, time, function () {
                $(this).css({"marginTop":"0"}).find(":first").appendTo(this);
            })
        }
    </script>

    <!-- Recommand -->
    <div class="row">
        <div class="container recommend">
        </div>
    </div>

    <%--newsTab--%>
    <div class="row">
        <div class="container">
            <div class="tab_box whitebg">
                <div class="tab_buttons"><ul></ul></div>
                <div class="newstab"></div>
            </div>
        </div>
    </div>

    <%--友情链接--%>
    <div class="row">
        <div class="container">
            <div class="flink whitebg">
                <h4 class="title">友情链接</h4>
                <ul></ul>
            </div>
        </div>
    </div>
    <%@include file="common/footer.jsp"%>
    <!-- 回到顶部 -->
    <div class="gotop" style="display: none;"></div>
</body>
<script type="text/javascript" language="JavaScript" src="<%=basePath%>home/js/index.js" charset="UTF-8"></script>
</html>