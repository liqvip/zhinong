package cn.blogss.controller;/*
    create by LiQiang at 2018/5/25   
*/

import cn.blogss.Interceptor.AdminInterceptor;
import cn.blogss.pojo.Admin;
import cn.blogss.pojo.Message;
import cn.blogss.service.AdminService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    HttpSession session;

//    后台管理员登录验证
    @RequestMapping(value = "/login",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    public String adminLogin(@ModelAttribute Admin admin,HttpServletResponse response) throws IOException {
        int code = adminService.adminLogin(admin);
        Message msg = new Message();
        ObjectMapper om = new ObjectMapper();
        om.configure(SerializationFeature.INDENT_OUTPUT,true);
        String str = "";

        //如果存在该用户
        if(code!=0){
            session.setAttribute("adminLoginName",admin.getLoginName());
//            转发到后台主页
//            后面不加.jsp后缀,return "forward:index";表示转发到某个Controller的方法上面,去掉forward则表示找到对应的view并渲染
//            根据情况返回view或json
            msg.setSuccess(true);
            msg.setMsg("");
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

        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type","application/json;charset=utf-8");
        response.getWriter().write(str);
        return  null;
    }
}
