package cn.blogss.filter;/*
 *Created by liqiang on 2019/2/26
 */

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

public class HomeFormAuthenticationFilter extends FormAuthenticationFilter{
    @Override
    protected void redirectToLogin(ServletRequest request, ServletResponse response)
            throws IOException {
       super.redirectToLogin(request,response);
    }
}
