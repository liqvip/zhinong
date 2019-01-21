package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/
import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.pojo.News;
import cn.blogss.pojo.NewsCat;
import cn.blogss.service.NewsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/home/")
public class NewsControllerHome {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "news/selectNewsByCatId",method = {RequestMethod.GET,RequestMethod.POST})
    public String newsList(@ModelAttribute News news, Model model,
                           @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/home/news/selectNewsByCatId?pageIndex={0}";
        if(news.getCatId() != null && news.getCatId().toString() != "")
            submitUrl += "&catId="+news.getCatId();

        List<News> newsList = newsService.selectNewsByPage(pageIndex, Page.pageSize,news);
        int totalNum = newsService.totRecord(news);
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);

        model.addAttribute("page",page);
        model.addAttribute("news",newsList);

        return  "home/news/list";
    }

    //    select news by id
    @RequestMapping(value = "news/selectNewsById",method = {RequestMethod.POST,RequestMethod.GET})
    public String selectNewsById(@RequestParam("id") String id,Model model){
        News snews = newsService.selectNewsById(id);
        model.addAttribute("snews",snews);
        return "home/news/info";
    }

}