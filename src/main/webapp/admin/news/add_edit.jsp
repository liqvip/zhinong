<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<%@include file="../main_admin.jsp"%>
	<script src="../js/wangEditor3.js"></script>
	<title>知农后台</title>
</head>
<body>
	<div class="row">
		<!-- 右侧设计 -->
		<div class="col-md-12">
		<c:choose>
			<c:when test="${empty news}">
				<form action="<%=basePath%>admin/news/add">
			</c:when>
			<c:otherwise>
				<form action="<%=basePath%>admin/news/update">
					<input type="hidden" name="id" value="${news.id}">
			</c:otherwise>
		</c:choose>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">添加新闻</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label for="">新闻标题：</label>
						<input type="text" name="newsTitle"  class="form-control">
					</div>
					<div id="editor">

					</div>
					<div class="form-group">
						<label for="" style="display:block;">新闻分类</label>
						<select class="selectpicker" name="newsCatId">
						</select>
					</div>
					<div class="form-group">
						<input type="submit" value="提交" class="btn btn-primary">
					</div>
				</div>
			</div>
		</form>
		</div><!--col-md-12-->
	</div><!--row-->
</body>
<script>
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    // tab显示和隐藏
    // 下面两个配置，使用其中一个即可显示“上传图片”的tab。但是两者不要同时使用！！！
    //editor.customConfig.uploadImgShowBase64 = true;   // 使用 base64 保存图片
    //限制一次最多上传5张图片
    editor.customConfig.uploadImgMaxLength = 5
    //将图片大小限制为3M
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024
    // 上传图片到服务器
    editor.customConfig.uploadImgServer = '/admin/news/upload';
    //	自定义 fileName
    editor.customConfig.uploadFileName = 'file';

 	//   可使用监听函数在上传图片的不同阶段做相应处理
    editor.customConfig.uploadImgHooks = {
        before: function (xhr, editor, files) {
            // 图片上传之前触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件

            // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
            // return {
            //     prevent: true,
            //     msg: '放弃上传'
            // }
        },
        success: function (xhr, editor, result) {
            // 图片上传并返回结果，图片插入成功之后触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
        },
        fail: function (xhr, editor, result) {
            // 图片上传并返回结果，但图片插入错误时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
        },
        error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
        },
        timeout: function (xhr, editor) {
            // 图片上传超时时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
        },

        // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
        // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
			console.log(result);
            var url = "<%=basePath%>"+"admin/images/news/"+result.url;
            insertImg(url);

            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    }
    editor.create();

	<%--异步请求获得新闻类型--%>
	$(document).ready(function () {

		$.ajax({
			url:"../news_cat/scanall",
			method:"GET",
			dataType:"JSON",
			success:function (data,status,jqXHR) {
				newsCatStr = "";

				for(var i=0;i<data.length;i++){
					newsCatStr+="<option value='"+data[i].newsCatId+"'>"+data[i].catName+"</option>";
				}

				$("[name='newsCatId']").append(newsCatStr);
			},
			error:function (jqXHR) {
				alert(jqXHR.status);
			}
			});
	});

//        异步添加新闻
    $("form").submit(function (e) {
        e.preventDefault();
        $.ajax({
            url:"add",
            method:"POST",
            data:{
                newsCatId:$("[name='newsCatId']").val(),
				newsTitle:$("[name='newsTitle']").val(),
				newsContent:editor.txt.html()
			},
            dataType:"JSON",
            success:function (data,status,jqXHR) {
                if(data.success){
                    alert(data.msg);
                    window.location.href="./index.jsp";
                }else {
                    alert(data.msg);
                }
            },
            error:function (jqXHR) {
                    alert(jqXHR.status);
            }
        });
    });

</script>
</html>
