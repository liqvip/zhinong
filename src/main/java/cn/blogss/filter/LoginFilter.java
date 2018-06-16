package cn.blogss.filter;/*
 *Created by liqiang on 2018/6/9
 */


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req  = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        String userName = (String)session.getAttribute("loginName");

        if(userName == null || "".equals(userName)){
            //页面重定向到登录页面
            resp.sendRedirect("/home/login");
        }else {
            chain.doFilter(request,response);
        }
    }

    @Override
    public void destroy() {

    }
}
