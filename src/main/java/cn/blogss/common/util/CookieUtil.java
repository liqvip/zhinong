package cn.blogss.common.util;/*
 *Created by liqiang on 2019/2/23
 */

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
    public static void addCookie(String userName, String password, int age, String cookieName,
                                 HttpServletRequest request, HttpServletResponse response){
        StringBuffer sb = new StringBuffer();
        sb.append(userName);
        sb.append("#");
        sb.append(password);

        Cookie cookie = getCookie(request);
        if(cookie != null)
            cookie.setValue(sb.toString());
        else
            cookie = new Cookie(cookieName,sb.toString());

        /*设置cookie的有效时间*/
        cookie.setMaxAge(age);
        /*cookie的作用域*/
        cookie.setPath(request.getContextPath());
        System.out.println("request.getContextPath:"+request.getContextPath());
        response.addCookie(cookie);
    }

    private static Cookie getCookie(HttpServletRequest request) {
        /*从request中获取所有cookie信息*/
        Cookie[] cookies = request.getCookies();
        if(cookies != null && cookies.length > 0){
            for (Cookie cookie:cookies){
                if(cookie.getName().equals(ConstantUtil.COOKIE_NAME));
                return cookie;
            }
        }
        return null;
    }

    //移除cookie
    public static void removeCookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie  cookie = getCookie(request);

        if(cookie != null) {
            //设置cookie的生命周期
            cookie.setMaxAge(0);
            //设置cookie的作用域
            cookie.setPath(request.getContextPath());
            //将cookie响应出去
            response.addCookie(cookie);
        }
    }
}
