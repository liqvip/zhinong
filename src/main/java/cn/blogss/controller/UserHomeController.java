package cn.blogss.controller;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Message;
import cn.blogss.pojo.User;
import cn.blogss.service.UserHomeService;
import cn.blogss.utils.TimeUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/home")
public class UserHomeController {
    @Autowired
    HttpServletRequest request;

    @Autowired
    private UserHomeService userService;


//    用户注册
    @RequestMapping(value = "/reg/register",method = RequestMethod.POST)
    public String userRegister(@ModelAttribute User user) throws IOException {
        //model处理
        String nowTime = TimeUtil.getCurTime();
        user.setCreateTime(nowTime);

        int code = userService.userRegister(user);

        if(code != 0){
            return "home/reg/reg_success";
        }

        return "";
    }

//    用户登录
    @RequestMapping(value = "/login/check",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    public String userLogin(@RequestParam("loginName")String loginName,@RequestParam("loginPwd")String loginPwd,HttpServletResponse resp) throws IOException {
        int code = userService.userLogin(loginName,loginPwd);
        Message msg = new Message();
        ObjectMapper om = new ObjectMapper();
        om.configure(SerializationFeature.INDENT_OUTPUT,true);
        String str = "";

        if(code != 0){
            request.getSession().setAttribute("loginName",loginName);
            msg.setSuccess(true);
            msg.setMsg("登录成功");
            msg.setTime(System.currentTimeMillis());
        }else {
            msg.setSuccess(false);
            msg.setMsg("用户名或密码错误!");
            msg.setTime(System.currentTimeMillis());
        }

        try {
            str = om.writeValueAsString(msg);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        resp.setCharacterEncoding("utf-8");
        resp.setHeader("content-type","application/json;charset=utf-8");
        resp.getWriter().write(str);
        return null;
    }

//    用户中心首页
    @RequestMapping("/user")
    public String userPage(){
        return "home/user/user";
    }

//    用户个人中心
    @RequestMapping("/user/personal")
    public String personalPage(){
        return "home/user/user_personal";
    }

    //    用户订单
    @RequestMapping("/user/order")
    public String orderPage(){
        return "home/user/user_order";
    }


}
