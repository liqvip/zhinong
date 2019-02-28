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
                <h1>用户中心</h1>
            </div>
            <div class="row">
                <%@include file="top.jsp"%>
            </div>

            <div class="row" style="margin-top: 30px;">
                <div class="col-md-2">
                    <%@include file="left.jsp"%>
                </div>
                <div class="col-md-10" style="border-radius: 5px;border: 1px solid #ccc;background-color: #FFFFFF">
                    <button class="btn btn-warning" type="button" style="margin: 20px auto">即将到期的养殖项目
                        <span class="badge">4</span>
                    </button>
                    <div class="center">
                       <table class="table table-hover" >
                            <tr>
                                <th>商品名称</th>
                                <th>数量</th>
                                <th>收益类型</th>
                                <th>收益</th>
                                <th>结束时间</th>
                            </tr>
                            <tr>
                                <td>第15-3期巴马香猪</td>
                                <td>22</td>
                                <td>现金收益</td>
                                <td>12.80元</td>
                                <td>2018-10-02</td>
                            </tr>
                       </table> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../common/footer.jsp"%>
    <div class="gotop" style="display: none;"></div>
</body>
</html>