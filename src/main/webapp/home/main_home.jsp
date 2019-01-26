<%--
  Created by liqiang at 2018/10/14 
--%>
<%@page contentType="text/html;charset=utf-8" language="java" %>
<%@page pageEncoding="UTF-8" %>
<%
    //项目名
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--jstl 核心库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--jstl 格式化标签库--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--jstl 函数标签库--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--自定义分页标签--%>
<%@ taglib prefix="m" uri="MyPager-tag"%>
<link rel="stylesheet" href="<%=basePath%>home/css/home.css">
<link rel="stylesheet" href="<%=basePath%>public/bs/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>public/css/validationEngine.jquery.css">
<%--必须在引入bootstrap.js之前导入--%>
<script src="<%=basePath%>public/js/jquery.js" charset="UTF-8" type="text/javascript"></script>
<script src="<%=basePath%>public/bs/js/bootstrap.js"></script>
<script src="<%=basePath%>public/js/docs.min.js"></script>
<script src="<%=basePath%>public/js/bootstrap-select.min.js"></script>
<script src="<%=basePath%>public/js/jquery.validationEngine.js"></script>
<script src="<%=basePath%>public/layer-v3.1.1/layer.js"></script>
