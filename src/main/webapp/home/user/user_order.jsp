<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../common/main_home.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>home/css/user.css">
	<meta charset="UTF-8">
	<title>知农之家官方网站-互联网养殖</title>
</head>
<body>
    <%@include file="../common/header.jsp"%>
    <!-- 主体内容 -->
    <div class="content">
        <div style="width: 1200px;position: relative;margin: 0 auto;">
            <div class="head">
                <span></span>
                <h1>我的订单</h1>
            </div>
            <div class="row" style="margin-top: 30px;">
                <div class="col-md-2">
                    <%@include file="left.jsp"%>
                </div>
                <div class="col-md-10" style="border-radius: 5px; border: 1px solid #ccc;">
                    <div>
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#home" aria-controls="home" role="tab" data-toggle="tab">
                                认养订单
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
                                现货订单
                            </a>
                        </li>
                      </ul>

                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div class="order_head">
                                <ul class="row">
                                    <li class="col-md-4">订单详情</li>
                                    <li class="col-md-2">收货人</li>
                                    <li class="col-md-2">金额</li>
                                    <li class="col-md-2">订单状态</li>
                                    <li class="col-md-2">操作</li>
                                </ul>
                            </div>
                            <div class="order_content">
                                <ul>
                                    <c:forEach items="${raiseOrders}" var="ro" varStatus="s">
                                        <li>
                                            <div class="num_time">
                                                <span>订单编号：${ro.orderNum}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>2017-12-18 12:54:04</span>
                                            </div>
                                        </li>
                                        <li class="row">
                                            <div  class="col-md-2">
                                                <img src="../images/raise/item/1.jpg" alt="">
                                            </div>
                                            <div class="period_num col-md-2">
                                                <h2>第15-3期巴马香猪</h2>
                                                <h3>数量：${ro.raiseMount}份</h3>
                                            </div>
                                            <div class="username col-md-2">
                                                <h2>——</h2>
                                            </div>
                                            <div class="totalmoney col-md-2">
                                                <h2>${ro.totalMoney}</h2>
                                            </div>
                                            <div class="order_status col-md-2">
                                                <h2>现金收益</h2>
                                                <h3>认养中</h3>
                                            </div>
                                            <div class="order_detail col-md-2">
                                                <a href="" data-toggle="modal" data-target="#myModal">订单详情</a>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile">...</div>
                      </div>
                    </div>  
                </div>
            </div>
        </div>
    </div>

    <%@include file="../common/footer.jsp"%>
    <div class="gotop" style="display: none;"></div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">订单详情</h4>
          </div>
          <div class="modal-body">
            <p class="text-warning">
                <span>订单号：</span>
                <i>180331115831557801</i>
            </p>
            <p>
                <span>订单名称：</span>
                <i>第15-3期巴马香猪</i>
            </p>
            <p>
                <span>单价：</span>
                <i>160.00元</i>
            </p>
            <p>
                <span>数量：</span>
                <i>1</i>
            </p>
            <p>
                <span>订单金额：</span>
                <i>160.00元</i>
            </p>
            <p>
                <span>订单时间：</span>
                <i>2018-03-31 11:58:31</i>
            </p>
            <p>
                <span>订单状态：</span>
                <i>认养中</i>
            </p>
            <p>
                <span>收益类型：</span>
                <i>现金收益</i>
            </p> 
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-warning" data-dismiss="modal">确定</button>
          </div>
        </div>
      </div>
    </div>
</body>
</html>