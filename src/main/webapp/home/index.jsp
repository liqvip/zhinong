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


    <!-- content -->
    <div class="content" style="width: 100%;">
        <div class="recommend">
            <div style="position: relative;width: 1200px;margin: 0 auto">
                <div class="title"></div>
                <div class="pd01">
                    <a href="">
                        <img src="<%=basePath%>home/images/recommend/pd01.jpg" alt="" width="671" height="316">
                    </a>
                    <div class="pd_text">
                        <h2>盐池滩羊</h2>
                        <h4>全身是宝的裘皮良种绵羊</h4>
                        <h4>养成周期：4个月</h4>
                        <h4>价　　格：120.00元/份</h4>
                        <h4>养成收益：6.00元/份</h4>
                        <a href="/raise/index/1" class="raise">立即认养  &gt;</a>
                    </div>
                </div>
                <div class="pd02">
                    <div class="pd_text">
                        <h2>巴马香猪</h2>
                        <h4>生态养殖，肉质细嫩，食之甚感鲜香</h4>
                        <h4>养成周期：6个月</h4>
                        <h4>价　　格：160.00元/份</h4>
                        <h4>养成收益：12.80元/份</h4>
                        <a href="" class="raise">立即认养  &gt;</a>
                    </div>
                    <a href="">
                        <img src="<%=basePath%>home/images/recommend/pd02.jpg" alt="" width="671" height="316">
                    </a>
                </div>
            </div>
        </div>

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
    </div>

    <!-- 回到顶部 -->
    <div class="gotop" style="display: none;"></div>
</body>
<script type="text/javascript" language="JavaScript" src="<%=basePath%>home/js/index.js" charset="UTF-8"></script>
</html>