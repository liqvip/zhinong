<%@ page import="java.util.Date" %>
<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <% long nowTime = new Date().getTime(); request.setAttribute("nowTime", nowTime); %>
    <%@include file="../common/main_home.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>home/css/raise.css">
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="../images/favicon.ico">
	<title>知农之家官方网站-互联网养殖</title>
</head>
<body>
    <%@include file="../common/header.jsp"%>
    <div class="content">
    	<div class="raise_content" style="width: 1200px;margin:0 auto;">
            <div class="raise_banner">
                <img src="<%=basePath%>home/images/raise/raise_index_banner.jpg" alt="">
            </div>
    		<div class="raise_head">
    			<h2>认养品种</h2>
    			<ul>
    				<li><a href="<%=basePath%>home/raise" class="cur">全部</a></li>
					<c:forEach items="${raiseCats}" var="item" varStatus="id">
                        <c:choose>
                            <c:when test="${sraise.catId eq item.id}">
                                <script type="text/javascript">
                                    $(".cur").removeClass("cur");
                                </script>
                                <li><a href="<%=basePath%>home/raise?catId=${item.id}" class="cur">${item.name}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="<%=basePath%>home/raise?catId=${item.id}">${item.name}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
    			</ul>
    		</div>
			<div class="raise_body">
				<div class="container">
					<div class="row">
                        <c:forEach items="${raise}" var="item" varStatus="id">
                            <div class="raise_item">
                                <div class="raise_img">
                                    <a href="<%=basePath%>home/raise/${item.id}/detail">
                                        <img src="${item.images}" alt="">
                                    </a>
                                </div>
                                <h2>${item.name}</h2>
                                <em></em>
                                <div class="raise_pm">
                                    <i>￥${item.price}元/份</i>
                                    <b>剩余：${item.stock}份</b>
                                </div>
                                <c:choose>
                                    <%--秒杀未开始,计时--%>
                                    <c:when test="${nowTime lt item.startTime.time}">
                                        <a href="<%=basePath%>home/raise/${item.id}/detail" class="raise_btn01">未开始</a>
                                    </c:when>
                                    <%--秒杀已结束--%>
                                    <c:when test="${nowTime gt item.endTime.time}">
                                        <a href="<%=basePath%>home/raise/${item.id}/detail" class="raise_btn03">已结束</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<%=basePath%>home/raise/${item.id}/detail" class="raise_btn02">立即认养</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
					</div>
				</div>
			</div>
            <m:pager pageIndex="${page.pageIndex}" pageSize="${page.pageSize}"
                     totalNum="${page.totalNum}" submitUrl="${page.submitUrl}"/>
    	</div>

    </div>
    <%@include file="../common/footer.jsp"%>
    <!-- 回到顶部 -->
    <div class="gotop" style="display: none;"></div>
</body>
</html>