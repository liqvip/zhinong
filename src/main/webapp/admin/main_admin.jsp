<%--
  Created by liqiang at 2018/10/14 
--%>
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
<link rel="stylesheet" href="<%=basePath%>public/css/pager.css" />
<link rel="stylesheet" href="<%=basePath%>public/zTree/css/zTreeStyle.css">
<link rel="stylesheet" href="<%=basePath%>admin/css/admin.css">
<link rel="stylesheet" href="<%=basePath%>public/bs/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>public/css/bootstrap-select.min.css">
<link rel="stylesheet" href="<%=basePath%>public/css/validationEngine.jquery.css">
<link rel="stylesheet" href="<%=basePath%>public/webuploader-0.1.5/webuploader.css">
<link rel="stylesheet" href="<%=basePath%>public/summernote-0.8.11/summernote.css">
<link rel="stylesheet" href="<%=basePath%>public/jquery-ui-1.12.1.custom/jquery-ui.min.css" charset="UTF-8">
<%--必须在引入bootstrap.js之前导入--%>
<script src="<%=basePath%>public/js/jquery.js"></script>
<script src="<%=basePath%>public/bs/js/bootstrap.js"></script>
<script src="<%=basePath%>public/js/docs.min.js"></script>
<script src="<%=basePath%>public/js/bootstrap-select.min.js"></script>
<script src="<%=basePath%>public/js/jquery.validationEngine.js"></script>
<script src="<%=basePath%>public/layer-v3.1.1/layer.js"></script>
<script src="<%=basePath%>public/zTree/js/jquery.ztree.core.js"></script>
<script src="<%=basePath%>public/webuploader-0.1.5/webuploader.js"></script>
<script src="<%=basePath%>public/summernote-0.8.11/summernote.js"></script>
<script src="<%=basePath%>public/echarts-3.8.4/echarts.js"></script>
<script src="<%=basePath%>public/jquery-ui-1.12.1.custom/jquery-ui.min.js" charset="UTF-8"></script>

