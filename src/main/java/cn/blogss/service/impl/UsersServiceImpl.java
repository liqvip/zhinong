package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.common.util.ConstantUtil;
import cn.blogss.common.util.enums.users.SignInEnum;
import cn.blogss.common.util.enums.users.SignUpEnum;
import cn.blogss.dto.users.SignInExecution;
import cn.blogss.dto.users.SignUpExecution;
import cn.blogss.exception.users.*;
import cn.blogss.mapper.UsersMapper;
import cn.blogss.pojo.Users;
import cn.blogss.service.UsersService;
import cn.blogss.shiro.ShiroMd5Util;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;;
import java.util.List;

@Service
public class UsersServiceImpl implements UsersService{
    @Autowired
    UsersMapper usersMapper;

    @Override
    public List<Users> selectUsersByPage(String pageIndex, int pageSize, Users users) {
        return usersMapper.selectUsersByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,users);
    }

    @Override
    public void add(Users users) {
        usersMapper.insertSelective(users);
    }

    @Override
    public void delBatch(String[] ids) {
        usersMapper.delBatch(ids);
    }

    @Override
    public void delOne(String id) {
        usersMapper.deleteByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public void edit(Users users) {
        usersMapper.updateByPrimaryKeySelective(users);
    }

    @Override
    public int totRecord(Users users) {
        return usersMapper.totRecord(users);
    }


    @Override
    public Users editShow(String id) {
        return usersMapper.selectByPrimaryKey(Integer.parseInt(id));
    }

    /*
    * 用户登录
    * */
    @Override
    public SignInExecution signIn(String username, String passsword, Boolean rememberMe)
            throws AuthenticationException,SignInException{
        UsernamePasswordToken token = new UsernamePasswordToken(username,passsword);
        Subject subject = SecurityUtils.getSubject();
        rememberMe = rememberMe == null ? false : rememberMe;
        token.setRememberMe(rememberMe);

        try {
            if(!subject.isAuthenticated()){
                subject.login(token);
                /*登录成功*/
                subject.getSession().setAttribute(ConstantUtil.SESSION_NAME,usersMapper.getUsersByUsersName(username));
            }
            /*已经登录或登录成功的返回*/
            return new SignInExecution(SignInEnum.SUCCESS);
        }catch (AuthenticationException e1){
            throw  e1;
        }catch (Exception e){
            throw new SignInException("sign inner error:"+e.getMessage());
        }
    }

    /*
    * 用户注册
    * */
    @Override
    public SignUpExecution signUp(Users users) throws SignUpException, RepeatUserNameException {
        users.setPassword(ShiroMd5Util.getMd5Password(users));
        try {
            int count = usersMapper.insertSelective(users);
            if(count <=0 )
                /*用户名已被注册*/
                throw new RepeatUserNameException("username is already been registered");
            /*注册成功*/
            return new SignUpExecution(SignUpEnum.SUCCESS);
        }catch (RepeatUserNameException e1){
            throw e1;
        }catch (Exception e){
            throw  new SignUpException("signUp inner error:"+e.getMessage());
        }
    }
}
