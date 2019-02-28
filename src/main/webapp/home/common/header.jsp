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
                            <span>你好，欢迎来到知农之家！</span>
                        </a>
                    </li>
                    <c:choose>
                        <c:when test="${user == null}">
                            <li>
                                <span class="glyphicon glyphicon-user">  </span>
                            </li>
                            <li>
                                <a href="<%=basePath%>home/signin">
                                    <span>登录</span>
                                </a>
                            </li>
                            <li>
                                <a href="<%=basePath%>home/signup">
                                    <span>注册</span>
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="<%=basePath%>home/user">
                                    <span>
                                        <c:choose>
                                            <c:when test="${empty user.image}">
                                                <img src="<%=basePath%>home/user/default.jpg" class="userphoto">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${user.image}" class="userphoto">
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    <span>${user.username}</span>
                                </a>
                            </li>
                            <li>
                                <a href="<%=basePath%>home/user/logout">
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
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                新闻资讯 <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                            </ul>
                        </li>
                        <li>
                            <a href="<%=basePath%>home/about" alt="关于我们" style="" class="">关于我们</a>
                        </li>
                        <li class="clear"></li>
                    </ul>
                    <style>
                        .btn-primary1{
                            border-radius: 35px 0px 0px 0px;
                            color: #fff;
                            background: #338c22;
                        }
                        .Search{
                            border-bottom: 1px solid #338c22;
                            float: right;
                            height: 36px;
                            line-height: 36px;
                            position: relative;
                            width: 200px;
                            z-index: 105;
                            margin-top: 10px;
                            overflow: hidden;
                        }
                        .Search button,.Search input{
                            border: none;
                            outline: 0px;
                            background-color: #F6F6F6;
                        }
                        .Search button{
                            height: 34px;
                            font-size: 12px;
                            margin:0;
                            float:right;
                            background-color: #00B83F;
                        }
                        .Search input {
                            height: 40px;
                            line-height: 30px;
                            padding: 7px;
                            margin-left: 2px;
                            font-size: 14px;
                        }

                    </style>
                    <script>
                        $('.column li a').mouseenter(function(){
                            $(this).addClass('uline');
                            $('.column li a').not($(this)).removeClass('uline');
                        });
                    </script>
                    <div class="Search">
                        <form action="/home/raise" method="post">
                            <input name="name" placeholder="找农资" class="searchinput" autocomplete="off" type="text">
                            <button type="submit" class="btn btn-primary1">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </form>
                    </div>
                </nav>
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

