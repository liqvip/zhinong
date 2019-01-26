package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/
import cn.blogss.annotation.AccessLimit;
import cn.blogss.common.util.pojo.Message;
import cn.blogss.common.util.pojo.Page;
import cn.blogss.pojo.News;
import cn.blogss.service.NewsService;
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
    @AccessLimit
    @RequestMapping(value = "news/selectNewsById",method = {RequestMethod.POST,RequestMethod.GET})
    public String selectNewsById(@RequestParam("id") String id,Model model){
        News snews = newsService.selectNewsById(id);
        selectPrevNews(id,model);
        selectNextNews(id,model);
        selectNewsByClick(model);
        model.addAttribute("snews",snews);
        return "home/news/info";
    }

    /**
     * 查询后一篇博客信息
     */
    @RequestMapping(value = "news/selectNextNews")
    public void selectNextNews(String id,Model model){
        News news=newsService.selectNextNews(id);
        model.addAttribute("nextNews",news);
    }

    /**
     * 查询前一篇博客信息
     */
    @RequestMapping(value = "news/selectPrevNews")
    public void selectPrevNews(String id,Model model){
        News news=newsService.selectPrevNews(id);
        model.addAttribute("preNews",news);
    }

    /**
     * 查询出点击前5的新闻
     */
    @RequestMapping(value = "news/selectNewsByClick")
    public void selectNewsByClick(Model model){
        List<News> news=newsService.selectNewsByClick();
        model.addAttribute("clickNews",news);
    }

    /*
    *初始化首页公告
    **/
    @RequestMapping(value = "news/initNotice",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> initNotice(){
        Map<String,Object> map = new HashMap<>();
        List<?> news = newsService.selectNotices();
        map.put("msg",new Message());
        map.put("notices",news);
        return map;
    }

    /*
     *初始化首页公告
     **/
    @RequestMapping(value = "news/initNewsTab",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Map<String,Object> initNewsTab(){
        Map<String,List<News>> map = newsService.initNewsTab();
        Map<String, Object> returnMap=new HashMap<String, Object>();
        returnMap.put("news",map);
        return returnMap;
    }
}
