<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../main_admin.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>admin/css/news.css">
</head>
<body>
<div class="row">
    <!-- 右侧设计 -->
    <div class="col-md-12">
        <p id="title">
            新闻列表
            <a class="btn btn-primary" href="<%=basePath%>admin/news/addShow">新 增</a>
            <a class="btn btn-danger" onclick="delBatch()">删 除</a>
        </p>
        <form action="<%=basePath%>admin/news" method="post" class="form-inline" style="margin-bottom: 20px;">
            <div class="form-group">
                <label for="">标题</label>
                <input type="text" name="title" value="${snews.title}" id="" class="form-control">
            </div>
            <div class="form-group">
                <select name="catId" id="" class="selectpicker" data-live-search="true" title="请选择类别">
                    <c:forEach items="${newsCats}" var="item" varStatus="index">
                        <option value="${item.id}" <c:if test="${snews.catId eq item.id}">selected</c:if>>${item.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <select name="status" id="" class="selectpicker" data-live-search="true" title="请选择状态">
                    <option value="1" <c:if test="${snews.status eq 1}">selected</c:if>>发布</option>
                    <option value="-1" <c:if test="${snews.status eq -1}">selected</c:if>>草稿</option>
                    <option value="2" <c:if test="${snews.status eq 2}">selected</c:if>>垃圾箱</option>
                </select>
            </div>
            <input type="submit" value="查 询" class="btn btn-primary">
            &nbsp;&nbsp;<input type="button" value="清 空" id="clear" class="btn btn-primary">
        </form>
        <c:choose>
            <c:when test="${empty news}">
                <span class="center-block text-danger">未找到您想查询的记录!</span>
            </c:when>
            <c:otherwise>
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>
                            <input type="checkbox" name="all" onclick="selectAll()">
                        </th>
                        <th>序号</th>
                        <th>标题</th>
                        <th>类别</th>
                        <th>浏览量</th>
                        <th>状态</th>
                        <th>发表时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${news}" var="item" varStatus="id">
                        <tr>
                            <td style="width: 60px">
                                <input type="checkbox" name="id" value="${item.id}">
                            </td>
                            <td style="width: 55px">${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${fn:length(item.title) > 15}">
                                        <c:out value="${fn:substring(item.title, 0, 15)}......" />
                                    </c:when>
                                    <c:otherwise>
                                        ${item.title}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${item.newsCat.name}</td>
                            <td>${item.clicknum}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.status == 1}"><button class="btn btn-success btn-xs">发表</button></c:when>
                                    <c:when test="${item.status == -1}"><button class="btn btn-warning btn-xs">草稿</button></c:when>
                                    <c:otherwise><button class="btn btn-danger btn-xs">垃圾箱</button></c:otherwise>

                                </c:choose>
                            </td>
                            <td style="width: 200px">
                                <fmt:formatDate value="${item.addtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td style="width: 250px">
                                <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal"
                                   onclick="selectNewsById(${item.id})">查看</a>
                                <c:choose>
                                    <c:when test="${item.status == -1}">
                                        <a class="btn btn-info btn-sm" onclick="operation(${item.id},'发表')">发表</a>
                                    </c:when>
                                    <c:when test="${item.status == -1}">
                                        <a class="btn btn-info btn-sm" onclick="operation(${item.id},'还原')">还原</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="btn btn-info btn-sm" href="<%=basePath%>admin/news/editShow?id=${item.id}">修改</a>
                                    </c:otherwise>
                                </c:choose>
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
    <%--查看模态框--%>
    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog"
         aria-hidden="true">
        <div class="modal-dialog" style="width:702px">
            <div class="modal-content animated fadeInUp">
                <button type="button" class="close" style="margin-right:7px"
                        data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="infos" style="margin:0px;">
                    <div class="newsview" style="padding-top:0px;">
                        <h3 class="news_title"></h3>
                        <div class="news_author">
                            <span class="glyphicon glyphicon-user"></span>liq
                            <span class="glyphicon glyphicon-calendar"></span><i class="au02"></i>
                            <span class="au03">共<b></b>人围观</span>
                        </div>
                        <div class="news_about">
                            <strong>简介 </strong><span class="news_intr"> </span>
                        </div>
                        <div class="news_infos"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span class="update"></span>
                    <a class="btn btn-danger" data-dismiss="modal">关闭</a>
                </div>
            </div>
        </div>
    </div>
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
                    url:"<%=basePath%>admin/news/delOne?id="+id,
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
                    url:"<%=basePath%>admin/news/delBatch",
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
    
    function selectNewsById(id) {
        $.ajax({
            url : '<%=basePath%>admin/news//selectNewsById?id='+id,
            type : 'get',
            dataType : 'json',
            success : function(data) {
                //查询成功
                if (data.msg.success) {
                    $(".newsview").find(".news_title").html(data.snews.title);
                    $(".newsview").find(".au02").html(Format(data.snews.addtime, "yyyy-MM-dd hh:mm:ss"));
                    $(".au03").find('b').html(" "+data.snews.clicknum+" ");
                    $(".news_about").find(".news_intr").html(data.snews.introduction);
                    $(".newsview").find(".news_infos").html(data.snews.content);
                    var update = '<a class="btn btn-primary" href="<%=basePath%>admin/news/editShow?id=' + data.snews.id + '">编辑</a>';
                    $(".modal-footer").find(".update").html(update);
                }
            },
            error : function() {
                layer.msg("查询错误,请重新操作!");
            }
        });
    }

    function operation(id,op) {
        var title = "";
        var text = "";
        if (op == "还原") {
            title = '确定要移出回收站吗?';
            text = '移出后,将显示在前台页面';
        } else if (op == "发表") {
            title = '确定要发表吗?';
            text = '发表后,将显示在前台页面';
        }
        layer.confirm(text,{
                title:title
            },function (index) {
                $.ajax({
                    url:"<%=basePath%>admin/news/edit",
                    type:"post",
                    data:{id:id,status:"1"},
                    dataType:"json",
                    success:function (data,status,jqXHR) {
                        if(data.success){
                            window.location.reload();
                            layer.msg("更新成功!");
                    }
                    },
                    error:function (jqXHR) {
                        layer.msg("更新错误!");
                    }
                });
            }
        );
    }

    //格式化时间
    function Format(datetime, fmt) {
        if (parseInt(datetime) == datetime) {
            if (datetime.length == 10) {
                datetime = parseInt(datetime) * 1000;
            } else if (datetime.length == 13) {
                datetime = parseInt(datetime);
            }
        }
        datetime = new Date(datetime);
        var o = {
            "M+" : datetime.getMonth() + 1, //月份
            "d+" : datetime.getDate(), //日
            "h+" : datetime.getHours(), //小时
            "m+" : datetime.getMinutes(), //分
            "s+" : datetime.getSeconds(), //秒
            "q+" : Math.floor((datetime.getMonth() + 3) / 3), //季度
            "S" : datetime.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>
</html>

