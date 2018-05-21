 /*两个模态框的点击事件*/
$(".goregister").click(function(){
     $("#mymodal_login").modal("hide");
     $("#mymodal_register").modal("show");
});

$(".gologin").click(function(){
     $("#mymodal_login").modal("show");
     $("#mymodal_register").modal("hide");
});

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