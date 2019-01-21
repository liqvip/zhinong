<%--
  Created by liqiang at 2019/1/17 
--%>
<%@page contentType="text/html;charset=utf-8" language="java" %>
<footer class="footer">
    <div class="" style="width: 1200px;margin: 0 auto">
        <div class="container">
            <div class="row">
                <div class="col-md-3"><img src="<%=basePath%>home/images/logo.png" alt="" style="margin-top: 20px;"></div>
                <div class="col-md-6">
                    <div class="footer_menu">
                        <ul>
                            <li>关于我们</li>
                            <li>联系我们</li>
                            <li>常见问题</li>
                            <li>加入我们</li>
                        </ul>
                        <div class="copytright">
                            <img src="<%=basePath%>home/images/footer/copyright.png" alt="" style="width: 20px">
                            <span style="margin-left: 10px;">赣公网安备14010902000157号 赣ICP备14001940号-4 </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <img src="<%=basePath%>home/images/footer/mywx.png" alt="" width="100px">
                    <img src="<%=basePath%>home/images/footer/mygzh.jpg" alt="" width="100px" style="margin-left: 10px;">
                </div>
            </div>
        </div>
    </div>
</footer>
<script>
    $(document).ready(function () {
    // 回到顶部
        $(window).scroll(function(){
            if($(window).scrollTop()<=100){
                $(".gotop").fadeOut();
            }else{
                $(".gotop").fadeIn();
            }
        });

        $(".gotop").click(function(){
            $("html,body").animate({scrollTop:0},500);
        });
    });
</script>