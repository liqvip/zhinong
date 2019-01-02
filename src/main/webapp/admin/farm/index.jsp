<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../main_admin.jsp"%>
</head>
<body>
<div class="row">
	<!-- 右侧设计 -->
	<div class="col-md-12">
        <p id="title">
			农场列表
			<button class="btn btn-info">新 增</button>
			<button class="btn btn-info" onclick="delBatch()">删 除</button>
		</p>
		<form action="<%=basePath%>admin/farm/scan" method="post" class="form-inline" style="margin-bottom: 20px;">
			<div class="form-group">
				<label for="">农场名称</label>
				<input type="text" name="farmName" value="${farmName}" id="" class="form-control">
				<input type="submit" value="查 询" class="btn btn-info">
				&nbsp;&nbsp;<input type="button" value="清 空" id="clear" class="btn btn-info">
			</div>
		</form>
		<c:choose>
			<c:when test="${empty farmList}">
				<span class="center-block text-danger">未找到您想查询的记录!</span>
			</c:when>
			<c:otherwise>
				<table class="table table-striped table-bordered">
					<tr>
						<th>
							<input type="checkbox" name="all" onclick="selectAll()">
						</th>
						<th>序号</th>
						<th>农场名称</th>
						<th>农场图片</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${farmList}" var="item" varStatus="id">
						<tr>
							<td>
								<input type="checkbox" name="id" value="${item.farmId}">
							</td>
							<td>${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
							<td>${item.farmName}</td>
							<td><img src="<%=basePath%>admin/images/${item.farmImg}" alt=""></td>
							<td>
								<a href="">查看</a>
								<a href="">修改</a>
								<a href="<%=basePath%>admin/farm/delOne?id=${item.farmId}">删除</a>
							</td>
						</tr>
					</c:forEach>
					<hr>
					<m:pager pageIndex="${page.pageIndex}" pageSize="${page.pageSize}" totalNum="${page.totalNum}"
							 submitUrl="${page.submitUrl}"></m:pager>
				</table>
			</c:otherwise>
		</c:choose>
	</div><!--col-md-12-->
</div><!--row-->
</body>
<script>
    $(document).ready(function () {
		$("#clear").on("click",function () {
			$("input[name=farmName]").val("");
        });
    })
    function selectAll() {
       	if($("input[name=all]").is(":checked")){
			$(":checkbox").prop("checked",true);
		}else{
            $(":checkbox").prop("checked",false);
		}
    }

    function delBatch() {
		var boxCnt = $("input[name=id]:checked").length;
		if(boxCnt == 0){
		    layer.msg("请至少选择一项!");
		    return false;
		}

		var ids = new Array();
		$("input[name=id]:checked").each(function () {
			ids.push($(this).val());
        });

		layer.confirm("确定删除所选条目？",{
		   title:"提示"
		},function (index) {
		   	$.ajax({
				traditional:true,
				url:"<%=basePath%>admin/farm/delBatch",
				type:"post",
				dataType:"json",
				data:{ids:ids},
				success:function (data,status,jqXHR) {
				    if(data.success){
                        layer.close();
                        window.location.href="<%=basePath%>/admin/farm";
					}
                },
				error:function (jqXHR) {
					layer.msg("删除失败!");
                }
			});
            }
		);
    }
</script>
</html>
