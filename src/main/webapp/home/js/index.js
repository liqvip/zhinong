
var initAllSlide = function () {
    $.ajax({
        url:"/home/slide/initAllSlide",
        type:"GET",
        dataType:"json",
        success:function (data,status,jqXHR) {
            if(data.msg.success){
                var indicator = "";
                var slide = "";
                for(var i=0;i<data.slides.length;i++){
                    if(i == 0){
                        indicator += "<li data-target='#carousel-example-generic' " +
                            "data-slide-to='"+i+"' class='active'></li>";
                        slide += "<div class='item active'><img src='"+data.slides[i].image+"' alt='...' style='width: 1440px;height: 400px'>" +
                            "<div class='carousel-caption'><p>"+data.slides[i].introduction+"</p></div></div>";
                    }else{
                        indicator += "<li data-target='#carousel-example-generic' " +
                            "data-slide-to='"+i+"'></li>";
                        slide += "<div class='item'><img src='"+data.slides[i].image+"' alt='...' style='width: 1440px;height: 400px'>" +
                            "<div class='carousel-caption'><p>"+data.slides[i].introduction+"</p></div></div>";
                    }
                }
            }
            $(".carousel-indicators").html(indicator);
            $(".carousel-inner").html(slide);
        },
        error:function (jqXHR) {
            layer.mgs("接口服务错误，请检查后重试!");
        }
    });
};

$(document).ready(function () {
    initAllSlide();
});