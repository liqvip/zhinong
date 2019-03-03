<%--
  Created by liqiang at 2019/1/19 
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <%@include file="../common/main_home.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>home/css/news_info.css">
    <title>详情页</title>
</head>
<body>
<%@include file="../common/header.jsp"%>
<article>
    <div class="tool-box">
        <!-- 分享 -->
        <ul>
            <li>
                <script type="text/javascript">
                    (function() {
                        var p = {
                            url : location.href, /*获取URL，可加上来自分享到QQ标识，方便统计*/
                            desc : '', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
                            title : '${snews.title}', /*分享标题(可选)*/
                            summary : '${snews.introduction}', /*分享摘要(可选)*/
                            pics : '${snews.images}', /*分享图片(可选)*/
                            flash : '', /*视频地址(可选)*/
                            site : '知农-互联网养殖', /*分享来源(可选) 如：QQ分享*/
                            style : '201',
                            width : 35,
                            height : 35
                        };
                        var s = [];
                        for (var i in p) {
                            s.push(i + '=' + encodeURIComponent(p[i] || ''));
                        }
                        document.write([ '<a title="分享到QQ" style="" href="http://connect.qq.com/widget/shareqq/index.html?', s.join('&'),
                            '" target="_blank"><span class="glyphicon glyphicon-user"></span><br>QQ</a>' ].join(''));
                    })();
                    </script>
                    <script src="http://connect.qq.com/widget/loader/loader.js"
                                      widget="shareqq" charset="utf-8">
                </script>
            </li>
            <li>
                <script type="text/javascript">
                    (function() {
                        var p = {
                            url : location.href,
                            showcount : '1', /*是否显示分享总数,显示：'1'，不显示：'0' */
                            desc : '', /*默认分享理由(可选)*/
                            summary : '${snews.introduction}', /*分享摘要(可选)*/
                            title : '${snews.title}', /*分享标题(可选)*/
                            site : '知农-互联网养殖', /*分享来源 如：腾讯网(可选)*/
                            pics : '${snews.images}', /*分享图片的路径(可选)*/
                            style : '201',
                            width : 113,
                            height : 39
                        };
                        var s = [];
                        for (var i in p) {
                            s.push(i + '=' + encodeURIComponent(p[i] || ''));
                        }

                        document.write([ '<a title="分享到空间" version="1.0" style="" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?', s.join('&'),
                            '" target="_blank"><span class="glyphicon glyphicon-star"></span><br>空间</a>' ].join(''));
                    })();
                </script>
                <script src="http://qzonestyle.gtimg.cn/qzone/app/qzlike/qzopensl.js#jsdate=20111201"
                    charset="utf-8"></script>
            </li>
            <li><script type="text/javascript">
                (function() {
                    var p = {
                        url : location.href,
                        title : '${snews.title}', /*分享标题(可选)*/
                        pic : '${snews.images}', /*分享图片的路径(可选)*/
                    };
                    var s = [];
                    for (var i in p) {
                        s.push(i + '=' + encodeURIComponent(p[i] || ''));
                    }
                    document.write([ '<a title="分享到微博"  style="" href="http://service.weibo.com/share/share.php?', s.join('&'),
                        '" target="_blank"><span class="glyphicon glyphicon-eye-open"></span><br>微博</a>' ].join(''));
                })();
            </script></li>
        </ul>
    </div>
    <div class="row">
        <div class="container">
            <div class="col-md-9">
                <div class="infos">
                    <div class="newsview ">
                        <h2 class="intitle">
                            您现在的位置是：<a href="<%=basePath%>">网站首页</a>&nbsp;&gt;&nbsp;<a href="<%=basePath%>">新闻资讯</a>
                        </h2>
                        <c:choose>
                            <c:when test="${empty snews}">
                                <h1 style="font-size:110px;text-align:center;margin:20px;">404</h1>
                                <h3 style="text-align:center;" class="font-bold">抱歉，你所访问的页面不存在~</h3>
                                <h4 style="margin-top:55px;text-align:center;">
                                    <a style="background-color: #676a6c;padding: 5px 10px;color: #fff;border-radius: 10px;"
                                            href="<%=basePath%>">去首页</a>
                                </h4>
                            </c:when>
                            <c:otherwise>
                                <h3 class="news_title animated fadeIn">${snews.title}</h3>
                                <div class="news_author animated fadeIn">
                                    <span class="glyphicon glyphicon-user"></span>liq
                                    <span class="glyphicon glyphicon-calendar"></span><fmt:formatDate value="${snews.addtime}" pattern="yyyy-MM-dd"/>
                                    <span>共 <b>${snews.clicknum}</b> 人围观</span>
                                </div>
                                <div class="news_about animated fadeIn">
                                    <strong>简介</strong>${snews.introduction}</div>
                                <div class="news_infos animated fadeIn">${snews.content}</div>
                                <br>
                                <br>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="nextinfo animated fadeIn">
                    <p>上一篇：
                        <span class="pre">
                            <c:choose>
                                <c:when test="${empty preNews}">
                                    <span>到顶啦 (ಥ﹏ಥ)</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="<%=basePath%>home/news/${preNews.id}/selectNewsById">${preNews.title}</a>
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </p>
                    <p>下一篇：
                        <span class="next">
                            <c:choose>
                                <c:when test="${empty nextNews}">
                                    <span>到底啦 (ಥ﹏ಥ)</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="<%=basePath%>home/news/${nextNews.id}/selectNewsById">${nextNews.title}</a>
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </p>
                </div>
            </div>

            <div class="col-md-3">
                <div class="tuijian2  animated fadeIn whitebg">
                    <h2 class="cloud_hometitle">点击排行</h2>
                    <ul class="sidenews">
                        <c:forEach items="${clickNews}" var="item" varStatus="id">
                            <li>
                                <i><img src="${item.images}" alt=""></i>
                                <p>
                                    <a href="<%=basePath%>home/news/${item.id}/selectNewsById">
                                        <c:choose>
                                            <c:when test="${fn:length(item.title) > 10}">
                                                <c:out value="${fn:substring(item.title, 0, 10)} ......" />
                                            </c:when>
                                            <c:otherwise>
                                                ${item.title}
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </p>
                                <span>[<fmt:formatDate value="${item.addtime}" pattern="yyyy-MM-dd"/>]</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</article>
<%@include file="../common/footer.jsp"%>
<!-- 回到顶部 -->
<div class="gotop" style="display: none;"></div>
</body>
</html>
