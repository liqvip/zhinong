<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../main_admin.jsp"%>
</head>
<body style="width: 100%;height: 100%;">
<div class="row">
    <!-- 右侧设计 -->
    <div class="col-md-12">
        <p id="title">
            菜单列表
            <button class="btn btn-info" id="add">新 增</button>
            <button class="btn btn-info" onclick="delBatch()">删 除</button>
        </p>
        <form action="<%=basePath%>admin/menu" method="post" class="form-inline" style="margin-bottom: 20px;">
            <div class="form-group">
                <label for="">菜单名称</label>
                <input type="text" name="name" value="${menu.name}" id="" class="form-control">
            </div>
            <div class="form-group">
                <label for="">目标地址</label>
                <input type="text" name="murl" value="${menu.murl}" id="" class="form-control">
            </div>
            <input type="submit" value="查 询" class="btn btn-info">
            &nbsp;&nbsp;<input type="button" value="清 空" id="clear" class="btn btn-info">
        </form>
        <c:choose>
            <c:when test="${empty menus}">
                <span class="center-block text-danger">未找到您想查询的记录!</span>
            </c:when>
            <c:otherwise>
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>
                            <input type="checkbox" name="all" onclick="selectAll()">
                        </th>
                        <th>序号</th>
                        <th>菜单名称</th>
                        <th>目标地址</th>
                        <th>优先级</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${menus}" var="item" varStatus="id">
                        <tr>
                            <td>
                                <input type="checkbox" name="id" value="${item.id}">
                            </td>
                            <td>${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
                            <td>${item.name}</td>
                            <td>${item.murl}</td>
                            <td>${item.priority}</td>
                            <td>
                                <a href="">查看</a>
                                <a href="javascript:void(0)" onclick="editShow(this)">修改</a>
                                <a href="<%=basePath%>admin/menu/delOne?id=${item.id}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <hr>
                    <m:pager pageIndex="${page.pageIndex}" pageSize="${page.pageSize}" totalNum="${page.totalNum}"
                             submitUrl="${page.submitUrl}"></m:pager>
                </table>
            </c:otherwise>
        </c:choose>
    </div><!--col-md-12-->
</div><!--row-->
</body>
<script>
    //清空搜索框、点击新增按钮、点击修改按钮
    $(document).ready(function () {
        $("#clear").on("click",function () {
            $("input[name=murl]").val("");
            $("input[name=name]").val("");
        });

        $('#add').on('click', function(){
            layer.open({
                type: 2,
                title: '新增菜单',
                shadeClose: true, //点击遮罩关闭层
                area : ['500px' , '400px'],
                content: '<%=basePath%>admin/menu/addShow',
                btn:["确定","取消"]
            });
        });
    })

    function editShow(obj) {
        var id = $(obj).parent().prevAll(":last").children(":first").val();
        layer.open({
            type: 2,
            title: '修改菜单',
            shadeClose: true, //点击遮罩关闭层
            area : ['500px' , '400px'],
            content: '<%=basePath%>admin/menu/editShow?id='+id,
            btn:["确定","取消"]
        });

    }
    function selectAll() {
        if($("input[name=all]").is(":checked")){
            $(":checkbox").prop("checked",true);
        }else{
            $(":checkbox").prop("checked",false);
        }
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
                    traditional:true,
                    url:"<%=basePath%>admin/menu/delBatch",
                    type:"post",
                    dataType:"json",
                    data:{ids:ids},
                    success:function (data,status,jqXHR) {
                        if(data.success){
                            layer.close();
                            window.location.href="<%=basePath%>/admin/menu";
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

