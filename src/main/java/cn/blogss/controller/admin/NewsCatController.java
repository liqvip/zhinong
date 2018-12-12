package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.NewsCat;
import cn.blogss.service.NewsCatService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/admin")
public class NewsCatController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private NewsCatService newsCatService;

    public NewsCatController(){
        System.out.println("NewsCatController:我被注入啦");
    }

//    后台新闻分类添加
    @RequestMapping(value = "/news_cat/add",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String newsCatAdd(@ModelAttribute NewsCat newsCat ){
        //model处理
        System.out.println("父ID："+newsCat.getParentId());
        System.out.println("名称："+newsCat.getCatName());

        String jsonStr = newsCatService.newsCatAdd(newsCat);
        return  jsonStr;
    }

//    后台新闻分类查看,分页
//    procudes解决数据返回到客户端乱码,response对象无效
    @RequestMapping(value = "/news_cat/scan/{pageNow}",method = RequestMethod.GET,produces = "appplication/json;" +
            "charset=utf-8")
    @ResponseBody
        public String newsCatScan(@PathVariable int pageNow) throws JsonProcessingException {
           String str  = newsCatService.newsCatSelectAll(pageNow);
           return  str;
    }

//    后台新闻分类删除
    @RequestMapping(value = "news_cat/delete/{newsCatId}",method = RequestMethod.GET)
    public void newsCatDelete(@PathVariable int newsCatId,HttpServletResponse response) throws IOException {
        newsCatService.newsCatDelete(newsCatId);
        //设置响应头
        response.setHeader("content-type","text/html;charset=utf-8");
        //获取PrintWrite输出流
        PrintWriter out = response.getWriter();
        out.write("success");
    }


//    新闻分类信息修改
    @RequestMapping(value = "news_cat/modify",method = RequestMethod.POST)
    public void newsCatModify(HttpServletResponse response,@ModelAttribute NewsCat newsCat) throws IOException {

        newsCatService.newsCatModify(newsCat);
        response.setContentType("text/html;charset=utf=8");
        response.getWriter().write("success");
    }

//    查找所有的新闻分类
    @RequestMapping(value = "/news_cat/scanall",method = RequestMethod.GET,produces = "appplication/json;" +
            "charset=utf-8")
    @ResponseBody
    public String newsCatScanAll() throws JsonProcessingException {
        String str  = newsCatService.newsCatSelectAll2();
        return  str;
    }
}
