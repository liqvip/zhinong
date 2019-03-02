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
                <div class="container">
                    <div class="col-md-2">
                        <%@include file="left.jsp"%>
                    </div>
                    <div class="col-md-10" style="border-radius: 5px; border: 1px solid #ccc;background-color: #FFFFFF">
                        <div class="common-title">订单中心</div>
                        <div class="line"></div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>订单详情</th>
                                <th>时间</th>
                                <th>金额</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${raiseOrders}" var="item" varStatus="id">
                                <tr>
                                    <th scope="row">${id.index+1}</th>
                                    <td>
                                        <img src="${item.raise.images}" alt="">
                                        <h2>${item.raise.name}</h2>
                                        <h2>数量：${item.amount}</h2>
                                    </td>
                                    <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>￥${item.payment}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.status == 1}">
                                                <button class="butn btn-success btn-sm">已支付</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-danger btn-sm">无效</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <button class="btn btn-warning" onclick="orderDetail(${item.id})">订单详情</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                </div>
            </div>
      </div>
    </div>
</body>
<script type="text/javascript">
    function orderDetail(id) {
        var url = "<%=basePath%>home/user/"+id+"/orderdetail"
        $.get(url,{},function (result) {
            if(result && result["msg"].success){
                var data = result.raiseOders;
                $(".modal-body").html('<p>' +
                        '<span>订单名称：</span>' +
                        '<i>'+data.raise.name+'</i>' +
                    '</p>' +
                    '<p>' +
                        '<span>单价：</span>' +
                        '<i>'+data.raise.price+' 元</i>' +
                    '</p>' +
                    '<p>' +
                        '<span>数量：</span>' +
                        '<i>'+data.amount+'</i>' +
                    '</p>' +
                    '<p>' +
                        '<span>订单金额：</span>' +
                        '<i>'+data.payment+' 元</i>' +
                    '</p>');
                $('#myModal').modal('show');
            }else{
                console.log(result);
            }
        });
    }
</script>
</html>