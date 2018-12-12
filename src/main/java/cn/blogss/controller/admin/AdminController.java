package cn.blogss.controller.admin;/*
    create by LiQiang at 2018/5/25   
*/

import cn.blogss.pojo.Admin;
import cn.blogss.pojo.Message;
import cn.blogss.service.AdminService;
import cn.blogss.service.MenuService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @Autowired
    private MenuService menuService;

    @Autowired
    HttpSession session;

    //登录成功，跳转到后台主页
    @RequestMapping(value = "/index",method = {RequestMethod.POST,RequestMethod.GET},
            produces = "application/json;charset=utf-8")
    public String loginSucc(){
        return "admin/index";
    }

    @RequestMapping(value = "menuClick",method = {RequestMethod.GET,RequestMethod.POST},produces ="application/json;charset=utf-8")
    @ResponseBody
    public String menuClick(@RequestParam(value = "id",required = false) String id){
        String menuJson = menuService.selectMenuList(id);

        return menuJson;
    }

//    后台管理员登录验证
    @RequestMapping(value = "/login",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    public String adminLogin(@ModelAttribute Admin admin,HttpServletResponse response) throws IOException {
        int code = adminService.adminLogin(admin);
        Message msg = new Message();
        ObjectMapper om = new ObjectMapper();
        om.configure(SerializationFeature.INDENT_OUTPUT,true);
        String str = "";

        //如果存在该用户
        System.err.println(code);
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
