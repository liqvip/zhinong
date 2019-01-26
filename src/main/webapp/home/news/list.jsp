<%--
  Created by liqiang at 2019/1/19 
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <%@include file="../main_home.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>home/css/news_list.css">
    <title>列表页</title>
</head>
<body>
<%@include file="../header.jsp"%>
<article>
    <div class="row">
        <div class="container">
            <div class="col-md-9">
                <div class="newnews newslist">
                    <h2 class="hometitle">${news[0].newsCat.name}</h2>
                    <ul>
                        <c:forEach items="${news}" var="item" varStatus="id">
                            <li>
                                <h3 class="newstitle">
                                    <a href="<%=basePath%>home/news/selectNewsById?id=${item.id}" target="_blank">${item.title}</a>
                                </h3>
                                <span class="newspic imgscale">
                                <a target="_blank" href="<%=basePath%>home/news/selectNewsById?id=${item.id}">
                                    <img src="${item.images}" alt="">
                                </a>
                            </span>
                                <p class="newstext">${item.introduction}</p>
                                <p class="newsinfo">
                                    <span>liq</span>
                                    <span><fmt:formatDate value="${item.addtime}" pattern="yyyy-MM-dd HH:mm"/></span>
                                    <span>浏览(${item.clicknum})</span>
                                </p>
                                <a target="_blank" href="<%=basePath%>home/news/selectNewsById?id=${item.id}" class="viewmore">阅读原文</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <m:pager pageIndex="${page.pageIndex}" pageSize="${page.pageSize}"
                             totalNum="${page.totalNum}" submitUrl="${page.submitUrl}"/>
                </div>
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
