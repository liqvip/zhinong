<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<%@include file="../main_admin.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>admin/css/webupload-demo.css">
</head>
<body>
	<div class="row">
		<!-- 右侧设计 -->
		<div class="col-md-12">
            <form action="" class="form-horizontal">
                 <div class="form-group">
                    <label for="" class="col-sm-2 control-label">图片：</label>
                     <div class="col-sm-8">
                         <a href="#pic" class="picPath" data-toggle="modal" onclick="findPicList()">
                             <img id="imagePath" src="${slide.image}" style="width: 190px; height: 115px;" alt="封面" url="点击更换封面"/>
                         </a>
                     </div>
                 </div>
                 <div class="form-group">
                     <label for="" class="col-sm-2 control-label">摘要：</label>
                     <div class="col-sm-8">
                         <input type="text" name="introduction" value="${slide.introduction}" class="form-control">
                     </div>
                 </div>
                 <div class="form-group">
                     <label for="" class="col-sm-2 control-label">目标地址：</label>
                     <div class="col-sm-8">
                         <input type="text" name="url" value="${slide.url}" class="form-control">
                     </div>
                 </div>
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">优先级：</label>
                    <div class="col-sm-8">
                        <input type="text" name="sort" value="${slide.sort}" class="form-control">
                    </div>
                </div>
            </form>
		</div><!--col-md-12-->
	</div><!--row-->
    <div class="row">
        <div class="col-md-10">
            <div class="text-right">
                <c:choose>
                    <c:when test="${empty slide}">
                        <button class="btn btn-sm btn-info" onclick="add()">
                            <span class="glyphicon glyphicon-pencil"></span> 添加
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-sm btn-info" onclick="edit(${slide.id})">
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
            url : "<%=basePath%>admin/getFileList?dir=slide",
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
            'sort':$("input[name=sort]").val(),
            'image' : $("#imagePath").attr("src"),
            'url' : $("input[name=url]").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
            'introduction' : $("input[name=introduction]").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;")
        };
        $.ajax({
            url : "<%=basePath%>admin/slide/add",
            type : "POST",
            data : params,
            dataType : 'json',
            success : function(data) {
                if (data.success) {
                        layer.msg("添加成功，幻灯片已经在前端显示!");
                    $("input[name=url]").val("");
                    $("input[name=introduction]").val("");
                    $("input[name=sort]").val("");
                }
            },
            error : function() {
                layer.msg("添加错误,请重新操作!");
            }
        });
    }

    //修改
    function edit(id) {
        var params = {
            'id':id,
            'sort':$("input[name=sort]").val(),
            'image' : $("#imagePath").attr("src"),
            'url' : $("input[name=url]").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
            'introduction' : $("input[name=introduction]").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;")
        };
        $.ajax({
            url : "<%=basePath%>admin/slide/edit",
            type : "POST",
            data : params,
            dataType : 'json',
            success : function(data) {
                if (data.success) {
                    layer.msg("修改成功，幻灯片已经在前端显示!");
                    setTimeout(function() {
                        window.location.href = "<%=basePath%>admin/slide";
                    }, 1500);
                }
            },
            error : function() {
                layer.msg("修改失败,请重新操作!");
            }
        });
    }

</script>
<script>
    var BASE_URL = "<%=basePath%>admin/public/webuploader-0.1.5";
    var SERVER = "<%=basePath%>admin/slide/uploadPic"
</script>
<script src="<%=basePath%>admin/js/webuploader-demo.js"></script>
</html>
