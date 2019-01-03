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
            幻灯片列表
            <a class="btn btn-primary" href="<%=basePath%>admin/slide/addShow">新 增</a>
            <a class="btn btn-danger" onclick="delBatch()">删 除</a>
        </p>
        <table class="table table-hover table-condensed table-bordered">
            <tr>
                <th>
                    <input type="checkbox" name="all" onclick="selectAll()">
                </th>
                <th>序号</th>
                <th>目标地址</th>
                <th>摘要</th>
                <th>优先级</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${slides}" var="item" varStatus="id">
                <tr>
                    <td>
                        <input type="checkbox" name="id" value="${item.id}">
                    </td>
                    <td>${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
                    <td>${item.url}</td>
                    <td>
                        <c:choose>
                            <c:when test="${fn:length(item.introduction) > 15}">
                                <c:out value="${fn:substring(item.introduction, 0, 15)}......" />
                            </c:when>
                            <c:otherwise>
                                ${item.introduction}
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${item.sort}</td>
                    <td style="width: 250px">
                        <a class="btn btn-info btn-sm" href="<%=basePath%>admin/slide/editShow?id=${item.id}">修改</a>
                        <a class="btn btn-danger btn-sm" onclick="delOne(${item.id})">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <m:pager pageIndex="${page.pageIndex}" pageSize="${page.pageSize}" totalNum="${page.totalNum}"
                     submitUrl="${page.submitUrl}"></m:pager>
        </table>
    </div><!--col-md-12-->
</div><!--row-->
</body>
<script>
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
                    url:"<%=basePath%>admin/slide/delOne?id="+id,
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
                    url:"<%=basePath%>admin/slide/delBatch",
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

