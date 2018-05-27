package cn.blogss.Interceptor;/*
    create by LiQiang at 2018/5/22   
*/

import cn.blogss.annotation.Auth;
import org.springframework.http.HttpStatus;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Set;

public class AuthInterceptor extends HandlerInterceptorAdapter{

    public static final String SESSION_USERID = "KUSERID";
    public static final String SESSION_AUTHS = "KAUTHS";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean flag = true;

        //判断处理器的类型,是不是一个处理器方法的实例
        if(handler instanceof HandlerMethod){
            //获得对应处理器方法的注解实例
            Auth auth = ((HandlerMethod) handler).getMethod().getAnnotation(Auth.class);

            //有权限控制的就要检查
            if(auth != null){
                //没登录的就要求登录
               if(request.getSession().getAttribute(SESSION_USERID)==null){
                   //设置返回的响应码
                   response.setStatus(HttpStatus.FORBIDDEN.value());
                   /*设置返回的内容类型,同时设置了response容器的编码，浏览器读取这个文件的编码
                   相当于
                   response.setCharacterEncoding("utf-8");
                   response.setHeader("content-type","text/html;charset=utf-8");*/
                   response.setContentType("text/html;charset=utf-8");
                   //字符输出流
                   PrintWriter out = response.getWriter();
                   out.write("{\"type\":\"nosignin\",\"msg\":\"请您先登录!\"}");
                   out.flush();
                   out.close();
                   flag = false;
               }else{//已经登录,表示只要求登录就能通过
                   //进一步的权限控制，用户必须拥有某种权限，才能访问对应的功能模块
                    if(!"".equals(auth.value())){
                        Set<String> auths = (Set<String>)request.getSession().getAttribute(SESSION_AUTHS);
                        if(!auths.contains(auth.value())){
                            //提示用户没有权限
                            response.setStatus(HttpStatus.FORBIDDEN.value());
                            response.setContentType("text/html;charset=utf-8");
                            PrintWriter out = response.getWriter();
                            out.write("{\"type\":\"noauth\",\"msg\":\"您没有"+auth.name()+"权限!\"}");
                            out.flush();
                            out.close();
                            flag = false;
                        }
                    }
               }
            }
        }
        return flag;
    }
}
