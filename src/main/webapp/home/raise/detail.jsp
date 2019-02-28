<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../common/main_home.jsp"%>
	<link rel="stylesheet" href="<%=basePath%>home/css/raise_detail.css">
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="<%=basePath%>home/images/favicon.ico">
	<title>知农之家官方网站-互联网养殖</title>
</head>
<body>
    <%@include file="../common/header.jsp"%>
    <div class="content">
    	<div class="raise_detail_content" style="width: 1200px;margin: 0 auto">
			<div class="raise_banner">
				<img src="<%=basePath%>home/images/raise_detail/1.jpg" alt="">
			</div>
			<div class="detail_head">
	    		<ol class="breadcrumb">
				  <li><a href="<%=basePath%>home/raise?catId=${sraise.catId}">${sraise.raiseCat.name}</a></li>
				  <li class="active">${sraise.name}</li>
				</ol>
    		</div>
    		<div class="raise_detail_body">
				<div class="row">
					<div class="col-md-8" style="background-color: #FFFFFF">
						<div class="section01">
							<img src="${sraise.images}" alt="">
							<h2>${sraise.name}</h2>
							<div class="icon">
								<span class="icon01">
									<em style="display: none;">实地散养</em>
								</span>
								<span class="icon02">
									<em style="display: none;">中国人保</em>
								</span>
								<span  class="icon03">
									<em style="display: none;">冷链配送</em>
								</span>
							</div>
							<dl>
								<dt>单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价:</dt>
								<dd>${sraise.price}元/份</dd>
							</dl>
							<dl>
								<dt>周&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期:</dt>
								<dd>${sraise.cycle}个月</dd>
							</dl>
							<dl>
								<dt>养成收益:</dt>
								<dd>${sraise.profit}元/份</dd>
								<i></i>
							</dl>
							<dl>
								<dt>剩余数量:</dt>
								<dd>${sraise.stock}份</dd>
							</dl>
							<dl>
								<dt>购买数量:</dt>
								<span class="reduce"></span>
								<input name="amount" value="1" class="num" type="text">
								<span class="add"></span>
							</dl>
							<a href="" id="kill_btn"></a>
						</div>
						<script>
							$(".reduce").click(function(){
								$(".num").val($(".num").val()-1);
								if($(".num").val()<=1||$(".num").val()==""){
									$(".num").val(1);
								}
							});

							$(".add").click(function(){
								if($(".num").val()==""){
									$(".num").val(1);
								}
								$(".num").val(parseInt($(".num").val())+1);
								/*这里判断剩余的数量*/
							});

							$(".num").get(0).oninput=function(){
								this.value=this.value.replace(/^[0]+|([a-zA-Z]|[\u4E00-\u9FA5])/gi,"");
							};
							$(".btn01").click(function(){
							    var raiseCount = $(".num").val();
							    $(this).attr("href","<%=basePath%>home/raise/raise_submit?raiseId=${sraise.id}&aMount="+raiseCount+"&price=${sraise.price}");
                            });
						</script>
					</div>
					<div class="col-md-4">
						<div class="section02">
							<h3 >购买记录</h3>
							<em ></em>
							<div>用户</div>
							<div data-v-e5176284="">数量</div>
							<div>时间</div>
							<span>
								<ul>
                                    <c:forEach items="${raiseOrders}" var="item" varStatus="id">
                                        <li>
    									    <b>${item.name}</b>
    									    <b>${item.amount}</b>
    									    <b><fmt:formatDate value="${item.create_time}" pattern="yyyy-MM-dd"/></b>
									    </li>
                                    </c:forEach>
								</ul>
							</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="section03">
							<ul class="nav nav-tabs" role="tablist">
							    <li role="presentation" class="active">
							    	<a href="#goods" role="tab" data-toggle="tab">商品详情</a>
							    </li>
							    <li role="presentation">
							    	<a href="#farm" role="tab" data-toggle="tab">农场介绍</a>
							    </li>
							</ul>
							  <!-- Tab panes -->
							<div class="tab-content">
							  <div role="tabpanel" class="tab-pane active" id="goods">
							   <img src="${sraise.images}" alt="">
							   </div>
							  <div role="tabpanel" class="tab-pane" id="farm">
							  	<img src="${sraise.farm.image}" alt="">
							  </div>
							</div>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    </div>

    <div class="gotop" style="display: none;"></div>
    <%--jQuery cookie操作插件--%>
    <script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <%--jquery countdown倒计时插件--%>
    <script src="https://cdn.bootcss.com/jquery.countdown/2.2.0/jquery.countdown.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>home/js/raise.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            raiseKill.detail.init({
                id:${sraise.id},
                startTime:${sraise.startTime.time},
                endTime:${sraise.endTime.time}
            });
        });
        $(function () {
            //使用EL表达式传入参数
           
        });
    </script>
</body>
</html>