<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<%@include file="../main_admin.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>admin/css/webupload-demo.css">
    <link rel="stylesheet" href="<%=basePath%>admin/css/news.css">
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
                             <img id="imagePath" src="${snews.images}" style="width: 190px; height: 115px;" alt="封面" title="点击更换封面"/>
                         </a>
                     </div>
                 </div>
                 <div class="form-group">
                     <label for="" class="col-sm-2 control-label">标题：</label>
                     <div class="col-sm-8">
                         <input type="text" name="title" value="${snews.title}" class="form-control">
                     </div>
                 </div>
                 <div class="form-group">
                     <label for="" class="col-sm-2 control-label">摘要：</label>
                     <div class="col-sm-8">
                         <input type="text" name="introduction" value="${snews.introduction}" class="form-control">
                     </div>
                 </div>
                 <div class="form-group">
                     <label for="" class="col-sm-2 control-label">类别：</label>
                     <div class="col-sm-8">
                         <select name="catId" id="" class="selectpicker" data-live-search="true" title="请选择类别">
                             <c:forEach items="${newsCats}" var="item" varStatus="index">
                                 <option value="${item.id}" <c:if test="${snews.catId eq item.id}">selected</c:if>>${item.name}</option>
                             </c:forEach>
                         </select>
                     </div>
                 </div>
            </form>
		</div><!--col-md-12-->
	</div><!--row-->
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-9">
            <div id="summernote">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10">
            <div class="text-right">
                <button class="btn btn-sm btn-primary" onclick="prevNews()" data-target="#myModal" data-toggle="modal">
                    <span class="glyphicon glyphicon-new-window"></span> 预览
                </button>
                <c:choose>
                    <c:when test="${!empty snews}">
                        <button class="btn btn-sm btn-info" onclick="edit(-1,${snews.id})">
                            <span class="glyphicon glyphicon-pencil"></span> 存为草稿
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-sm btn-info" onclick="add(-1)">
                            <span class="glyphicon glyphicon-pencil"></span> 存为草稿
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

    <%--预览模态框--%>
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
                            <c:if test="${!empty snews}">
                                <span class="glyphicon glyphicon-time"></span>
                                <fmt:formatDate value="${snews.addtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <span>共<b> ${snews.clicknum} </b>人围观</span>
                            </c:if>
                        </div>
                        <div class="news_about">
                            <strong>简介 </strong><span class="news_intr"> </span>
                        </div>
                        <div class="news_infos"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <c:choose>
                        <c:when test="${!empty snews}">
                            <button onclick="edit(1,${snews.id})" class="btn btn-primary" data-dismiss="modal">发布</button>
                        </c:when>
                        <c:otherwise>
                            <button onclick="add(1)" class="btn btn-primary" data-dismiss="modal">发布</button>
                        </c:otherwise>
                    </c:choose>
                    <button  class="btn btn-danger" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    <%--初始化富文本--%>
    $(document).ready(function () {
        $('#summernote').summernote({
            height: 400,
            minHeight : null, //最小高度
            maxHeight : null, //最大高度
            placeholder: '请在这里写下您的内容',
            tabsize: 2,
            onImageUpload : function(files, editor, $editable) {
                sendFile(files[0], editor, $editable);
            }
        });
        $("#summernote").summernote('code',"${snews.content}");
    });

    //图片上传
    function sendFile(file, editor, $editable) {
        var filename = false;
        try {
            filename = file['name'];
        } catch (e) {
            filename = false;
        }
        if (!filename) {
            $(".note-alarm").remove();
        }

        //以上防止在图片在编辑器内拖拽引发第二次上传导致的提示错误
        data = new FormData();
        data.append("file", file);
        data.append("key", filename); //唯一性参数

        $.ajax({
            data : data,
            type : "POST",
            url : "../uploadBlogImages",
            dataType : "json",
            cache : false,
            contentType : false,
            processData : false,
            success : function(date) {
                if (date == '') {
                    swal("上传失败", "请重试操作", "error");
                } else {
                    var path = '图片地址  ' + date.path;
                    swal("上传成功", path, "success");
                }
                editor.insertImage($editable, date.path);
            },
            error : function() {
                swal("上传错误", "请重试操作", "error");
            }
        });
    }

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
            url : "<%=basePath%>admin/getFileList?dir=news",
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

    //预览
    function prevNews(){
        $(".newsview").find(".news_title").html($("input[name=title]").val());
        $(".news_about").find(".news_intr").html($("input[name=introduction]").val());
        $(".newsview").find(".news_infos").html($("#summernote").summernote('code'));
    }

    //添加
    function add(status){
        var params = {
            'images' : $("#imagePath").attr("src"),
            'title' : $("input[name=title]").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
            'introduction' : $("input[name=introduction]").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
            'catId' : $("select[name=catId]").val(),
            'content' : $(".news_infos").html(),
            'status' :status
        };
        $.ajax({
            url : "<%=basePath%>admin/news/add",
            type : "POST",
            data : params,
            dataType : 'json',
            success : function(data) {
                if (data.success) {
                    $("#myModal").modal('hide');
                    if(status == 1){
                        layer.msg("发布成功，新闻已经在前端显示!");
                    }else if(status == -1){
                        layer.msg("放入草稿成功,你可以前往草稿箱查看!");
                    }
                    $("input[name=title]").val("");
                    $("input[name=introduction]").val("");
                    $("#summernote").summernote('code',"");
                }
            },
            error : function() {
                if (status == 1) {
                    layer.msg("发布失败,请重新操作!");
                } else if (status == -1) {
                    layer.msg("放入草稿失败,请重新操作!");
                }
            }
        });
    }

    //放入草稿箱或修改
    function edit(status,id) {
        var params = {
            'id':id,
            'images' : $("#imagePath").attr("src"),
            'title' : $("input[name=title]").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
            'introduction' : $("input[name=introduction]").val().replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, "&quot;").replace(/'/g, "&#039;"),
            'catId' : $("select[name=catId]").val(),
            'content' : $("#summernote").summernote('code'),
            'status' :status
        };
        $.ajax({
            url : "<%=basePath%>admin/news/edit",
            type : "POST",
            data : params,
            dataType : 'json',
            success : function(data) {
                if (data.success) {
                    $("#myModal").modal('hide');
                    if(status == 1){
                        layer.msg("更新成功，新闻已经在前端显示!");
                    }else if(status == -1){
                        layer.msg("放入草稿成功,你可以前往草稿箱查看!");
                    }
                    setTimeout(function() {
                        window.location.href = "<%=basePath%>admin/news";
                    }, 1500);
                }
            },
            error : function() {
                if (status == 1) {
                    layer.msg("发布失败,请重新操作!");
                } else if (status == -1) {
                    layer.msg("放入草稿失败,请重新操作!");
                }
            }
        });
    }

</script>
<script>
    var BASE_URL = "<%=basePath%>admin/public/webuploader-0.1.5";
    var SERVER = "<%=basePath%>admin/news/uploadPic"
</script>
<script src="<%=basePath%>admin/js/webuploader-demo.js"></script>
</html>
