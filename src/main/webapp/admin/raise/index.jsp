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
						<li class="list-group-item"><a href="">农资查看</a></li>
						<li class="list-group-item"><a href="./add.jsp">农资添加</a></li>
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
			<tr>
				<th>分类ID</th>
				<th>农场ID</th>
				<th>名称</th>
				<th>农资图片</th>
				<th>农资缩略图</th>
				<th>市场价(元)</th>
				<th>养成周期(月)</th>
				<th>养成收益(元)</th>
				<th>库存</th>
				<th>期数</th>
				<th>删除</th>
				<th>修改</th>
			</tr>
		</table>
		<!-- 底部分页 -->
		<ul class="pagination">
            <li><a href="#" id="first">首页</a></li>
			<li><a href="#" id="pre">上一页</a></li>
			<li><a href="#" id="next">下一页</a></li>
			<li><a href="#" id="last">尾页</a></li>
		</ul>
        <p class="text-primary" style="padding-left: 5px">
            当前第<span id="curPage">1</span>页&nbsp;&nbsp;
            共<span id="totPage">0</span>页
        </p>
		<%--异步请求获取用户数据--%>
<script>
	$(document).ready(function(){
	    var curPage= 1;
		$.ajax({
			url:"scan/"+curPage,
			method:"GET",
			dataType:"json",
			success:function(data,status,jqXHR){
                var tableStr = "";
			   for(var i=0;i<data.list.length;i++) {
			      // 表格拼接
			      tableStr+="<tr>" +
					  "<td>"+data.list[i].raiseCatId+"</td>" +
                      "<td>"+data.list[i].farmId+"</td>" +
					  "<td>"+data.list[i].raiseName+"</td>" +
                      "<td>-</td>" +
                      "<td><img src='../images/raise/"+data.list[i].raiseThums+"' alt=''></td>" +
                      "<td>"+data.list[i].marketPrice+"</td>" +
                      "<td>"+data.list[i].raiseCycle+"</td>" +
                      "<td>"+data.list[i].raiseProfit+"</td>" +
                      "<td>"+data.list[i].raiseStock+"</td>" +
                      "<td>"+data.list[i].raisePeriod+"</td>" +
					  "<td><a href='' data-toggle='modal' data-target='#deletemodal' id='delete' code='"+data.list[i].raiseId+"'>删除</a></td>"+
					  "<td><a href='' data-toggle='modal' data-target='#modifymodal' id='modify' code='"+data.list[i].raiseId+"'>修改</a></td>"+
					  "</tr>";
			   }
                $("table").append(tableStr);
                /*底部数字分页算法*/
                /*
                    start,显示时候起始页码
                    end,显示时的终止页码
                    totPage,数据的总页数
                    curPage,当前页码
                    link_count,期望的链接数量
                * */
                var link_count = 5;
                var start = Math.max(1, curPage - parseInt(link_count/2));
                var end = Math.min(data.totPage, start + link_count - 1);
                start = Math.max(1, end - link_count + 1);

                console.log("start:"+start);
                console.log("end:"+end);
            //    页码拼接
                var numStr = "";

                for(i=start;i<=end;i++){
                    numStr+="<li><a href='javascript:void()'>"+i+"</a></li> ";
                }

                $("#pre").parent().after(numStr);
                $("#pre").parent().next().addClass("active");
                $("#first,#pre").addClass("disabled").addClass("btn");
            //     总共多少页
                $("#totPage").text(data.totPage);
            },
			error:function (jqXHR) {
				alert(jqXHR.status);
			}
		});
	});
</script>
        <%--页码点击事件--%>
		<script>
            var curPage = $("#curPage").text();

			$(document).on("click",".pagination>li>a",function (event) {
			    $("table tr:not(:first)").remove();
                //判断点击的页码是多少
                if($(this).attr("id")=="first" || $(this).text()==1){
                    $("#first,#pre").addClass("disabled").addClass("btn");
                    $("#last,#next").removeClass("disabled").removeClass("btn");
                    curPage = 1;
                }else  if($(this).attr("id")=="pre"){
                    $("#last,#next").removeClass("disabled").removeClass("btn");

                    if(curPage == 1){
                        curPage = 1;
                        $("#first,#pre").addClass("disabled").addClass("btn");
                    }else {
                        curPage = parseInt($("#curPage").text())-1;
					}
                } else  if($(this).attr("id")=="next"){
                    $("#first,#pre").removeClass("disabled").removeClass("btn");

                    if(curPage == $("#totPage").text()){
                        curPage = $("#totPage").text();
                        $("#last,#next").addClass("disabled").addClass("btn");
                    }else {
                        curPage = parseInt($("#curPage").text())+1;
					}

                } else  if($(this).attr("id")=="last" || $(this).text()==$("#totPage").text()){
                    $("#last,#next").addClass("disabled").addClass("btn");
                    $("#first,#pre").removeClass("disabled").removeClass("btn");
                    curPage = $("#totPage").text();
                }else{
                    $(".pagination>li>a").removeClass("disabled").removeClass("btn");
                    curPage = $(this).text();
                }

                //当前页
                $("#curPage").text(curPage);
                console.log(curPage);

                $.ajax({
                    url: "scan/"+curPage,
                    method:"GET",
                    dataType:"JSON",
                    success:function (data,status,jqXHR) {
                        var tableStr = "";
                        for(var i=0;i<data.list.length;i++) {
                            // 表格拼接
                            tableStr+="<tr>" +
                                "<td>"+data.list[i].raiseCatId+"</td>" +
                                "<td>"+data.list[i].farmId+"</td>" +
                                "<td>"+data.list[i].raiseName+"</td>" +
                                "<td>-</td>" +
                                "<td><img src='../images/raise/"+data.list[i].raiseThums+"' alt=''></td>" +
                                "<td>"+data.list[i].marketPrice+"</td>" +
                                "<td>"+data.list[i].raiseCycle+"</td>" +
                                "<td>"+data.list[i].raiseProfit+"</td>" +
                                "<td>"+data.list[i].raiseStock+"</td>" +
                                "<td>"+data.list[i].raisePeriod+"</td>" +
                                "<td><a href='' data-toggle='modal' data-target='#deletemodal' id='delete' code='"+data.list[i].raiseId+"'>删除</a></td>"+
                                "<td><a href='' data-toggle='modal' data-target='#modifymodal' id='modify' code='"+data.list[i].raiseId+"'>修改</a></td>"+
                                "</tr>";
                        }
                        $("table").append(tableStr);
                        /*底部数字分页算法*/
                        /*
                            start,显示时候起始页码
                            end,显示时的终止页码
                            totPage,数据的总页数
                            curPage,当前页码
                            link_count,期望的链接数量
                        * */
                        var link_count = 5;
                        var start = Math.max(1, curPage - parseInt(link_count/2));
                        var end = Math.min(data.totPage, start + link_count - 1);
                        start = Math.max(1, end - link_count + 1);

                        console.log("start:"+start);
                        console.log("end:"+end);
                        //    页码拼接
                        var numStr = "";

                        for(i=start;i<=end;i++){
                            numStr+="<li><a href='javascript:void()'>"+i+"</a></li> ";
                        }

                        //移除原先的页码
                        $(".pagination>li>a:not(#first,#pre,#next,#last)").parent().remove();
                        //更改为新的页码
                        $("#pre").parent().after(numStr);
                        //    总共多少页
                        $("#totPage").val(data.totPage);
                        //	each遍历所有的li标签，为它添加active状态
                        $(".pagination>li>a").each(function(){
                            if($(this).text()==curPage){
                            $(this).parent().addClass("active");
                            }
                        });
                    },
                    error:function (jqXHR) {
                        alert(jqXHR.status);
                    }
                });
            });

		</script>
	</div><!--col-md-10-->

</div><!--row-->
<!-- 删除modal -->
<div class="modal fade" id="deletemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">农资删除</h4>
            </div>
            <div class="modal-body">
                <h4 class="text-danger">你确定要删除该农资吗?</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="yes">确定</button>
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
                <h4 class="modal-title" id="myModalLabel">农资信息修改</h4>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">分类名称:</label>
                        <input type="text" class="form-control" id="catName">
                    </div>
                    <div class="form-group">
                        <label for="">分类父ID:</label>
                        <input type="text" class="form-control" id="parentId">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
                <button id="myes" type="button" class="btn btn-primary">修改</button>
            </div>
        </div>
    </div>
</div>
<%--用户信息的删除与修改--%>
<script>
    <%--ajax更新的html元素需要用on方法，这样新增元素的事件才有效--%>
    $(document).on("click","#delete",function (event) {
        var raiseCatObj = $(this);
        var raiseCatId = raiseCatObj.attr("code");

        //单击确定按钮进行删除操作
        $("#yes").click(function(){
            $.ajax({
                url:"delete/"+raiseCatId,
                method: "GET",
                success:function (data) {
                    raiseCatObj.parent().parent().remove();
                    $("#deletemodal").modal("hide");
                },
                error:function (jqXHR) {
                    alert(jqXHR.status);
                }
            })
        });
    })

    //单击修改按钮进行修改
    $(document).on("click","#modify",function (event) {
        var raiseCatObj = $(this);
        var raiseCatId = raiseCatObj.attr("code");
		var catNameObj = raiseCatObj.parent().siblings(":eq(2)");
        var parentIdObj = raiseCatObj.parent().siblings(":eq(1)");
		$("#catName").val(catNameObj.text());
		$("#parentId").val(parentIdObj.text());

        //单击确定按钮进行修改操作
        $("#myes").click(function(){
            $.ajax({
                url:"modify/",
                method: "POST",
				data:{
                 	raiseCatId:raiseCatId,
					catName:$("#catName").val(),
					parentId:$("#parentId").val()
				},
                success:function (data) {
                    $("#modifymodal").modal("hide");
                    catNameObj.text($("#catName").val());
                    parentIdObj.text($("#parentId").val());
                },
                error:function (jqXHR) {
                    alert(jqXHR.status);
                }
            })
        });
    })
</script>
</body>
</html>
