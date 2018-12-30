package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/


import cn.blogss.common.util.Message;
import cn.blogss.common.util.Page;
import cn.blogss.pojo.News;
import cn.blogss.pojo.NewsCat;
import cn.blogss.service.NewsCatService;
import cn.blogss.service.NewsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/")
public class NewsController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "news",method = {RequestMethod.GET,RequestMethod.POST})
    public String newsList(@ModelAttribute News news, Model model,
                              @RequestParam(value = "pageIndex",defaultValue = "1") String pageIndex){
        String submitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
                request.getContextPath()+"/admin/news?pageIndex={0}";

        if(!StringUtils.isEmpty(news.getTitle()))
            submitUrl += "&name="+news.getTitle();
        if(news.getCatId() != null && news.getCatId().toString() != "")
            submitUrl += "&catId="+news.getCatId();
        if(!StringUtils.isEmpty(news.getStatus()))
            submitUrl += "&status="+news.getStatus();

        List<News> newsList = newsService.selectNewsByPage(pageIndex, Page.pageSize,news);
        List<NewsCat> newsCats = newsService.addShow();
        int totalNum = newsService.totRecord(news);
        Page page = new Page();
        page.setPageIndex(Integer.parseInt(pageIndex));
        page.setTotalNum(totalNum);
        page.setSubmitUrl(submitUrl);

        model.addAttribute("snews",news);
        model.addAttribute("newsCats",newsCats);
        model.addAttribute("page",page);
        model.addAttribute("news",newsList);

        return  "admin/news/index";
    }


    //    后台新闻添加
    @RequestMapping(value = "news/add",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public  Message newsAdd(@ModelAttribute News news){
        news.setAddtime(new Date());
        newsService.add(news);
        return new Message();
    }

    //  删除单个新闻
    @RequestMapping(value = "news/delOne",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message newsDelOne(@RequestParam("id")String id){
        newsService.delOne(id);
        return new Message();
    }

    @RequestMapping(value = "news/delBatch",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message newsDelBatch(@RequestParam("ids")String[] ids){
        newsService.delBatch(ids);
        return new Message();
    }

    //    新闻修改
    @RequestMapping(value = "news/edit",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public Message newsEdit(@ModelAttribute News news){
        newsService.edit(news);
        return new Message();
    }

    @RequestMapping(value = "news/addShow",method = {RequestMethod.POST,RequestMethod.GET})
    public String addShow(Model model){
        List<NewsCat> newsCats = newsService.addShow();
        model.addAttribute("newsCats",newsCats);
        return "admin/news/add_edit";
    }

    @RequestMapping(value = "news/editShow",method = {RequestMethod.POST,RequestMethod.GET})
    public String editShow(Model model,String id){
        News snews = newsService.editShow(id);
        List<NewsCat> newsCats = newsService.addShow();
        model.addAttribute("snews",snews);
        model.addAttribute("newsCats",newsCats);
        return "admin/news/add_edit";
    }
}
