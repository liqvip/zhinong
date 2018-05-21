<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<script src="../../public/js/jquery.js"></script>
	<script src="../../public/js/docs.min.js"></script>
	<script src="../../public/bs/js/bootstrap.js"></script>
	<link rel="stylesheet" href="../../public/bs/css/bootstrap.css">	
	<link rel="stylesheet" href="../css/admin.css">	
	<title>知农后台</title>
	<style>
	</style>
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
	      <a class="navbar-brand" href="../index.jsp">知农后台</a>
	    </div>

	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="mynavbar">
	      <ul class="nav navbar-nav">
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#">首页</a></li>
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
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			  <!-- 用户管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingone">
			      <h4 class="panel-title">
			        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseone" aria-expanded="true" aria-controls="collapseone">
			        	用户管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapseone" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingone">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="../user/index.jsp">用户查看</a></li>
			      	<li class="list-group-item"><a href="../user/add.jsp">用户添加</a></li>
			      </ul>
			    </div>
			  </div>

			  <!-- 管理员管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingtwo">
			      <h4 class="panel-title">
			        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsetwo" aria-expanded="true" aria-controls="collapsetwo">
			        	管理员管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapsetwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingtwo">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="">管理员查看</a></li>
			      	<li class="list-group-item"><a href="./add.jsp">管理员添加</a></li>
			      </ul>
			    </div>
			  </div>

			  <!-- 订单管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingthree">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsethree" aria-expanded="false" aria-controls="collapsethree">
			        	订单管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapsethree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingthree">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="../order/index.jsp">订单查看</a></li>
			      </ul>
			    </div>
			  </div>

			  <!-- 农资管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingfour">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
			        	农资管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapsefour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingfour">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="../raise/index.jsp">农资查看</a></li>
			      	<li class="list-group-item"><a href="../raise/add.jsp">农资添加</a></li>
			      </ul>
			    </div>
			  </div>

			  <!-- 农场管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingfive">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsefive" aria-expanded="false" aria-controls="collapsefive">
			        	农场管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapsefive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingfive">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="../farm/index.jsp">农场查看</a></li>
			      	<li class="list-group-item"><a href="../farm/add.jsp">农场添加</a></li>
			      </ul>
			    </div>
			  </div>

			  <!-- 农资分类管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingsix">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsesix" aria-expanded="false" aria-controls="collapsesix">
			        	农资分类管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapsesix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingsix">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="../raise_cat/index.jsp">分类查看</a></li>
			      	<li class="list-group-item"><a href="../raise_cat/add.jsp">分类添加</a></li>
			      </ul>
			    </div>
			  </div>

			  <!-- 新闻管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingseven">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseseven" aria-expanded="false" aria-controls="collapseseven">
			        	新闻管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapseseven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingseven">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="../news/index.jsp">新闻查看</a></li>
			      	<li class="list-group-item"><a href="../news/add.jsp">新闻添加</a></li>
			      </ul>
			    </div>
			  </div>

			  <!-- 新闻分类管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingeight">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseeight" aria-expanded="false" aria-controls="collapseeight">
			        	新闻分类管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapseeight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingeight">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="../news_cat/index.jsp">分类查看</a></li>
			      	<li class="list-group-item"><a href="../news_cat/add.jsp">分类添加</a></li>
			      </ul>
			    </div>
			  </div>

			  <!-- 公告管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingnine">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsenine" aria-expanded="false" aria-controls="collapsenine">
			        	公告管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapsenine" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingnine">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="../notice/index.jsp">公告查看</a></li>
			      	<li class="list-group-item"><a href="../notice/add.jsp">公告添加</a></li>
			      </ul>
			    </div>
			  </div>

			</div><!--panel-group-->
		</div><!--col-md-2-->	

		<!-- 右侧设计 -->
		<div class="col-md-10">
		  <table class="table table-striped table-bordered">
		  	<tbody>
			  	<tr>
			  		<th>账号</th>
		  			<th>密码</th>
		  			<th>注册时间</th>
		  			<th>删除</th>
		  			<th>修改</th>
			  	</tr>	
			  	<tr>
			  		<td>user1</td>
			  		<td>123</td>
			  		<td>2015-3-03</td>
			  		<td><a href="" data-toggle="modal" data-target="#deletemodal">删除</a></td>
			  		<td><a href="" data-toggle="modal" data-target="#modifymodal">修改</a></td>
			  	</tr>
		  	</tbody>
		  </table>

		  <!-- 底部分页 -->
		   <ul class="pagination">
		    <li><a href="#">上一页</a></li>
		    <li class="active"><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li><a href="#">下一页</a></li>
		  </ul>

		</div><!--col-md-10-->

	</div><!--row-->

	<!-- 删除modal -->
	<div class="modal fade" id="deletemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">用户删除</h4>
	      </div>
	      <div class="modal-body">
	      	<h4 class="text-danger">你确定要删除该用户吗?</h4>	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary">确定</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 修改modal -->
	<div class="modal fade" id="modifymodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">管理员信息修改</h4>
	      </div>
	      <div class="modal-body">
	      	<form action="">
	      		<div class="form-group">
	      			<label for="">账号:</label>
	      			<input type="text" class="form-control">
	      		</div>
	      		<div class="form-group">
	      			<label for="">密码:</label>
	      			<input type="text" class="form-control">
	      		</div>
	      	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary">修改</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
<script>
</script>
</html>
