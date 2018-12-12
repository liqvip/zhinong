<%--
  Created by liqiang at 2018/12/12 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../main_admin.jsp"%>
<head>
    <title></title>
</head>
<body style="width: 100%;height: 100%">
<c:choose>
    <c:when test="${empty smenu}">
        <form action="<%=basePath%>admin/menu/add" method="post">
    </c:when>
    <c:otherwise>
        <input type="hidden" name="${smenu.id}">
        <form action="<%=basePath%>admin/menu/edit" method="post">
    </c:otherwise>
</c:choose>
    <div class="form-group" style="width: 500px">
        <label for="inputEmail3" class="col-sm-2 control-label">菜单名称</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputEmail3" name="name" value="${smenu.name}">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">目标地址</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputPassword3" name="murl" value="${smenu.murl}">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword4" class="col-sm-2 control-label">优先级</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputPassword4" name="priority" value="${smenu.priority}">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">父级菜单</label>
        <div class="col-sm-10">
            <select name="pid" id="" class="selectpicker" data-live-search="true">
                <option value="">无</option>
                <c:forEach items="${menus}" var="menu" varStatus="index">
                    <option value="${menu.id}">${menu.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>
</form>
</body>
</html>
