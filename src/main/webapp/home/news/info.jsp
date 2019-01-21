<%--
  Created by liqiang at 2019/1/19 
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <%@include file="../main_home.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>home/css/news_info.css">
    <title>详情页</title>
</head>
<body>
<%@include file="../header.jsp"%>
<article>
    <div class="tool-box">
        <!-- 分享 -->
        <ul>
            <li><script type="text/javascript">
                (function() {
                    var p = {
                        url : location.href, /*获取URL，可加上来自分享到QQ标识，方便统计*/
                        desc : '', /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
                        title : '${blog.title}', /*分享标题(可选)*/
                        summary : '${blog.introduction}', /*分享摘要(可选)*/
                        pics : '${blog.images}', /*分享图片(可选)*/
                        flash : '', /*视频地址(可选)*/
                        site : 'luotf个人网站', /*分享来源(可选) 如：QQ分享*/
                        style : '201',
                        width : 35,
                        height : 35
                    };
                    var s = [];
                    for (var i in p) {
                        s.push(i + '=' + encodeURIComponent(p[i] || ''));
                    }
                    document.write([ '<a title="分享到QQ" style="" href="http://connect.qq.com/widget/shareqq/index.html?', s.join('&'), '" target="_blank"><i class="fa fa-qq"></i><br>QQ</a>' ].join(''));
                })();
            </script> <script src="http://connect.qq.com/widget/loader/loader.js"
                              widget="shareqq" charset="utf-8"></script></li>
            <li><script type="text/javascript">
                (function() {
                    var p = {
                        url : location.href,
                        showcount : '1', /*是否显示分享总数,显示：'1'，不显示：'0' */
                        desc : '', /*默认分享理由(可选)*/
                        summary : '${blog.introduction}', /*分享摘要(可选)*/
                        title : '${blog.title}', /*分享标题(可选)*/
                        site : 'luotf个人网站', /*分享来源 如：腾讯网(可选)*/
                        pics : '${blog.images}', /*分享图片的路径(可选)*/
                        style : '201',
                        width : 113,
                        height : 39
                    };
                    var s = [];
                    for (var i in p) {
                        s.push(i + '=' + encodeURIComponent(p[i] || ''));
                    }

                    document.write([ '<a title="分享到空间" version="1.0" style="" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?', s.join('&'), '" target="_blank"><i class="fa fa-star"></i><br>空间</a>' ].join(''));
                })();
            </script> <script
                    src="http://qzonestyle.gtimg.cn/qzone/app/qzlike/qzopensl.js#jsdate=20111201"
                    charset="utf-8"></script></li>
            <li><script type="text/javascript">
                (function() {
                    var p = {
                        url : location.href,
                        title : '${blog.title}', /*分享标题(可选)*/
                        pic : '${blog.images}', /*分享图片的路径(可选)*/
                    };
                    var s = [];
                    for (var i in p) {
                        s.push(i + '=' + encodeURIComponent(p[i] || ''));
                    }
                    document.write([ '<a title="分享到微博"  style="" href="http://service.weibo.com/share/share.php?', s.join('&'), '" target="_blank"><i class="fa fa-weibo"></i><br>微博</a>' ].join(''));
                })();
            </script></li>
        </ul>
    </div>
    <div class="row">
        <div class="container">
            <div class="col-md-9">

            </div>
            <div class="col-md-3">
                <div class="cloud animated fadeIn whitebg">
                    <h2 class="cloud_hometitle">分类信息</h2>
                    <ul>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</article>
<%@include file="../footer.jsp"%>
<!-- 回到顶部 -->
<div class="gotop" style="display: none;"></div>
</body>
</html>
