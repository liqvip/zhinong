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
            农资类型
            <button class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="addShow()">新 增</button>
            <button class="btn btn-danger" onclick="delBatch()">删 除</button>
        </p>
        <form action="<%=basePath%>admin/raiseCat" method="post" class="form-inline" style="margin-bottom: 20px;">
            <div class="form-group">
                <label for="">类别</label>
                <input type="text" name="name" value="${raiseCat.name}" id="" class="form-control">
            </div>
            <input type="submit" value="查 询" class="btn btn-primary">
            &nbsp;&nbsp;<input type="button" value="清 空" id="clear" class="btn btn-primary">
        </form>
        <c:choose>
            <c:when test="${empty raiseCats}">
                <span class="center-block text-danger">未找到您想查询的记录!</span>
            </c:when>
            <c:otherwise>
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>
                            <input type="checkbox" name="all" onclick="selectAll()">
                        </th>
                        <th>序号</th>
                        <th>类别</th>
                        <th>数量</th>
                        <th>发表时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${raiseCats}" var="item" varStatus="id">
                        <tr>
                            <td>
                                <input type="checkbox" name="id" value="${item.id}">
                            </td>
                            <td>${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
                            <td>${item.name}</td>
                            <td>${item.num}</td>
                            <td style="width: 200px">
                                <fmt:formatDate value="${item.addtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td style="width: 250px">
                                <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal"
                                        onclick="editShow(${item.id},'${item.name}')">修改</button>
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
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    //清空搜索框
    $(document).ready(function () {
        $("#clear").on("click",function () {
            $("input[name=murl]").val("");
            $("input[name=name]").val("");
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

    function addShow(){
        $("#myModalLabel").html("增加类别");
        $(".modal-body").html("名称：<input type='text' id='newTypeName'>");
        $(".modal-footer").html("<button type='button' class='btn btn-primary' onclick='add()'>提交</button>")
    }

    function add() {
        $("#myModal").modal("hide");
        var name = $("#newTypeName").val();
        $.ajax({
            url:"<%=basePath%>admin/raiseCat/add?name="+name,
            type:"get",
            dataType:"json",
            success:function (data,status,jqXHR) {
                if(data.success){
                    layer.msg("添加成功!");
                    window.location.reload();
                }
            },
            error:function (jqXHR) {
                layer.msg("添加失败!");
            }
        });
    }

    function editShow(id,name) {
        $("#myModalLabel").html("修改类别");
        $(".modal-body").html("名称：<input type='text' id='newTypeName' value='"+name+"'>");
        $(".modal-footer").html("<button type='button' class='btn btn-primary' onclick='edit("+id+")'>提交</button>")
    }

    function edit(id) {
        $("#myModal").modal("hide");
        var name = $("#newTypeName").val();
        $.ajax({
            url:"<%=basePath%>admin/raiseCat/edit",
            type:"post",
            data:{id:id,name:name},
            dataType:"json",
            success:function (data,status,jqXHR) {
                if(data.success){
                    layer.msg("修改成功!");
                    window.location.reload();
                }
            },
            error:function (jqXHR) {
                layer.msg("修改失败!");
            }
        });
    }

    function delOne(id){
        layer.confirm("确定删除所选条目？",{
                title:"提示"
            },function (index) {
                $.ajax({
                    url:"<%=basePath%>admin/raiseCat/delOne?id="+id,
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
                    url:"<%=basePath%>admin/raiseCat/delBatch",
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
