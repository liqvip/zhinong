package cn.blogss.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

/**
 * 功能描述：自定义授权filter
 * @author:LiQiang
 * 2018年12月18日
 */
public class RolesOrFilter extends AuthorizationFilter{

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		Subject subject = getSubject(request, response);
		String[] roles = (String[]) mappedValue;
		
		if(roles == null || roles.length == 0)//没有角色限制，有权限访问
			return true;
		for(String role : roles) {//若当前用户是rolesArray中的任何一个，则有权限访问
			if(subject.hasRole(role))
				return true;
		}
		return false;
	}

}
