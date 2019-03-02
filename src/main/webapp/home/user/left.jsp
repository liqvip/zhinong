<%@page contentType="text/html;charset=utf-8" language="java" %>
<div class="profile" style="background-color: #FFFFFF">
    <c:choose>
        <c:when test="${empty user.image}">
            <img src="/home/user/default.jpg" alt="">
        </c:when>
        <c:otherwise>
            <img src="${user.image}" alt="">
        </c:otherwise>
    </c:choose>
    <p>${user.name}</p>
</div>
<div class="list-group" style="text-align: center;">
    <a href="<%=basePath%>home/user/binding" class="list-group-item">账号绑定</a>
    <a href="<%=basePath%>home/user/order" class="list-group-item">我的订单</a>
</div>