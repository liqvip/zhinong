package cn.blogss.controller;/*
 *Created by liqiang on 2018/6/15
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DefaultController {
    @Autowired
    HttpServletRequest request;

    @RequestMapping("/")
    public String mainPage(){
        return "home/index";
    }

    @RequestMapping("/home/raise")
    public String raisePage(){
        return "home/raise/raise";
    }

    @RequestMapping("/home/login")
    public String loginPage(){
        return "home/login/login";
    }

    @RequestMapping("/home/reg")
    public String regPage(){
        return "home/reg/register";
    }

    //    用户退出登录
    @RequestMapping("/home/signout")
    public String signOut(){
        request.getSession().invalidate();
        return "home/signout_success";
    }
}
