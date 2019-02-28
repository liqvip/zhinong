
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

var initNotice = function () {
    $.ajax({
        url:"/home/news/initNotice",
        type:"GET",
        dataType:"json",
        success:function (data,status,jqXHR) {
            if(data.msg.success){
                var notices = "";
                var more_notice = "<a href='/home/news/selectNewsByCatId?catId="+data.notices[0].cat_id+"'>更多公告&gt;&gt;</a>";
                for(var i=0;i<data.notices.length;i++){
                    notices += "<li><a href='/home/news/selectNewsById?id="+data.notices[i].id+"'>"+data.notices[i].title+"</a></li>";
                }
            }
            $(".notices").html(notices);
            $(".more_notice").html(more_notice);
        },
        error:function (jqXHR) {
            layer.mgs("公告接口服务错误，请检查后重试!");
        }
    });
};

var initRecommended = function () {
  $.ajax({
      url:"/home/raise/initRecommended",
      type:"GET",
      dataType:"JSON",
      success:function (data,satus,jqXHR) {
          if(data.msg.success){
              data = data.raises;
              var recommended = "";
              for(var i=0;i<data.length;i++){
                  recommended += '<div class="col-md-4"> <a href="/home/raise/'+data[i].id+'/detail"> <img src="'+data[i].images+'" alt=""> </a>'+
                  '<a href=""> <h2>'+data[i].name+'</h2> </a> <h3> <span>周期：'+data[i].cycle+'个月</span> <span>单价: ￥'+data[i].price+'元</span> </h3> </div>';
              }
              $(".recommend").html(recommended);
          }
      },
      error:function (jqXHR) {
          layer.msg("养殖推荐接口错误，请检查后重试！");
      }
  });
};

var initNewsTab = function () {
    $.ajax({
        url:"/home/news/initNewsTab",
        type:"GET",
        dataType:"JSON",
        success:function (data,status,jqXHR) {
            data = data.news;
            var tab_button = "";
            var indexTab = 0;
            for (var type in data) {
                if (indexTab == 0) {
                    tab_button += "<li class='newscurrent'>" + type + "</li>"
                } else {
                    tab_button += "<li>" + type + "</li>"
                }
                indexTab++;
            }
            $(".tab_buttons ul").html(tab_button);

            var index = 0;
            var newsitem = "";
            for (var type in data) {
                var newspic = "";
                var newslist = "";
                if (index == 0) {
                    newsitem += "<div class='newsitem' style='display: block;'><div class='newspic'><ul>";
                } else {
                    newsitem += "<div class='newsitem' style='display: none;'><div class='newspic'><ul>";
                }
                index++;
                newslist += "<ul class='newslist'>"
                for (var i = 0; i < data[type].length; i++) {
                    var id = data[type][i].id;
                    if (i < 2) {
                        newspic += "<li><a href='/home/news/"+id+"/selectNewsById' target='_blank'><img src=" + data[type][i].images + "> <span>" + data[type][i].title + "</span></a></li>";
                    }
                    if (i >= 1) {
                        newslist += "<li><i></i><a href='/home/news/"+id+"/selectNewsById' target='_blank'>" + data[type][i].title + "<p>" + data[type][i].introduction + "</p></a></li>";
                    }
                }
                newspic += "</ul></div>"
                newsitem += newspic;
                newsitem += newslist;
                newsitem += "</ul></div>"
            }
            $('.newstab').html(newsitem);
        },
        error:function () {
            layer.msg("新闻Tab接口错误，请检查后重试!");
        }
    });
};

var initAllLink = function () {
    $.ajax({
        url:"/home/link/initAllLink",
        type:"GET",
        dataType:"JSON",
        success:function (data,status,jqXHR) {
            if(data.msg.success){
                var links = "";
                for(var i=0;i<data.links.length;i++){
                    links  += "<li><a href='"+data.links[i].url+"' target='_blank'>"+data.links[i].name+"</a></li>";
                }
                $(".flink ul").html(links);
            }
        },
        error:function (jqXHR) {
            layer.msg("友情链接接口错误，请检查后重试！");
        }
    });
}
$(document).ready(function () {
    initAllSlide();
    initNotice();
    initNewsTab();
    initAllLink();
    initRecommended();
    $('.tab_buttons').on('click',"li",function(){
        $(this).addClass('newscurrent').siblings().removeClass('newscurrent');
        $('.newstab>div:eq('+$(this).index()+')').show().siblings().hide();
    });
});

