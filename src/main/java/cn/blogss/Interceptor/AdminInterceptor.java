package cn.blogss.Interceptor;/*
    create by LiQiang at 2018/5/22   
*/

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

public class AdminInterceptor extends HandlerInterceptorAdapter{

    public static final String SESSION_MEMBER = "session_member";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //获得请求的路径
        String contextPath = request.getContextPath();
        System.out.println("contextPath:"+contextPath);
        String url = request.getServletPath().toString();
        System.out.println("servletPath:"+url);
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute(SESSION_MEMBER);
        //这里可以根据session的用户来判断角色的权限，根据权限来重定向不同的页面，简单起见，这里只是做了一个重定向
        if (StringUtils.isEmpty(user)) {
            //被拦截，转发到login界面
            System.out.println("servletPath:"+url);
            request.getRequestDispatcher(contextPath+"/WEB-INF/admin/login.html").forward(request,response);
            return false;
        }
        return true;

    }
}
