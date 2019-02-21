<%--
  Created by liqiang at 2019/1/17 
--%>
<%@page contentType="text/html;charset=utf-8" language="java" %>
<%@page pageEncoding="UTF-8" %>
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
                        <c:when test="${user == null}">
                            <li>
                                <a href="<%=basePath%>home/signin">
                                    <span class="glyphicon glyphicon-user"></span>
                                    <span>登录</span>
                                </a>
                            </li>
                            <li>
                                <a href="<%=basePath%>home/signup">
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
        <div class="container">
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
                <nav class="navbar">
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
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                新闻资讯 <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                            </ul>
                        </li>
                        <li>
                            <a href="<%=basePath%>home/user" alt="用户中心" style="" class="">用户中心</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>home/about" alt="关于我们" style="" class="">关于我们</a>
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
                            z-index: 105;
                            margin-top:10px;
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

                    <div class="Search">
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
<script>
    //初始化所有新闻类别信息
    var initAllNewsType = function(){
        $.ajax({
            url:"<%=basePath%>home/newsCat/initAllNewsType",
            type:"GET",
            dataType:"json",
            success:function (data,status,jqXHR) {
                if(data.msg.success){
                    var typeName = "";
                    var tagName = "";
                    for(var i=0;i<data.newsCats.length;i++){
                        typeName += "<li><a href='<%=basePath%>home/news/selectNewsByCatId?" +
                        "catId="+data.newsCats[i].id+"'>"+data.newsCats[i].name+"</a></li>";
                        tagName += "<a href='<%=basePath%>home/news/selectNewsByCatId?" +
                            "catId="+data.newsCats[i].id+"'>"+data.newsCats[i].name+"</a>";
                    }
                }
                $(".dropdown-menu").html(typeName);
                $(".cloud").find('ul').html(tagName);
            },
            error:function (jqXHR) {
                layer.mgs("接口服务错误，请检查后重试!");
            }
        });
    };

    $(document).ready(function () {
        initAllNewsType();
    });
</script>

