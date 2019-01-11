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
            <a class="btn btn-primary" href="<%=basePath%>admin/farm/addShow">新 增</a>
            <a class="btn btn-danger" onclick="delBatch()">删 除</a>
        </p>
        <form action="<%=basePath%>admin/farm" method="post" class="form-inline" style="margin-bottom: 20px;">
            <div class="form-group">
                <label for="">名称</label>
                <input type="text" name="name" value="${farm.name}" id="" class="form-control">
            </div>
            <input type="submit" value="查 询" class="btn btn-primary">
            &nbsp;&nbsp;<input type="button" value="清 空" id="clear" class="btn btn-primary">
        </form>
        <c:choose>
            <c:when test="${empty farms}">
                <span class="center-block text-danger">未找到您想查询的记录!</span>
            </c:when>
            <c:otherwise>
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>
                            <input type="checkbox" name="all" onclick="selectAll()">
                        </th>
                        <th>序号</th>
                        <th>名称</th>
                        <th>摘要</th>
                        <th>上架时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${farms}" var="item" varStatus="id">
                        <tr>
                            <td>
                                <input type="checkbox" name="id" value="${item.id}">
                            </td>
                            <td>${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
                            <td>${item.name}</td>
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
                            <td style="width: 200px">
                                <fmt:formatDate value="${item.addtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td style="width: 250px">
                                <a class="btn btn-info btn-sm" href="<%=basePath%>admin/farm/editShow?id=${item.id}">修改</a>
                                <a class="btn btn-danger btn-sm" onclick="delOne(${item.id})">删除</a>
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
            $("input[name=name]").val("");
        });
    });

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
                    url:"<%=basePath%>admin/farm/delOne?id="+id,
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
                    url:"<%=basePath%>admin/farm/delBatch",
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

