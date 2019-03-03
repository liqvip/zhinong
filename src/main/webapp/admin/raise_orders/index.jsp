<%--
  Created by liqiang at 2018/12/28 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../main_admin.jsp"%>
</head>
<body>
<div class="row">
    <!-- 右侧设计 -->
    <div class="col-md-12">
        <p id="title">
            订单列表
            <button class="btn btn-danger" onclick="delBatch()">删 除</button>
        </p>
        <form action="<%=basePath%>admin/order" method="post" class="form-inline" style="margin-bottom: 20px;">
            <div class="form-group">
                <label for="">用户名</label>
                <input type="text" name="username" value="${username}" id="" class="form-control">
            </div>
            <input type="submit" value="查 询" class="btn btn-primary">
            &nbsp;&nbsp;<input type="button" value="清 空" id="clear" class="btn btn-primary">
        </form>
        <c:choose>
            <c:when test="${empty raiseOrders}">
                <span class="center-block text-danger">未找到您想查询的记录!</span>
            </c:when>
            <c:otherwise>
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>
                            <input type="checkbox" name="all" onclick="selectAll()">
                        </th>
                        <th>序号</th>
                        <th>用户名</th>
                        <th>农资</th>
                        <th>数量</th>
                        <th>金额</th>
                        <th>状态</th>
                        <th>时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${raiseOrders}" var="item" varStatus="id">
                        <tr>
                            <td>
                                <input type="checkbox" name="id" value="${item.id}">
                            </td>
                            <td>${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
                            <td>${item.username}</td>
                            <td>${item.name}</td>
                            <td>${item.amount}</td>
                            <th>${item.payment}</th>
                            <td>
                                <c:choose>
                                    <c:when test="${item.status == 1}">
                                        <button class="btn btn-success btn-sm">已支付</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-danger btn-sm">无效</button>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <fmt:formatDate value="${item.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td style="width: 250px">
                                <button class="btn btn-danger btn-sm" onclick="delOne(${item.id})">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                    <m:pager pageIndex="${page.pageIndex}" pageSize="${page.pageSize}" totalNum="${page.totalNum}"
                             submitUrl="${page.submitUrl}"></m:pager>
                </table>
            </c:otherwise>
        </c:choose>
    </div><!--col-md-12-->
</div><!--row-->
</body>
<script>
    //清空搜索框
    $(document).ready(function () {
        $("#clear").on("click",function () {
            $("input[name=username]").val("");
        });
    });

    //多选
    function selectAll() {
        if($("input[name=all]").is(":checked")){
            $(":checkbox").prop("checked",true);
        }else{
            $(":checkbox").prop("checked",false);
        }
    }

    function delOne(id){
        layer.confirm("确定删除所选条目？",{
                title:"提示"
            },function (index) {
                $.ajax({
                    url:"<%=basePath%>admin/order/delOne?id="+id,
                    type:"get",
                    dataType:"json",
                    success:function (data,status,jqXHR) {
                        if(data.success){
                            layer.msg("删除成功!");
                            window.location.reload();
                        }
                    },
                    error:function (jqXHR) {
                        layer.msg("删除失败!");
                    }
                });
            }
        );

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
                    /*提交数组*/
                    traditional:true,
                    url:"<%=basePath%>admin/order/delBatch",
                    type:"post",
                    dataType:"json",
                    data:{ids:ids},
                    success:function (data,status,jqXHR) {
                        if(data.success){
                            layer.msg("删除成功!");
                            window.location.reload();
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
