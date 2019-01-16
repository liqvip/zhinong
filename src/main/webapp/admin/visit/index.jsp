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
            访客列表
        </p>
        <form id="search" action="<%=basePath%>admin/visit" method="post" class="form-inline" style="margin-bottom: 20px;">
            <div class="form-group">
                <label for="">IP：</label>
                <input type="text" name="ip" value="${visit.ip}"  class="form-control">
            </div>
            <div class="form-group">
                <label for="platformtype">系统</label>
                <select name="platformtype" id="platformtype" class="form-control">
                    <option value="">全部</option>
                    <option value="Windows">Windows</option>
                    <option value="Mac">Mac</option>
                    <option value="Android">Android</option>
                    <option value="iPhone">iPhone</option>
                    <option value="iPad">iPad</option>
                </select>
            </div>
            <input type="submit" value="查 询" class="btn btn-primary">
            &nbsp;&nbsp;<button class="btn btn-primary" id="clear" type="button">清 空</button>
        </form>
        <c:choose>
            <c:when test="${empty visits}">
                <span class="center-block text-danger">未找到您想查询的记录!</span>
            </c:when>
            <c:otherwise>
                <table class="table table-hover table-condensed table-bordered">
                    <tr>
                        <th>序号</th>
                        <th>IP</th>
                        <th>地区</th>
                        <th>浏览器</th>
                        <th>系统</th>
                        <th>访问时间</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${visits}" var="item" varStatus="id">
                        <tr>
                            <td>${(page.pageIndex-1)*page.pageSize+id.index+1}</td>
                            <td>${item.ip}</td>
                            <td>${item.city}</td>
                            <td>${item.browsertype}</td>
                            <td>${item.platformtype}</td>
                            <td style="width: 200px">
                                <fmt:formatDate value="${item.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td style="width: 250px">
                                <button class="btn btn-danger btn-sm" onclick="editShow(${item.id})">
                                    <span class="glyphicon glyphicon-lock"></span> 加入黑名单
                                </button>
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
            $(".form-group input").val("");
            $("select").each(function (i,n) {
                $(n).find("option:selected").attr("selected",false);
                $(n).find("option").first().attr("selected",true);
            });
        });
    });
</script>
</html>

