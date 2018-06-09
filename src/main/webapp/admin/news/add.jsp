<%@page contentType="text/html; charset=utf-8" language="java" %>
<%
	if(session.getAttribute("loginName") == null){
		response.sendRedirect("../login.html");
	}

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
	<script src="../js/wangEditor3.js"></script>
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
			      	<li class="list-group-item"><a href="./index.jsp">用户查看</a></li>
			      	<li class="list-group-item"><a href="./add.jsp">用户添加</a></li>
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
			    <div class="panel-heading" role="tab" id="headingf">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
			        	农资管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapsef" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingfour">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="../raise/index.jsp">农资查看</a></li>
			      	<li class="list-group-item"><a href="../raise/add.jsp">农资添加</a></li>
			      </ul>
			    </div>
			  </div>

			  <!-- 新闻管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingfour">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
			        	新闻管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapsefour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingfour">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="./index.jsp">新闻查看</a></li>
			      	<li class="list-group-item"><a href="">新闻添加</a></li>
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

			  <!-- 新闻分类管理 -->
			  <div class="panel panel-primary">
			    <div class="panel-heading" role="tab" id="headingsix">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsesix" aria-expanded="false" aria-controls="collapsesix">
			        	新闻分类管理
			        </a>
			      </h4>
			    </div>
			    <div id="collapsesix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingsix">
			      <ul class="list-group">
			      	<li class="list-group-item"><a href="../news_cat/index.jsp">分类查看</a></li>
			      	<li class="list-group-item"><a href="../news_cat/add.jsp">分类添加</a></li>
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
			      	<li class="list-group-item"><a href="./index.jsp">新闻查看</a></li>
			      	<li class="list-group-item"><a href="">新闻添加</a></li>
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
			<form action="" method="post">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">添加新闻</h3>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label for="">新闻标题：</label>
							<input type="text" name="newsTitle"  class="form-control">
						</div>
                        <div id="editor">
							<p>这里输入内容</p>
						</div>
						<div class="form-group">
							<label for="" style="display:block;">新闻分类</label>
							<select class="selectpicker" name="newsCatId">
							</select>
						</div>
						<div class="form-group">
							<input type="submit" value="添加" class="btn btn-primary">
							<input type="reset" value="取消" class="btn btn-warning">
						</div>
					</div>
				</div>
			</form>
		</div><!--col-md-10-->

	</div><!--row-->
</body>
<script>
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    // tab显示和隐藏
    // 下面两个配置，使用其中一个即可显示“上传图片”的tab。但是两者不要同时使用！！！
    //editor.customConfig.uploadImgShowBase64 = true;   // 使用 base64 保存图片
    //限制一次最多上传5张图片
    editor.customConfig.uploadImgMaxLength = 5
    //将图片大小限制为3M
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024
    // 上传图片到服务器
    editor.customConfig.uploadImgServer = '/admin/news/upload';
    //	自定义 fileName
    editor.customConfig.uploadFileName = 'file';

 	//   可使用监听函数在上传图片的不同阶段做相应处理
    editor.customConfig.uploadImgHooks = {
        before: function (xhr, editor, files) {
            // 图片上传之前触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件

            // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
            // return {
            //     prevent: true,
            //     msg: '放弃上传'
            // }
        },
        success: function (xhr, editor, result) {
            // 图片上传并返回结果，图片插入成功之后触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
        },
        fail: function (xhr, editor, result) {
            // 图片上传并返回结果，但图片插入错误时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
        },
        error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
        },
        timeout: function (xhr, editor) {
            // 图片上传超时时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
        },

        // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
        // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
			console.log(result);
            var url = "<%=basePath%>"+"admin/images/news/"+result.url;
            insertImg(url);

            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    }
    editor.create();

	<%--异步请求获得新闻类型--%>
	$(document).ready(function () {

		$.ajax({
			url:"../news_cat/scanall",
			method:"GET",
			dataType:"JSON",
			success:function (data,status,jqXHR) {
				newsCatStr = "";

				for(var i=0;i<data.length;i++){
					newsCatStr+="<option value='"+data[i].newsCatId+"'>"+data[i].catName+"</option>";
				}

				$("[name='newsCatId']").append(newsCatStr);
			},
			error:function (jqXHR) {
				alert(jqXHR.status);
			}
			});
	});

//        异步添加新闻
    $("form").submit(function (e) {
        e.preventDefault();
        $.ajax({
            url:"add",
            method:"POST",
            data:{
                newsCatId:$("[name='newsCatId']").val(),
				newsTitle:$("[name='newsTitle']").val(),
				newsContent:editor.txt.html()
			},
            dataType:"JSON",
            success:function (data,status,jqXHR) {
                if(data.success){
                    alert(data.msg);
                    window.location.href="./index.jsp";
                }else {
                    alert(data.msg);
                }
            },
            error:function (jqXHR) {
                    alert(jqXHR.status);
            }
        });
    });

</script>
</html>
