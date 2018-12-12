<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
   	<%@include file="main_admin.jsp"%>
	<title>知农后台</title>
</head>
<body>
	<!-- 导航条 -->
	<nav class="navbar navbar-inverse">
	  <div class="container">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mynavbar" aria-expanded="false">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="">知农后台</a>
	    </div>

	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="mynavbar">
	      <ul class="nav navbar-nav">
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="">首页</a></li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">后台管理<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">admin</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">退出系统</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>


	<div class="row">
		<!-- 左侧设计 -->
		<div class="col-md-2">
			<div id="menu_tree" class="ztree">

			</div>
		</div><!--col-md-2-->

		<!-- 右侧设计 -->
		<div class="col-md-10">
            <div id="page_content">
				<iframe src="" frameborder="0" scrolling="no" width="100%" height="700px"></iframe>
	  		</div>
		</div><!--col-md-10-->

	</div><!--row-->

</body>
<script>
	var zTreeObj;
	var setting = {
        async: {
            enable: true,
            url: "<%=basePath%>admin/menuClick",
            autoParam: ["id"]
        },

		callback:{
            onClick:menuClick
		}
	};

	$(document).ready(function () {
		zTreeObj = $.fn.zTree.init($("#menu_tree"),setting);
    });

	function menuClick(e,treeId,treeNode) {
		if(treeNode.isParent)
		   return;
        $("iframe").attr("src","<%=basePath%>admin/"+treeNode.murl);
    }
</script>
</html>
