package cn.blogss.controller;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Raise;
import cn.blogss.service.RaiseService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class RaiseController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private RaiseService raiseService;


//    后台农资添加
    @RequestMapping(value = "/raise/add",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String raiseAdd(@ModelAttribute Raise raise , @RequestAttribute("fileMore")MultipartFile[] fileMore,
                           @RequestAttribute("fileOne") MultipartFile fileOne) throws IOException {
        //农资缩略图处理
        if(!fileOne.isEmpty()){
            String newFileName = System.currentTimeMillis()+fileOne.getOriginalFilename();
            raise.setRaiseThums(newFileName);
            System.out.println(request.getServletContext().getRealPath("images"));
            File newFile = new File(request.getServletContext().getRealPath("admin\\images\\raise"),newFileName);
            FileUtils.copyInputStreamToFile(fileOne.getInputStream(),newFile);
        }

        //农资图片处理,多图
        if(fileMore.length!=0&&fileOne!=null){
            List<String> ls = new ArrayList<String>();

            for(MultipartFile fs:fileMore){
                String newFileName = System.currentTimeMillis()+fs.getOriginalFilename();
                ls.add(newFileName);
                System.out.println(request.getServletContext().getRealPath("images"));
                File newFile = new File(request.getServletContext().getRealPath("admin\\images\\raise"),newFileName);
                FileUtils.copyInputStreamToFile(fs.getInputStream(),newFile);
            }

            String str = StringUtils.join(ls.toArray(),";");
            raise.setRaiseImg(str);
        }
        //model处理
        String str = raiseService.raiseAdd(raise);
        return  str;
    }

//    后台农资查看
    @RequestMapping(value = "/raise/scan/{pageNow}",method = RequestMethod.GET,produces = "application/json;" +
            "charset=utf-8")
    @ResponseBody
        public String raiseScan(@PathVariable int pageNow) throws JsonProcessingException {
           String str  = raiseService.raiseSelectAll(pageNow);
           return  str;
    }

//    后台农资删除
    @RequestMapping(value = "raise/delete/{raiseId}",method = RequestMethod.GET)
    public void raiseDelete(@PathVariable int raiseId,HttpServletResponse response) throws IOException {
        raiseService.raiseDelete(raiseId);
        //设置响应头
        response.setHeader("content-type","text/html;charset=utf-8");
        //获取PrintWrite输出流
        PrintWriter out = response.getWriter();
        out.write("success");
    }


//    农资信息修改
    @RequestMapping(value = "raise/modify",method = RequestMethod.POST)
    public void raiseModify(HttpServletResponse response,@ModelAttribute Raise raise) throws IOException {
        raiseService.raiseModify(raise);
        response.setContentType("text/html;charset=utf=8");
        response.getWriter().write("success");

    }

}
