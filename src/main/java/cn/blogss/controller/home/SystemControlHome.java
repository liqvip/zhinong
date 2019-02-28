package cn.blogss.controller.home;/*
 *Created by liqiang on 2018/12/22
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/home/")
public class SystemControlHome {

    @RequestMapping(value = "signin",method = {RequestMethod.GET,RequestMethod.POST})
    public String login(){
        return "home/signin";
    }

    @RequestMapping(value = "signup",method = {RequestMethod.GET,RequestMethod.POST})
    public String signup(){
        return "home/signup";
    }



}
