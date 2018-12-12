package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.RaiseCat;
import cn.blogss.service.RaiseCatService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/admin")
public class RaiseCatController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private RaiseCatService raiseCatService;

    public RaiseCatController(){
        System.out.println("RaiseCatController:我被注入啦");
    }

//    后台农资分类添加
    @RequestMapping(value = "/raise_cat/add",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String raiseCatAdd(@ModelAttribute RaiseCat raiseCat ){
        //model处理
        System.out.println("父ID："+raiseCat.getParentId());
        System.out.println("名称："+raiseCat.getCatName());

        String jsonStr = raiseCatService.raiseCatAdd(raiseCat);
        return  jsonStr;
    }

//    后台农资分类查看,分页
//    procudes解决数据返回到客户端乱码,response对象无效
    @RequestMapping(value = "/raise_cat/scan/{pageNow}",method = RequestMethod.GET,produces = "appplication/json;" +
            "charset=utf-8")
    @ResponseBody
        public String raiseCatScan(@PathVariable int pageNow) throws JsonProcessingException {
           String str  = raiseCatService.raiseCatSelectAll(pageNow);
           return  str;
    }

//    后台农资分类删除
    @RequestMapping(value = "raise_cat/delete/{raiseCatId}",method = RequestMethod.GET)
    public void raiseCatDelete(@PathVariable int raiseCatId,HttpServletResponse response) throws IOException {
        raiseCatService.raiseCatDelete(raiseCatId);
        //设置响应头
        response.setHeader("content-type","text/html;charset=utf-8");
        //获取PrintWrite输出流
        PrintWriter out = response.getWriter();
        out.write("success");
    }


//    农资分类信息修改
    @RequestMapping(value = "raise_cat/modify",method = RequestMethod.POST)
    public void raiseCatModify(HttpServletResponse response,@ModelAttribute RaiseCat raiseCat) throws IOException {

        raiseCatService.raiseCatModify(raiseCat);
        response.setContentType("text/html;charset=utf=8");
        response.getWriter().write("success");
    }

//    查找所有的农资分类
    @RequestMapping(value = "/raise_cat/scanall",method = RequestMethod.GET,produces = "appplication/json;" +
            "charset=utf-8")
    @ResponseBody
    public String raiseCatScanAll() throws JsonProcessingException {
        String str  = raiseCatService.raiseCatSelectAll2();
        return  str;
    }
}
