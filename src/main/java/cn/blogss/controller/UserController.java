package cn.blogss.controller;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.User;
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
public class UserController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private UserService userService;

    public UserController(){
        System.out.println("UserController:我被注入啦");
    }


//    后台用户添加
    @RequestMapping(value = "/user/add",method = RequestMethod.POST)
    public String userAdd(@ModelAttribute User user , @RequestAttribute("file")MultipartFile file) throws IOException {
        //用户头像处理
        if(!file.isEmpty()){
            String newFileName = System.currentTimeMillis()+file.getOriginalFilename();
            user.setUserPhoto(newFileName);
            System.out.println(request.getServletContext().getRealPath("images"));
            File newFile = new File(request.getServletContext().getRealPath("admin\\images\\user"),newFileName);
            FileUtils.copyInputStreamToFile(file.getInputStream(),newFile);
        }
        //model处理
        String nowTime = TimeUtil.getCurTime();
        user.setCreateTime(nowTime);

        userService.userAdd(user);
        return "admin/user/addsucc";
    }

//    后台用户查看
    @RequestMapping(value = "/user/scan/{pageNow}",method = RequestMethod.GET)
    @ResponseBody
        public String userScan(@PathVariable int pageNow) throws JsonProcessingException {
           String str  = userService.userSelectAll(pageNow);
           return  str;
    }

//    后台用户删除
    @RequestMapping(value = "user/delete/{userId}",method = RequestMethod.GET)
    public void userDelete(@PathVariable int userId,HttpServletResponse response) throws IOException {
        userService.userDelete(userId);
        //设置响应头
        response.setHeader("content-type","text/html;charset=utf-8");
        //获取PrintWrite输出流
        PrintWriter out = response.getWriter();
        out.write("success");
    }


//    用户信息修改
    @RequestMapping(value = "user/modify",method = RequestMethod.POST)
    public void userModify(HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");
        String loginName = request.getParameter("loginName");
        String loginPwd = request.getParameter("loginPwd");

        userService.userModify(userId,loginName,loginPwd);
        response.setContentType("text/html;charset=utf=8");
        response.getWriter().write("success");

    }

}
