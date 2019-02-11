<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<%@include file="../main_admin.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>admin/css/webupload-demo.css">
	<title>知农后台</title>
</head>
<body>
	<div class="row">
		<!-- 右侧设计 -->
		<div class="col-md-12">
            <form action="" class="form-horizontal">
                 <div class="form-group">
                    <label for="" class="col-sm-2 control-label">封面：</label>
                     <div class="col-sm-8">
                         <a href="#pic" class="picPath" data-toggle="modal" onclick="findPicList()">
                             <img id="imagePath" src="${sraise.images}" style="width: 190px; height: 115px;" alt="封面" title="点击更换封面"/>
                         </a>
                     </div>
                 </div>
                 <div class="form-group">
                     <label for="" class="col-sm-2 control-label">名称：</label>
                     <div class="col-sm-8">
                         <input type="text" name="name" value="${sraise.name}" class="form-control">
                     </div>
                 </div>
                 <div class="form-group">
                     <label for="" class="col-sm-2 control-label">类别：</label>
                     <div class="col-sm-8">
                         <select name="catId" id="" class="selectpicker" data-live-search="true" title="请选择类别">
                             <c:forEach items="${raiseCats}" var="item" varStatus="index">
                                 <option value="${item.id}" <c:if test="${sraise.catId eq item.id}">selected</c:if>>${item.name}</option>
                             </c:forEach>
                         </select>
                     </div>
                 </div>
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">农场：</label>
                    <div class="col-sm-8">
                        <select name="farmId" id="" class="selectpicker" data-live-search="true" title="请选择类别">
                            <c:forEach items="${farms}" var="item" varStatus="index">
                                <option value="${item.id}" <c:if test="${sraise.farmId eq item.id}">selected</c:if>>${item.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">价格：</label>
                    <div class="col-sm-8">
                        <input type="text" name="price" value="${sraise.price}" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">收购价：</label>
                    <div class="col-sm-8">
                        <input type="text" name="profit" value="${sraise.profit}" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">周期：</label>
                    <div class="col-sm-8">
                        <input type="text" name="cycle" value="${sraise.cycle}" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">库存：</label>
                    <div class="col-sm-8">
                        <input type="text" name="stock" value="${sraise.stock}" class="form-control">
                    </div>
                </div>
            </form>
		</div><!--col-md-12-->
	</div><!--row-->
    <div class="row">
        <div class="col-md-10">
            <div class="text-right">
                <c:choose>
                    <c:when test="${empty sraise}">
                        <button class="btn btn-sm btn-primary" onclick="add()">
                            <span class="glyphicon glyphicon-pencil"></span> 添加
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-sm btn-primary" onclick="edit(${sraise.id})">
                            <span class="glyphicon glyphicon-pencil"></span> 修改
                        </button>
                    </c:otherwise>
                </c:choose>
                <button class="btn btn-sm btn-danger" onclick="javascript:history.back(-1);">
                    <span class="glyphicon glyphicon-backward"></span> 返回
                </button>
            </div>
        </div>
    </div>
    <%--选择封面模态框--%>
    <div class="modal inmodal" id="pic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:79.3%;margin-top:3%;">
            <div class="modal-content animated fadeInUp">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                        style="margin-right: 15px;margin-top: 10px;">&times;</button>
                <div id="uploader" class="wu-example"
                     style="margin:0px 5.6% 0  5.6%;">
                    <div class="queueList">
                        <div id="dndArea" class="placeholder"
                             style="min-height: 110px;padding-top: 0px;background:none">
                            <div id="filePicker" style="margin-top: 14px;">点击选择图片</div>
                            <p>或将照片拖到这里，单次最多可选300张</p>
                        </div>
                    </div>
                    <div class="statusBar" style="display:none;">
                        <div class="progress">
                            <span class="text">0%</span> <span class="percentage"></span>
                        </div>
                        <div class="info"></div>
                        <div class="btns">
                            <div id="filePicker2">继续添加</div>
                            <div class="uploadBtn">开始上传</div>
                        </div>
                    </div>
                </div>
                <div class="modal-body picsList"
                     style="height:260px;overflow:scroll; padding: 0px 30px 0px 30px;">
                </div>
            </div>
        </div>
    </div>

</body>

<script>
    //弹出模态框 选择图片
    var selectImgPath = function(img) {
        $("#pic").modal('hide');
        var imgPath = '<img id="imagePath"  style="width: 190px; height: 115px;" alt="封面" title="点击更换封面" src="' + img.src + '" />';
        $(".picPath").html(imgPath)
    };

    //查找服务器图库
    var findPicList = function() {
        $.ajax({
            //此处使用的是自己封装的JAVA类
            url : "<%=basePath%>admin/getFileList?dir=raise",
            type : "get",
            dataType:"json",
            success : function(data) {
                if (!data.success) {
                    layer.msg(data.msg);
                } else {
                    var pics = '';
                    for (var i = 0; i < data.fileList.length; i++) {
                        pics += '<a class="fancybox" href="javascript:void(0);">' +
                                    '<img onclick="selectImgPath(this)" style="width: 190px; height: 115px;float:left;margin-right:3px;" alt="image" src="' + data.fileList[i] + '"/>'+
                                '</a>';
                    }
                    $(".picsList").html(pics);
                }
            },
            error : function(e) {
                layer.msg("获取图片错误, 请检查接口服务");
            }
        });
    };

    //添加
    function add(){
        var params = {
            'images' : $("#imagePath").attr("src"),
            'name' : $("input[name=name]").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
            'catId' : $("select[name=catId]").val(),
            'farmId' : $("select[name=farmId]").val(),
            'price' : $("input[name=price]").val(),
            'profit' : $("input[name=profit]").val(),
            'cycle' : $("input[name=cycle]").val(),
            'stock' : $("input[name=stock]").val()
        };
        $.ajax({
            url : "<%=basePath%>admin/raise/add",
            type : "POST",
            data : params,
            dataType : 'json',
            success : function(data) {
                if (data.success) {
                    layer.msg("添加成功，农资已经在前端显示!");
                    $("input[name=name]").val("");
                    $("input[name=price]").val("");
                    $("input[name=profit]").val("");
                    $("input[name=cycle]").val("");
                    $("input[name=stock]").val("");
                }
            },
            error : function() {
                layer.msg("添加错误,请检查接口后重试!");
            }
        });
    }

    //修改
    function edit(id) {
        var params = {
            'id':id,
            'images' : $("#imagePath").attr("src"),
            'name' : $("input[name=name]").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
            'catId' : $("select[name=catId]").val(),
            'farmId' : $("select[name=farmId]").val(),
            'price' : $("input[name=price]").val(),
            'profit' : $("input[name=profit]").val(),
            'cycle' : $("input[name=cycle]").val(),
            'stock' : $("input[name=stock]").val()
        };
        $.ajax({
            url : "<%=basePath%>admin/raise/edit",
            type : "POST",
            data : params,
            dataType : 'json',
            success : function(data) {
                if (data.success) {
                    layer.msg("更新成功，农资已经在前端显示!");
                    setTimeout(function() {
                        window.location.href = "<%=basePath%>admin/raise";
                    }, 1500);
                }
            },
            error : function() {
                layer.msg("更新错误,请检查接口后重试!");
            }
        });
    }

</script>
<script>
    var BASE_URL = "<%=basePath%>admin/public/webuploader-0.1.5";
    var SERVER = "<%=basePath%>admin/raise/uploadPic"
</script>
<script src="<%=basePath%>admin/js/webuploader-demo.js"></script>
</html>
