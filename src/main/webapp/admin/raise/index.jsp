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
            农资列表
            <a class="btn btn-primary" href="<%=basePath%>admin/raise/addShow">新 增</a>
            <a class="btn btn-danger" onclick="delBatch()">删 除</a>
        </p>
        <form action="<%=basePath%>admin/raise" method="post" class="form-inline" style="margin-bottom: 20px;">
            <div class="form-group">
                <label for="">名称</label>
                <input type="text" name="name" value="${sraise.name}" id="" class="form-control">
            </div>
            <div class="form-group">
                <select name="catId" id="" class="selectpicker" data-live-search="true" title="请选择类别">
                    <c:forEach items="${raiseCats}" var="item" varStatus="index">
                        <option value="${item.id}" <c:if test="${sraise.catId eq item.id}">selected</c:if>>${item.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <select name="status" id="" class="selectpicker" data-live-search="true" title="请选择状态">
                    <option value="1" <c:if test="${sraise.status eq 1}">selected</c:if>>上架</option>
                    <option value="-1" <c:if test="${sraise.status eq -1}">selected</c:if>>下架</option>
                </select>
            </div>
            <input type="submit" value="查 询" class="btn btn-primary">
            &nbsp;&nbsp;<input type="button" value="清 空" id="clear" class="btn btn-primary">
        </form>
        <c:choose>
            <c:when test="${empty raise}">
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
                        <th>类别</th>
                        <th>农场</th>
                        <th>价格</th>
                        <th>收购价</th>
                        <th>周期(月)</th>
                        <th>库存</th>
                        <th>状态</th>
                        <th>添加时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${raise}" var="item" varStatus="id">
                        <tr>
                            <td style="width: 60px">
                                <input type="checkbox" name="id" value="${item.id}">
                            </td>
                            <td style="width: 55px">${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${fn:length(item.name) > 15}">
                                        <c:out value="${fn:substring(item.name, 0, 15)}......" />
                                    </c:when>
                                    <c:otherwise>
                                        ${item.name}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${item.raiseCat.name}</td>
                            <td>${item.farm.name}</td>
                            <td>${item.price}</td>
                            <td>${item.profit}</td>
                            <td>${item.cycle}</td>
                            <td>${item.stock}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.status == 1}"><button class="btn btn-success btn-xs">上架</button></c:when>
                                    <c:otherwise><button class="btn btn-warning btn-xs">下架</button></c:otherwise>
                                </c:choose>
                            </td>
                            <td style="width: 200px">
                                <fmt:formatDate value="${item.addtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td style="width: 250px">
                                <c:choose>
                                    <c:when test="${item.status == 1}">
                                        <button class="btn btn-sm btn-danger" onclick="operation(${item.id},${item.status})">下架</button>
                                    </c:when>
                                    <c:when test="${item.status == -1}">
                                        <button class="btn btn-sm btn-success" onclick="operation(${item.id},${item.status})">上架</button>
                                    </c:when>
                                </c:choose>
                                <a class="btn btn-info btn-sm" href="<%=basePath%>admin/raise/editShow?id=${item.id}">修改</a>
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
            $("input[name=title]").val("");
            $("select").each(function (i,n) {
                $(n).find("option:selected").attr("selected",false);
                $(n).find("option").first().attr("selected",true);
            });
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
                    url:"<%=basePath%>admin/raise/delOne?id="+id,
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
                    url:"<%=basePath%>admin/raise/delBatch",
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

    function operation(id,status) {
        var title = "";
        var text = "";
        if (status == 1) {
            title = '确定要下架吗?';
            text = '下架后前台将无法展示';
            status = -1;
        } else if (status == -1) {
            title = '确定要上架吗?';
            text = '上架后将在前台展示';
            status = 1;
        }
        layer.confirm(text,{
                title:title
            },function (index) {
                $.ajax({
                    url:"<%=basePath%>admin/raise/edit",
                    type:"post",
                    data:{id:id,status:status},
                    dataType:"json",
                    success:function (data,status,jqXHR) {
                        if(data.success){
                            layer.msg("更新成功!");
                            setTimeout(function () {
                                window.location.reload();
                            },1000);
                        }
                    },
                    error:function (jqXHR) {
                        layer.msg("更新错误!");
                    }
                });
            }
        );
    }
</script>
</html>

