<%@page contentType="text/html; charset=utf-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<%
    //项目名
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <link rel="stylesheet" href="<%=basePath%>home/css/home.css">
    <link rel="stylesheet" href="<%=basePath%>public/bs/css/bootstrap.css">
    <%--必须在引入bootstrap.js之前导入--%>
    <script src="<%=basePath%>public/js/jquery.js"></script>
    <script src="<%=basePath%>public/bs/js/bootstrap.js"></script>
    <script src="<%=basePath%>public/js/docs.min.js"></script>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" href="./images/favicon.ico">
    <title>知农之家官方网站-互联网养殖</title>
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
                            <a href="<%=basePath%>home/user">
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span>个人中心</span>
                            </a>
                        </li>

                        <c:choose>
                            <c:when test="${loginName == null || loginName == ''}">
                                <li>
                                    <a href="<%=basePath%>home/login">
                                        <span class="glyphicon glyphicon-user"></span>
                                        <span>登录</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<%=basePath%>home/reg">
                                        <span class="glyphicon glyphicon-cog"></span>
                                        <span>注册</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="<%=basePath%>home/signout">
                                        <span class="glyphicon glyphicon-cog"></span>
                                        <span>退出</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
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
                    <a href=""><img src="<%=basePath%>home/images/logo.png" title="乐农" alt="乐农"></a>
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
                                <a href="<%=basePath%>" alt="首页" style=" " class="">首页</a>
                             </li>
                             <li>
                                <a href="<%=basePath%>home/raise" alt="掘金农场" style="" class="">掘金农场</a>
                             </li>
                             <li>
                                <a href="<%=basePath%>home/market" alt="欢乐集市" style="" class="">欢乐集市</a>
                             </li>
                             <li>
                                <a href="<%=basePath%>home/science" alt="科学种养" style="" class="uline">科学种养</a>
                             </li>
                             <li>
                                <a href="<%=basePath%>home/user" alt="用户中心" style="" class="">用户中心</a>
                             </li>
                             <li>
                                <a href="<%=basePath%>home/about" alt="关于我们" style="" class="">关于我们</a>
                             </li>
                             <li><a href="<%=basePath%>home/news" alt="媒体报道" style="" class="">媒体报道</a>
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

    <!-- 轮播图 -->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">

            <div class="item active">
              <img src="<%=basePath%>home/images/slide/3.jpg" alt="...">
              <div class="carousel-caption">
                <p>再没有比春雨洗浴后的青山更迷人了，整个山坡，都是苍翠欲滴的浓绿，没来得散尽的雾气像淡雅丝绸，一缕缕地缠在它的腰间，阳光把每片叶子上的雨滴，都变成了五彩的珍珠</p>
              </div>
            </div>

            <div class="item">
              <img src="<%=basePath%>home/images/slide/2.jpg" alt="...">
              <div class="carousel-caption">
                <p>炎炎的太阳，高悬在世界的当空。红的光如火箭般射到地面，地面着火了，反射出油一般在沸煎的火焰来。蒸腾，窒塞，酷烈，奇闷，简直要使人们底细胞与纤维，由颤抖而炸裂了。</p>
              </div>
            </div>

            <div class="item">
              <img src="<%=basePath%>home/images/slide/1.jpg" alt="...">
              <div class="carousel-caption">
                <p>双十一来掘金，赢百元现金！双十一来掘金，赢百元现金！双十一来掘金，赢百元现金！双十一来掘金，赢百元现金！双十一来掘金，赢百元现金！双十一来掘金，赢百元现金！</p>
              </div>
            </div>

            <div class="item">
              <img src="<%=basePath%>home/images/slide/4.jpg" alt="...">
              <div class="carousel-caption">
                <p>自然世界此刻是如此的美丽:到处放射着明媚的阳光,到处炫耀着五颜的色彩,到处飞扬着悦耳的鸟叫虫鸣,到处飘荡着令人陶醉的香气。</p>
              </div>
            </div>
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
                <ul>
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
        <footer class="footer">
            <div class="" style="width: 1200px;margin: 0 auto">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3"><img src="<%=basePath%>home/images/logo.png" alt="" style="margin-top: 20px;"></div>
                        <div class="col-md-6">
                            <div class="footer_menu">
                                <ul>
                                    <li>关于我们</li>
                                    <li>联系我们</li>
                                    <li>常见问题</li>
                                    <li>加入我们</li>
                                </ul>
                                <div class="copytright">
                                    <img src="<%=basePath%>home/images/footer/copyright.png" alt="" style="width: 20px">
                                    <span style="margin-left: 10px;">赣公网安备14010902000157号 赣ICP备14001940号-4 </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <img src="<%=basePath%>home/images/footer/mywx.png" alt="" width="100px">
                            <img src="<%=basePath%>home/images/footer/mygzh.jpg" alt="" width="100px" style="margin-left: 10px;">
                        </div>
                    </div>
                </div>
            </div>
        </footer>
       
    </div>
   
   
    <!-- 回到顶部 -->
    <div class="gotop" style="display: none;"></div>
</body>
<script src="<%=basePath%>home/js/index.js"></script>
</html>