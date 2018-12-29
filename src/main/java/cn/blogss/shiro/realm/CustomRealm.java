package cn.blogss.shiro.realm;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import cn.blogss.mapper.UsersMapper;
import cn.blogss.pojo.Users;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * 功能描述：自定义Realm
 * @author:LiQiang
 */
public class CustomRealm extends AuthorizingRealm{
	
	@Resource
	private UsersMapper usersMapper;
	
	//shrio授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		System.out.println("从数据库中获取权限数据...");
		String userName = (String)principals.getPrimaryPrincipal();
		//从数据库或缓存中获取角色数据
		Set<String> roles = getRolesByUsersName(userName);

		//从数据库或缓存中获取角色权限数据
		Set<String> permissions = getPermissionsByUsersName(userName);
		SimpleAuthorizationInfo simpleAuthorizationInfo = 
				new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.setRoles(roles);
		simpleAuthorizationInfo.setStringPermissions(permissions);
		return simpleAuthorizationInfo;
	}

	private Set<String> getPermissionsByUsersName(String userName) {	
		// TODO Auto-generated method stub
		List<String> list = usersMapper.queryPermissionsByUsersName(userName);
		Set<String> sets = new HashSet<String>(list);
		return sets;
	}

	private Set<String> getRolesByUsersName(String userName) {
		// TODO Auto-generated method stub
		List<String> list = usersMapper.queryRolesByUsersName(userName);
		Set<String> sets = new HashSet<String>(list);
		return sets;
	}

	//shiro认证
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("用户认证...");
		//从主体传过来的认证信息中，获得用户名
		String userName = (String)token.getPrincipal();
		
		//通过用户名到数据库中获取凭证
		String password = getPasswordByUsersName(userName);
		if(password == null)
			return null;
		
		SimpleAuthenticationInfo authenticationInfo = 
				new SimpleAuthenticationInfo(userName,password,"customRealm");
		//加盐
		//authenticationInfo.setCredentialsSalt(ByteSource.Util.bytes("liqiang"));
		
		return authenticationInfo;
	}

	/*
	 * 模拟数据库查询凭证
	 */
	private String getPasswordByUsersName(String userName) {
		// TODO Auto-generated method stub
		Users user = usersMapper.getUsersByUsersName(userName);
		if(user != null)
			return user.getPassword();
					
		return null;
	}
	
	public static void main(String[] args) {
		Md5Hash md5Hash = new Md5Hash("123");
		//加盐
		//Md5Hash md5Hash = new Md5Hash("123","liqiang");
		System.out.println(md5Hash.toString());
	}

}
