package cn.blogss.filter;/*
 *Created by liqiang on 2018/6/9
 */


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AdminLoginFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req  = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        String userName = (String)session.getAttribute("adminLoginName");

        String uri = req.getRequestURI();
        List<String> excludedPages = new ArrayList<>();
        excludedPages.add("/admin/login");
        excludedPages.add("/admin");

//        如果该请求需要被过滤
        if(!excludedPages.contains(uri)){
//            用户未登录
            System.out.println(uri);
            if(userName == null || "".equals(userName)){
                //重定向到登录页面
                resp.sendRedirect("/login.html");
            }else {
                chain.doFilter(request,response);
            }

        }else if(uri == "/admin" || uri == "/amdin/"){
            resp.sendRedirect("/login.html");
        }else{
            chain.doFilter(request,response);
        }

    }

    @Override
    public void destroy() {

    }
}
