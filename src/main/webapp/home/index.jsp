<%@page contentType="text/html;charset=utf-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <%@include file="main_home.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="./images/favicon.ico">
    <title>知农之家官方网站-互联网养殖</title>
</head>
<body>
    <%@include file="header.jsp"%>
    <!-- 轮播图 -->
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


    <!-- 公告 -->
    <div class="notice">
        <div class="notice_center">
            <div class="notice_content">
                <span>公告:</span>
                <ul id="notice">
                    <li><a href="">知农之家系统维护通知</a></li>
                    <li><a href="">关于国庆中秋放假的通知</a></li>
                    <li><a href="">2017元旦放假</a></li>
                    <li><a href="">双十一来知农之家掘金,赢百元现金</a></li>
                </ul>
                <a href="">更多公告>></a>
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

        <div class="news">
            <div style="position: relative;width: 1200px; margin: 0 auto;">
                 <div class="title"></div>
                 <div class="news_content">
                     <div class="news_con">
                         <div class="news_list_l">
                            <div class="news_list_title">最新动态<a href="" class="more">更多></a>
                            </div>
                            <ul class="">
                                <li class="">
                                    <a class="" href="" class="">
                                        <img  src="<%=basePath%>home/images/news/left01.jpg" alt="" width="119" height="80">
                                    </a>
                                    <a href="" class="">
                                        <h3 >互联网养殖好吃好玩红利多  掀起全民养鸡“热”</h3>
                                    </a>
                                    <h4 >乐农之家</h4>
                                    <i>2018年01月12日 14:50</i>
                                </li>
                                <li>
                                    <a  href="" class="">
                                        <img  src="<%=basePath%>home/images/news/left02.png" alt="" width="119" height="80">
                                    </a>
                                    <a href="" class="">
                                        <h3 >共享农场助力三农发展  央视喊你来养“猪”</h3>
                                    </a>
                                    <h4 >乐农之家</h4>
                                    <i >2018年01月05日 15:55</i>
                                </li>
                                <li >
                                    <a href="" class="">
                                        <img src="<%=basePath%>home/images/news/left03.png" alt="" width="119" height="80">
                                    </a>
                                    <a href="" class="">
                                        <h3>互联网养殖：大山里的藏香猪   成为互联网金融“抢手货”</h3>
                                    </a>
                                    <h4> 乐农之家</h4>
                                    <i>2018年01月02日 17:20</i>
                                </li>
                            </ul>
                         </div>
                         <div class="news_list_r">
                             <div class="news_list_title">媒体报道<a href="" class="more">更多></a>
                            </div>
                            <ul class="">
                                <li class="">
                                    <a class="" href="" class="">
                                        <img  src="<%=basePath%>home/images/news/right01.jpg" alt="" width="119" height="80">
                                    </a>
                                    <a href="" class="">
                                        <h3 >互联网养殖 开启养殖生态共享经济</h3>
                                    </a>
                                    <h4 >中国贸易金融网</h4>
                                    <i>2017年10月26日 11:50</i>
                                </li>
                                <li>
                                    <a  href="" class="">
                                        <img  src="<%=basePath%>home/images/news/right02.png" alt="" width="119" height="80">
                                    </a>
                                    <a href="" class="">
                                        <h3 >知农之家退出宁夏五宝之——岩石滩羊 不可小看互联网的养殖</h3>
                                    </a>
                                    <h4 >中国农业新闻网</h4>
                                    <i>2017年09月7日 15:08</i>
                                </li>
                                <li >
                                    <a href="" class="">
                                        <img src="<%=basePath%>home/images/news/right02.png" alt="" width="119" height="80">
                                    </a>
                                    <a href="" class="">
                                        <h3>"巴马香猪"走进互联网 即将在知农之家上线</h3>
                                    </a>
                                    <h4> 乐农之家</h4>
                                    <i>2017年08月21日 8:10</i>
                                </li>
                            </ul>
                         </div>
                     </div>
                 </div>
            </div>
        </div>
        <div class="flink">
            <div class="" style="width:1100px;margin:0 auto;overflow: hidden;">
                <div class="container">
                    <div class="row">
                        <h4 class="title">友情链接</h4>
                        <ul>
                            <li><a href="">科学种养</a></li>
                            <li><a href="">中国食品网</a></li>
                            <li><a href="">江西农科院</a></li>
                            <li><a href="">招商银行</a></li>
                            <li><a href="">顺丰速运</a></li>
                            <li><a href="">淘宝网</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </div>

    <!-- 回到顶部 -->
    <div class="gotop" style="display: none;"></div>
</body>
<script src="<%=basePath%>home/js/index.js"></script>
</html>