package cn.blogss.controller;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Farm;
import cn.blogss.pojo.User;
import cn.blogss.service.FarmService;
import cn.blogss.service.UserService;
import cn.blogss.utils.TimeUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/admin")
public class FarmController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private FarmService farmService;


//    后台农场添加
    @RequestMapping(value = "/farm/add",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String farmAdd(@ModelAttribute Farm farm , @RequestAttribute("file")MultipartFile file) throws
            IOException {
        //农场头像处理
        if(!file.isEmpty()){
            String newFileName = System.currentTimeMillis()+file.getOriginalFilename();
            farm.setFarmImg(newFileName);
            System.out.println(request.getServletContext().getRealPath("images"));
            File newFile = new File(request.getServletContext().getRealPath("admin\\images\\farm"),newFileName);
            FileUtils.copyInputStreamToFile(file.getInputStream(),newFile);
        }

        //model处理
        String str = farmService.farmAdd(farm);
        return  str;
    }

//    后台农场查看,分页
    @RequestMapping(value = "/farm/scan/{pageNow}",method = RequestMethod.GET,produces = "application/json;" +
            "charset=utf-8")
    @ResponseBody
        public String farmScan(@PathVariable int pageNow) throws JsonProcessingException {
           String str  = farmService.farmSelectAll(pageNow);
           return  str;
    }

    //    后台农场查看全部
    @RequestMapping(value = "/farm/scanall",method = RequestMethod.GET,produces = "application/json;" +
            "charset=utf-8")
    @ResponseBody
    public String farmScanAll() throws JsonProcessingException {
        String str  = farmService.farmSelectAll2();
        return  str;
    }

//    后台农场删除
    @RequestMapping(value = "farm/delete/{farmId}",method = RequestMethod.GET)
    public void farmDelete(@PathVariable int farmId,HttpServletResponse response) throws IOException {
        farmService.farmDelete(farmId);
        //设置响应头
        response.setHeader("content-type","text/html;charset=utf-8");
        //获取PrintWrite输出流
        PrintWriter out = response.getWriter();
        out.write("success");
    }


//    农场信息修改
    @RequestMapping(value = "farm/modify",method = RequestMethod.POST)
    public void farmModify(HttpServletResponse response,@ModelAttribute Farm farm) throws IOException {
        farmService.farmModify(farm);
        response.setContentType("text/html;charset=utf=8");
        response.getWriter().write("success");

    }

}
