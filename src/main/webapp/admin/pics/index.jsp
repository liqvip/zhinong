<%--
  Created by liqiang at 2018/12/27 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../main_admin.jsp"%>
    <link rel="stylesheet" href="<%=basePath%>admin/webupload-demo.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div id="uploader" class="wu-example">
                    <div class="queueList">
                        <div id="dndArea" class="placeholder">
                            <div id="filePicker" class="webuploader-container">
                            </div>
                            <p>或将照片拖到这里，单次最多可选300张</p>
                        </div>
                    </div>
                    <div class="statusBar" style="display:none;">
                        <div class="progress">
                            <span class="text">0%</span>
                            <span class="percentage"></span>
                        </div>
                        <div class="info"></div>
                        <div class="btns">
                            <div id="filePicker2" class="webuploader-container">
                            </div>
                            <div class="uploadBtn state-pedding">开始上传</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    var BASE_URL = "<%=basePath%>public/webuploader-0.1.5"
</script>
<script src="<%=basePath%>admin/js/webupload-demo.js"></script>
</html>
