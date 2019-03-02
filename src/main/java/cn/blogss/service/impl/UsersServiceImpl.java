package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.common.util.ConstantUtil;
import cn.blogss.common.util.enums.users.*;
import cn.blogss.dto.users.*;
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
            throws AuthenticationException,SignInException,RepeatSignInException{
        UsernamePasswordToken token = new UsernamePasswordToken(username,passsword);
        Subject subject = SecurityUtils.getSubject();
        rememberMe = rememberMe == null ? false : rememberMe;
        token.setRememberMe(rememberMe);

        try {
            if(!subject.isAuthenticated()){
                /*会话内未登录过*/
                subject.login(token);
                /*登录成功*/
                subject.getSession().setAttribute(ConstantUtil.SESSION_NAME,usersMapper.getUsersByUsersName(username));
                return new SignInExecution(SignInEnum.SUCCESS);
            }else{
                /*会话内重复登录*/
                throw new RepeatSignInException("repeat signin exception");
            }
        }catch (RepeatSignInException e1){
            throw  e1;
        }
        catch (AuthenticationException e2){
            throw  e2;
        }catch (Exception e){
            throw new SignInException("sign inner error:"+e.getMessage());
        }
    }

    /*
    * 用户注册
    * */
    @Override
    public SignUpExecution signUp(Users users) throws
            SignUpException, RepeatUserNameException {
        users.setPassword(ShiroMd5Util.getMd5Password(users.getPassword()));
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


    /*验证用户的密码是否正确*/
    @Override
    public VerifyExecution verifyCheck(String password) throws
            PwdException, NullPwdException,ErrorPwdException, TimeOutException {
        Users user = getUser();
        try {
            if(user == null ){
                /*登录超时*/
                throw new TimeOutException("login timeout");
            }
            int count = usersMapper.queryUserByIDAndPwd(user.getId(),ShiroMd5Util.getMd5Password(password));
            if(count <= 0){
                /*密码错误*/
                throw new ErrorPwdException("error password");
            }else{
                return new VerifyExecution(VerifyEnum.SUCCESS);
            }
        }catch (TimeOutException e1){
            throw e1;
        }catch (NullPwdException e2){
            throw e2;
        }catch (ErrorPwdException e3){
            throw e3;
        }catch (Exception e){
            throw new PwdException("verify inner error:"+e.getMessage());
        }
    }

    @Override
    public BindExecution bindEmail(String email) throws
            BindException, EmailBindException,TimeOutException {
        Users user = getUser();
        try {
            if(user == null ){
                /*登录超时*/
                throw new TimeOutException("login timeout");
            }
            int count = usersMapper.queryByEmail(email);
            if(count > 0){
                /**/
                throw new EmailBindException("email had been binding");
            }else{
                usersMapper.updateEmailById(user.getId(),email);
                /*刷新session*/
                user.setEmail(email);
                setUser(user);
                return new BindExecution(BindEnum.SUCCESS);
            }
        }catch (TimeOutException e1){
            throw e1;
        }catch (EmailBindException e2){
            throw e2;
        }catch (Exception e){
            throw new BindException("bind inner error:"+e.getMessage());
        }
    }

    @Override
    public BindExecution bindPhone(String phone) throws
            BindException, PhoneBindException, TimeOutException {
        Users user = getUser();
        try {
            if(user == null ){
                /*登录超时*/
                throw new TimeOutException("login timeout");
            }
            int count = usersMapper.queryByPhone(phone);
            if(count > 0){
                /**/
                throw new PhoneBindException("phone had been binding");
            }else{
                usersMapper.updatePhoneById(user.getId(),phone);
                /*刷新session*/
                user.setPhone(phone);
                setUser(user);
                return new BindExecution(BindEnum.SUCCESS);
            }
        }catch (TimeOutException e1){
            throw e1;
        }catch (PhoneBindException e2){
            throw e2;
        }catch (Exception e){
            throw new BindException("bind inner error:"+e.getMessage());
        }
    }

    @Override
    public SetPwdExecution setPwd(String oldPwd, String newPwd, String secNewPwd) throws
            PwdException, ErrorPwdException, NullPwdException,DiffPwdException, TimeOutException {
        Users user = getUser();
        try {
            if(user == null ){
                /*登录超时*/
                throw new TimeOutException("login timeout");
            }
            int count = usersMapper.queryUserByIDAndPwd(user.getId(),ShiroMd5Util.getMd5Password(oldPwd));
            if(count <= 0){
                /*密码错误*/
                throw new ErrorPwdException("error password");
            }else if(!newPwd.equals(secNewPwd)){
                /*两次密码不一致*/
                throw new DiffPwdException("The two password is inconsistent.");
            }else{
                /*修改密码*/
                usersMapper.updatePwdById(user.getId(),ShiroMd5Util.getMd5Password(newPwd));
                return new SetPwdExecution(SetPwdEnum.SUCCESS);
            }
        }catch (TimeOutException e1){
            throw e1;
        }catch (NullPwdException e2){
            throw e2;
        }catch (ErrorPwdException e3){
            throw e3;
        } catch (DiffPwdException e3){
            throw e3;
        }catch (Exception e){
            throw new PwdException("bind inner error:"+e.getMessage());
        }
    }


    private Users getUser() {
        return (Users) SecurityUtils.getSubject().getSession().getAttribute(ConstantUtil.SESSION_NAME);
    }

    private void setUser(Users user) {
        SecurityUtils.getSubject().getSession().setAttribute(ConstantUtil.SESSION_NAME,user);
    }
}
