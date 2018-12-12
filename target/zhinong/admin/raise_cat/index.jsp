<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<%@include file="../main_admin.jsp"%>
	<title>知农后台</title>
	<style>
	</style>
</head>

<body style="width: 100%;height: 100%">


<div class="row">

	<!-- 右侧设计 -->
	<div class="col-md-10">
		<table class="table table-striped table-bordered">
			<tr>
				<th>分类ID</th>
				<th>父ID</th>
				<th>分类名称</th>
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
                      "<td>"+data.list[i].parentId+"</td>" +
					  "<td>"+data.list[i].catName+"</td>" +
					  "<td><a href='' data-toggle='modal' data-target='#deletemodal' id='delete' code='"+data.list[i].raiseCatId+"'>删除</a></td>"+
					  "<td><a href='' data-toggle='modal' data-target='#modifymodal' id='modify' code='"+data.list[i].raiseCatId+"'>修改</a></td>"+
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
                                "<td>"+data.list[i].parentId+"</td>" +
                                "<td>"+data.list[i].catName+"</td>" +
                                "<td><a href='' data-toggle='modal' data-target='#deletemodal' id='delete' code='"+data.list[i].raiseCatId+"'>删除</a></td>"+
                                "<td><a href='' data-toggle='modal' data-target='#modifymodal' id='modify' code='"+data.list[i].raiseCatId+"'>修改</a></td>"+
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
                <h4 class="modal-title" id="myModalLabel">分类删除</h4>
            </div>
            <div class="modal-body">
                <h4 class="text-danger">你确定要删除该分类吗?</h4>
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
                <h4 class="modal-title" id="myModalLabel">分类信息修改</h4>
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
