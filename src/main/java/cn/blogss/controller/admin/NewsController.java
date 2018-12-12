package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Farm;
import cn.blogss.pojo.News;
import cn.blogss.service.NewsService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class NewsController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private NewsService newsService;

    public NewsController(){
        System.out.println("NewsController:我被注入啦");
    }

    //    新闻图片上传
    @RequestMapping(value = "/news/upload",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String imgUpload(@RequestAttribute("file")MultipartFile file) throws
            IOException {
        //图片处理
        String newFileName = "";
        if(!file.isEmpty()){
            newFileName = System.currentTimeMillis()+file.getOriginalFilename();
            System.out.println(request.getServletContext().getRealPath("images"));
            File newFile = new File(request.getServletContext().getRealPath("admin\\images\\news"),newFileName);
            FileUtils.copyInputStreamToFile(file.getInputStream(),newFile);
        }

        return  "{\"url\":\""+newFileName+"\"}";
    }

//    新闻详情
    @RequestMapping(value = "/news/detail/{newsId}",method = RequestMethod.GET)
    public ModelAndView newsDetail(@PathVariable int newsId){
        ModelAndView mav = new ModelAndView("admin/news/detail");
        Map map = newsService.newsDetail(newsId);
        System.out.println(map.get("newsTitle"));
        mav.addObject("newsTitle",map.get("newsTitle"));
        mav.addObject("newsContent",map.get("newsContent"));

        return mav;
    }

//    后台新闻添加
    @RequestMapping(value = "/news/add",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String newsAdd(@ModelAttribute News news ){
        //model处理

        String jsonStr = newsService.newsAdd(news);
        return  jsonStr;
    }

//    后台新闻查看,分页
//    procudes解决数据返回到客户端乱码,response对象无效
    @RequestMapping(value = "/news/scan/{pageNow}",method = RequestMethod.GET,produces = "appplication/json;" +
            "charset=utf-8")
    @ResponseBody
        public String newsScan(@PathVariable int pageNow) throws JsonProcessingException {
           String str  = newsService.newsSelectAll(pageNow);
           return  str;
    }

//    后台新闻删除
    @RequestMapping(value = "news/delete/{newsId}",method = RequestMethod.GET)
    public void newsDelete(@PathVariable int newsId,HttpServletResponse response) throws IOException {
        newsService.newsDelete(newsId);
        //设置响应头
        response.setHeader("content-type","text/html;charset=utf-8");
        //获取PrintWrite输出流
        PrintWriter out = response.getWriter();
        out.write("success");
    }


//    新闻信息修改
    @RequestMapping(value = "news/modify",method = RequestMethod.POST)
    public void newsModify(HttpServletResponse response,@ModelAttribute News news) throws IOException {

        newsService.newsModify(news);
        response.setContentType("text/html;charset=utf=8");
        response.getWriter().write("success");
    }

//    查找所有的新闻
    @RequestMapping(value = "/news/scanall",method = RequestMethod.GET,produces = "appplication/json;" +
            "charset=utf-8")
    @ResponseBody
    public String newsScanAll() throws JsonProcessingException {
        String str  = newsService.newsSelectAll2();
        return  str;
    }
}
