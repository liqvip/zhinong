<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../main_admin.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>admin/css/link.css">
</head>
<body>
<div class="row">
    <!-- 右侧设计 -->
    <div class="col-md-12">
        <p id="title">
            友链列表
            <button class="btn btn-primary" onclick="addShow()" data-toggle="modal" data-target="#modal-form">新 增</button>
            <button class="btn btn-danger" onclick="delBatch()">删 除</button>
        </p>
        <form action="<%=basePath%>admin/link" method="post" class="form-inline" style="margin-bottom: 20px;">
            <div class="form-group">
                <label for="">名称</label>
                <input type="text" name="name" value="${link.name}" id="" class="form-control">
            </div>
            <div class="form-group">
                <select name="status" id="" class="selectpicker" data-live-search="true" title="请选择状态">
                    <option value="1" <c:if test="${link.status eq 1}">selected</c:if>>上架</option>
                    <option value="-1" <c:if test="${link.status eq -1}">selected</c:if>>下架</option>
                </select>
            </div>
            <input type="submit" value="查 询" class="btn btn-primary">
            &nbsp;&nbsp;<input type="button" value="清 空" id="clear" class="btn btn-primary">
        </form>
        <c:choose>
            <c:when test="${empty links}">
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
                        <th>优先级</th>
                        <th>状态</th>
                        <th>发表时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${links}" var="item" varStatus="id">
                        <tr>
                            <td>
                                <input type="checkbox" name="id" value="${item.id}">
                            </td>
                            <td>${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
                            <td><a href="${item.url}" target="_blank">${item.name}</a></td>
                            <td>${item.sort}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.status == 1}">
                                        <button class="btn btn-sm btn-success">上架</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-sm btn-danger">下架</button>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td style="width: 200px">
                                <fmt:formatDate value="${item.addtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td style="width: 250px">
                                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-form"
                                        onclick="editShow(${item.id})">修改</button>
                                <c:choose>
                                    <c:when test="${item.status == 1}">
                                        <button class="btn btn-sm btn-danger" onclick="operation(${item.id},${item.status})">下架</button>
                                    </c:when>
                                    <c:when test="${item.status == -1}">
                                        <button class="btn btn-sm btn-success" onclick="operation(${item.id},${item.status})">上架</button>
                                    </c:when>
                                </c:choose>
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
<%--添加修改模态框--%>
<div id="modal-form" class="modal fade" aria-hidden="true">
    <div class="modal-dialog" style="width: 30%;">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <h3 class="m-t-none m-b" id="modaltitle"></h3>
                    <form role="form" class="form-horizontal">
                        <div class="input-group m-b">
                            <span class="input-group-addon">名称</span> <input type="text"
                                                                             id="newName" class="form-control">
                        </div>
                        <div class="input-group m-b">
                            <span class="input-group-addon">链接</span> <input type="text"
                                                                             id="newLink" class="form-control">
                        </div>
                        <div class="input-group m-b">
                            <span class="input-group-addon">优先级</span> <input type="text"
                                                                             id="newSort" class="form-control">
                        </div>
                        <div id="update"></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    function selectAll() {
        if($("input[name=all]").is(":checked")){
            $(":checkbox").prop("checked",true);
        }else{
            $(":checkbox").prop("checked",false);
        }
    }

    //清空搜索框
    $(document).ready(function () {
        $("#clear").on("click",function () {
            $("input[name=name]").val("");
            $("select").each(function (i,n) {
                $(n).find("option:selected").attr("selected",false);
                $(n).find("option").first().attr("selected",true);
            });
        });
    });

    function addShow() {
        $("#modaltitle").html("添加友链");
        $("#newName").val("");
        $("#newLink").val("");
        $("#newSort").val("");
        var addButton = ' <button class="btn btn-primary pull-right m-t-n-xs" onclick="add()"><strong>添加</strong></button>'
        $("#update").html(addButton);
    };

    function add() {
        var params = {
            name : $("#newName").val(),
            url : $("#newLink").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
            sort : $("#newSort").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;")
        };
        $.ajax({
            url : '<%=basePath%>admin/link/add',
            type : 'post',
            data : params,
            dataType : 'json',
            success : function(data) {
                if (data.success) {
                    $("#modal-form").modal('hide');
                    layer.msg("添加成功!");
                    window.location.reload();
                }
            },
            error : function() {
                layer.msg("添加友链错误,请重新操作!");
            }
        });
    };

    function editShow(id) {
        $.ajax({
            url : '<%=basePath%>admin/link/editShow?id='+id,
            type : 'get',
            dataType : 'json',
            success : function(data) {
                if (data.msg.success) {
                    $("#modaltitle").html("更新友链")
                    $("#newName").val(data.link.name);
                    $("#newLink").val(data.link.url);
                    $("#newSort").val(data.link.sort);
                    var updateButton = ' <button class="btn btn-sm btn-primary pull-right m-t-n-xs" onclick="edit('+id+')"><strong>更新</strong></button>';
                    $("#update").html(updateButton);
                }
            },
            error : function() {
                layer.msg("查询错误,请重新操作!");
            }
        });

    };

    function edit(id) {
        var params = {
            'id' : id,
            'name' : $("#newName").val(),
            'sort' : $("#newSort").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
            'url' : $("#newLink").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;")
        };
        $.ajax({
            url : '<%=basePath%>admin/link/edit?',
            type : 'post',
            data : params,
            dataType : 'json',
            success : function(data) {
                if (data.success) {
                    $("#modal-form").modal('hide');
                    setTimeout(function () {
                        layer.msg("更新成功");
                    },1000);
                    window.location.reload();
                }
            },
            error : function() {
                layer.msg("更新错误,请重新操作");
            }
        });
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
                    url:"<%=basePath%>admin/link/edit",
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

    function delOne(id){
        layer.confirm("删除后将无法恢复，请谨慎操作！",{
                title:"确定要删除该友链吗?"
            },function (index) {
                $.ajax({
                    url:"<%=basePath%>admin/link/delOne?id="+id,
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
                    url:"<%=basePath%>admin/link/delBatch",
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

