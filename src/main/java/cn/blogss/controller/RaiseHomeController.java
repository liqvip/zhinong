package cn.blogss.controller;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Raise;
import cn.blogss.service.RaiseService;
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
@RequestMapping("/home")
public class RaiseHomeController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private RaiseService raiseService;

//    农资详情
    @RequestMapping("/raise/raise_detail")
    public String raiseDetail(){
        return "home/raise/raise_detail";
    }


//    农资查看
    @RequestMapping(value = "/raise/scan/{pageNow}",method = RequestMethod.GET,produces = "application/json;" +
            "charset=utf-8")
    @ResponseBody
        public String raiseScan(@PathVariable int pageNow) throws JsonProcessingException {
           String str  = raiseService.raiseSelectAll(pageNow);
           return  str;
    }

}
