package cn.blogss.controller.admin;/*
 *Created by liqiang on 2018/12/22
 */

import cn.blogss.common.util.Message;
import cn.blogss.service.MenuService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/")
public class SystemControl {
    @Autowired
    private MenuService menuService;

    /*后台用户登录*/
    @RequestMapping(value = "login",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public Message login(@RequestParam("username") String username,@RequestParam("password") String password){
        Message message = new Message();
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        Subject subject = SecurityUtils.getSubject();
        try {
            if(!subject.isAuthenticated()){
                subject.login(token);
            }
            message.setMsg("登录成功!");
        }catch (Exception e){
            message.setSuccess(false);
            message.setMsg("用户名或密码错误，请重新输入！");
        }

        return message;
    }

    //登录成功，跳转到后台主页
    @RequestMapping(value = "index",method = {RequestMethod.POST,RequestMethod.GET},
            produces = "application/json;charset=utf-8")
    public String loginSucc(){
        return "admin/index";
    }

    @RequestMapping(value = "menuClick",method = {RequestMethod.GET,RequestMethod.POST},
            produces ="application/json;charset=utf-8")
    @ResponseBody
    public String menuClick(@RequestParam(value = "id",required = false) String id){
        String menuJson = menuService.selectMenuList(id);

        return menuJson;
    }
}
