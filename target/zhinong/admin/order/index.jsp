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
		<div class="col-md-12">
		  <table class="table table-striped table-bordered">
		  	<tbody>
			  	<tr>
		  			<th>用户ID</th>
			  		<th>农资ID</th>
		  			<th>认养数量</th>
		  			<th>总金额</th>
		  			<th>创建时间</th>
		  			<th>订单号</th>
		  			<th>收益类型</th>
		  			<th>删除</th>
			  	</tr>	
			  	<tr>
			  		<td>1</td>
			  		<td>2</td>
			  		<td>123</td>
			  		<td>123.00</td>
			  		<td>2017-12-18 12:54:04</td>
			  		<td>Z12181513572844347402</td>
			  		<td>现金收益</td>
			  		<td><a href="" data-toggle="modal" data-target="#deletemodal">删除</a></td>
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
	        <h4 class="modal-title" id="myModalLabel">订单删除</h4>
	      </div>
	      <div class="modal-body">
	      	<h4 class="text-danger">你确定要删除该订单吗?</h4>	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
<script>
</script>
</html>
