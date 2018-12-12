<%--
  Created by liqiang at 2018/10/14 
--%>
<%
    //项目名
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="<%=basePath%>home/css/home.css">
<link rel="stylesheet" href="<%=basePath%>public/bs/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>public/css/validationEngine.jquery.css">
<%--必须在引入bootstrap.js之前导入--%>
<script src="<%=basePath%>public/js/jquery.js"></script>
<script src="<%=basePath%>public/bs/js/bootstrap.js"></script>
<script src="<%=basePath%>public/js/docs.min.js"></script>
<script src="<%=basePath%>public/js/bootstrap-select.min.js"></script>
<script src="<%=basePath%>public/js/jquery.validationEngine.js"></script>
<script src="<%=basePath%>public/js/layer.js"></script>
