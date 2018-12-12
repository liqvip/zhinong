<%--
  Created by liqiang at 2018/10/14 
--%>
<%
    //项目名
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="m" uri="MyPager-tag"%>
<link rel="stylesheet" href="<%=basePath%>public/css/pager.css" />
<link rel="stylesheet" href="<%=basePath%>public/zTree/css/zTreeStyle.css">
<link rel="stylesheet" href="<%=basePath%>admin/css/admin.css">
<link rel="stylesheet" href="<%=basePath%>admin/css/news.css" />
<link rel="stylesheet" href="<%=basePath%>public/bs/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>public/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=basePath%>public/css/validationEngine.jquery.css">
<%--必须在引入bootstrap.js之前导入--%>
<script src="<%=basePath%>public/js/jquery.js"></script>
<script src="<%=basePath%>public/bs/js/bootstrap.js"></script>
<script src="<%=basePath%>public/js/docs.min.js"></script>
<script src="<%=basePath%>public/js/bootstrap-select.min.js"></script>
<script src="<%=basePath%>public/js/jquery.validationEngine.js"></script>
<script src="<%=basePath%>public/layer-v3.1.1/layer.js"></script>
<script src="<%=basePath%>public/zTree/js/jquery.ztree.core.js"></script>
