package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.dto.users.*;
import cn.blogss.exception.users.*;
import cn.blogss.pojo.Users;
import org.apache.shiro.authc.AuthenticationException;

import java.util.List;

public interface UsersService {

    public abstract List<Users> selectUsersByPage(String pageIndex, int pageSize, Users users);

    //用户添加
    public abstract void add(Users users);

    //用户批量删除
    public abstract void delBatch(String[] ids);

    //删除一条
    void delOne(String id);

    //    用户修改
    public abstract void edit(Users users);

    public int totRecord(Users users);

    Users editShow(String id);

    /*用户登录*/
    public SignInExecution signIn(String userName, String passsword, Boolean rememBerMe) throws AuthenticationException;

    /*新用户注册*/
    public SignUpExecution signUp(Users users) throws
            SignUpException,RepeatUserNameException;

    /*验证身份*/
    public VerifyExecution verifyCheck(String password) throws
            PwdException,ErrorPwdException,TimeOutException;

    /*邮箱绑定*/
    public BindExecution bindEmail(String email) throws
            BindException,EmailBindException,TimeOutException;

    /*手机绑定*/
    public BindExecution bindPhone(String phone) throws
            BindException,PhoneBindException,TimeOutException;

    /*修改密码*/
    public SetPwdExecution setPwd(String oldPwd,String newPwd,String secNewPwd) throws
            PwdException,ErrorPwdException,DiffPwdException,TimeOutException;
}
