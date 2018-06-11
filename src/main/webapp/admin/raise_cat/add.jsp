<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<script src="../../public/js/jquery.js"></script>
	<script src="../../public/js/docs.min.js"></script>
	<script src="../../public/bs/js/bootstrap.js"></script>
	<link rel="stylesheet" href="../../public/bs/css/bootstrap.css">
	<link rel="stylesheet" href="../../public/css/bootstrap-select.min.css">
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
			      	<li class="list-group-item"><a href="../admin/index.jsp">管理员查看</a></li>
			      	<li class="list-group-item"><a href="../admin/add.jsp">管理员添加</a></li>
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
			      	<li class="list-group-item"><a href="./index.jsp">分类查看</a></li>
			      	<li class="list-group-item"><a href="">分类添加</a></li>
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
			<form action="add" method="post">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">分类信息</h3>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label for="">分类名称：</label>
							<input type="text" name="catName" id="" class="form-control">
						</div>
						<div class="form-group">
							<label for="" style="display:block;">父类型：<small>默认为0,可不填</small></label>
                            <select class="selectpicker" name="parentId">
                                <option value="0">0</option>
                            </select>
						</div>
						<div class="form-group">
							<input type="submit" value="添加" class="btn btn-primary">
							<input type="reset" value="取消" class="btn btn-warning">
						</div>
					</div>
				</div>
			</form>
            <%--获取农资分类--%>
			<script>
                $(document).ready(function () {
                    $.ajax({
                        url:"../raise_cat/scanall",
                        method:"GET",
                        dataType:"JSON",
                        success:function (data,status,jqXHR) {
                            raiseCatStr = "";

                            for(var i=0;i<data.length;i++){
                                raiseCatStr+="<option value='"+data[i].raiseCatId+"'>"+data[i].catName+"</option>";
                            }

                            $("[name='parentId']").append(raiseCatStr);
                        },
                        error:function (jqXHR) {
                            alert(jqXHR.status);
                        }
                    });
                });

			</script>

			<%--异步添加分类--%>
			<script>
				$("form").submit(function (e) {
					e.preventDefault();
					var form =$(this);
					$.ajax({
						url:form.attr("action"),
						method:form.attr("method"),
						dataType:"JSON",
						data:form.serialize(),
						success:function (data,status,jqXHR) {
							if(data.success)	{
							    alert(data.msg);
							}else{
                                alert(data.msg);
							}
                        },
						error:function (jqXHR) {
							alert("发生错误："+jqXHR.status);
                        }
					});
                });
			</script>
		</div><!--col-md-10-->

	</div><!--row-->
</body>
<script>
</script>
</html>
