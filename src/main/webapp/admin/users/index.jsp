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
            用户列表
            <button class="btn btn-primary" onclick="addShow()" data-toggle="modal" data-target="#modal-form">新 增</button>
            <button class="btn btn-danger" onclick="delBatch()">删 除</button>
        </p>
        <form id="search" action="<%=basePath%>admin/users" method="post" class="form-inline" style="margin-bottom: 20px;">
            <div class="form-group">
                <label for="">昵称：</label>
                <input type="text" name="name" value="${user.name}"  class="form-control">
            </div>
            <div class="form-group">
                <label for="">账号：</label>
                <input type="text" name="username" value="${user.username}" class="form-control">
            </div>
            <div class="form-group">
                <label for="">电话：</label>
                <input type="text" name="phone" value="${user.phone}" class="form-control">
            </div>
            <div class="form-group">
                <label for="status">状态</label>
                <select name="status" id="status" class="form-control">
                    <option value="">全部</option>
                    <option value="1" <c:if test="${user.status eq 1}">selected</c:if>>--有效--</option>
                    <option value="-1" <c:if test="${user.status eq -1}">selected</c:if>>--无效--</option>
                </select>
            </div>
            <input type="submit" value="查 询" class="btn btn-primary">
            &nbsp;&nbsp;<button class="btn btn-primary" id="clear" type="button">清 空</button>
        </form>
        <c:choose>
            <c:when test="${empty users}">
                <span class="center-block text-danger">未找到您想查询的记录!</span>
            </c:when>
            <c:otherwise>
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>
                            <input type="checkbox" name="all" onclick="selectAll()">
                        </th>
                        <th>序号</th>
                        <th>昵称</th>
                        <th>账号</th>
                        <th>电话</th>
                        <th>邮箱</th>
                        <th>状态</th>
                        <th>注册时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${users}" var="item" varStatus="id">
                        <tr>
                            <td>
                                <input type="checkbox" name="id" value="${item.id}">
                            </td>
                            <td>${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
                            <td>${item.name}</td>
                            <td>${item.username}</td>
                            <td>${item.phone}</td>
                            <td>${item.email}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.status == 1}">
                                        <button class="btn btn-xs btn-success">有效</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-xs btn-danger">无效</button>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td style="width: 200px">
                                <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td style="width: 250px">
                                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-form"
                                        onclick="editShow(${item.id})">修改</button>
                                <c:choose>
                                    <c:when test="${item.status == 1}">
                                        <button class="btn btn-sm btn-danger" onclick="operation(${item.id},${item.status},this)">禁用</button>
                                    </c:when>
                                    <c:when test="${item.status == -1}">
                                        <button class="btn btn-sm btn-success" onclick="operation(${item.id},${item.status},this)">启用</button>
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
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 内容声明 -->
            <form id="frmAddSysuser">
                <div class="modal-content">
                    <!-- 头部、主体、脚注 -->
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body text-center">
                        <div class="row text-right">
                            <label for="name" class="col-sm-4 control-label">昵称：</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                        </div>
                        <br>
                        <div class="row text-right">
                            <label for="username" class="col-sm-4 control-label">帐号：</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="username" name="username">
                            </div>
                        </div>
                        <br>
                        <div class="row text-right">
                            <label for="password" class="col-sm-4 control-label">登录密码：</label>
                            <div class="col-sm-4">
                                <input type="password" class="form-control" id="password" name="password">
                            </div>
                        </div>
                        <br>
                        <div class="row text-right">
                            <label for="phone" class="col-sm-4 control-label">联系电话：</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="phone" name="phone">
                            </div>
                        </div>
                        <br>
                        <div class="row text-right">
                            <label for="email" class="col-sm-4 control-label">联系邮箱：</label>
                            <div class="col-sm-4">
                                <input type="email" class="form-control" id="email" name="email">
                            </div>
                        </div>
                        <br>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </form>
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
            $(".form-group input").val("");
            $("select").each(function (i,n) {
                $(n).find("option:selected").attr("selected",false);
                $(n).find("option").first().attr("selected",true);
            });
        });
    });

    function addShow() {
        $(".modal-title").html("添加用户");
        $("#frmAddSysuser input").val("");
        var addButton = '<button class="btn btn-primary" onclick="add()" type="button">添加</button>' +
            '<button class="btn btn-danger cancel" data-dismiss="modal">取消</button>';
        $(".modal-footer").html(addButton);
    }

    function add() {
        $.ajax({
            url : '<%=basePath%>admin/users/add',
            type : 'post',
            data : $("#frmAddSysuser").serialize(),
            dataType : 'json',
            success : function(data) {
                if (data.success) {
                    $("#modal-form").modal('hide');
                    layer.msg("添加成功!");
                    window.location.reload();
                }
            },
            error : function() {
                layer.msg("添加用户接口错误,请检查!");
            }
        });
    }

    function editShow(id) {
        $.ajax({
            url : '<%=basePath%>admin/users/editShow?id='+id,
            type : 'get',
            dataType : 'json',
            success : function(data) {
                if (data.msg.success) {
                    $(".modal-title").html("更新用户");
                    $("#name").val(data.user.name);
                    $("#username").val(data.user.username);
                    $("#password").val(data.user.password);
                    $("#phone").val(data.user.phone);
                    $("#email").val(data.user.email);
                    var updateButton = ' <button class="btn btn-primary" onclick="edit('+id+')" type="button">更新</button>'+
                    '<button class="btn btn-danger cancel" data-dismiss="modal">取消</button>';
                    $(".modal-footer").html(updateButton);
                }
            },
            error : function() {
                layer.msg("查询错误,请检查接口服务!");
            }
        });

    }

    function edit(id) {
        var params = {
            id:id,
            name:$("#name").val(),
            username:$("#username").val(),
            password:$("#password").val(),
            phone:$("#phone").val(),
            email:$("#email").val()
        };
        $.ajax({
            url : '<%=basePath%>admin/users/edit',
            type : 'post',
            data : params,
            dataType : 'json',
            success : function(data) {
                if (data.success) {
                    $("#modal-form").modal('hide');
                    layer.msg("更新成功!");
                    setTimeout(function () {
                        window.location.reload();
                    },1000);
                }
            },
            error : function() {
                layer.msg("更新错误,请重新操作");
            }
        });
    }

    function operation(id,status,btn) {
        $.ajax({
            url:"<%=basePath%>admin/users/edit",
            type:"post",
            data:{id:id,status:status},
            dataType:"json",
            success:function (data,status,jqXHR) {
                if(data.success){
                    modifyStatus(btn);
                }
            },
            error:function (jqXHR) {
                layer.msg("更新错误!");
            }
        });
    }

    function modifyStatus(btn){
        $btn=$(btn).parent().parent().children().eq(6).children();
        if($btn.text().trim()=='有效'){
            $btn.text('无效').removeClass('btn-success').addClass('btn-danger');
            $(btn).text('启用').removeClass('btn-danger').addClass('btn-success');
        }else{
            $btn.text('有效').removeClass('btn-danger').addClass('btn-success');
            $(btn).text('禁用').removeClass('btn-success').addClass('btn-danger');
        }
    }

    function delOne(id){
        layer.confirm("删除后将无法恢复，请谨慎操作！",{
                title:"确定要删除该友链吗?"
            },function (index) {
                $.ajax({
                    url:"<%=basePath%>admin/users/delOne?id="+id,
                    type:"get",
                    dataType:"json",
                    success:function (data,status,jqXHR) {
                        if(data.success){
                            layer.msg("删除成功!");
                            setTimeout(function () {
                                window.location.reload();
                            },1000);
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
                    url:"<%=basePath%>admin/users/delBatch",
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

