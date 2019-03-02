package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/
import cn.blogss.common.util.enums.users.*;
import cn.blogss.dto.users.*;
import cn.blogss.exception.users.*;
import cn.blogss.pojo.Users;
import cn.blogss.service.UsersService;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/home/")
public class UsersControllerHome {
    @Autowired
    private UsersService usersService;

    @RequestMapping(value = "user/logout",method = {RequestMethod.POST,RequestMethod.GET})
    public String logout(){
        Subject subject = SecurityUtils.getSubject();
        if(subject.isAuthenticated())
            subject.logout();
        return "redirect:/home/signin";
    }

    @RequestMapping(value = "user",method = {RequestMethod.POST,RequestMethod.GET})
    public String person(){
        /*个人中心*/
        return "home/user/user_binding";
    }

    @RequestMapping(value = "user/binding",method = {RequestMethod.POST,RequestMethod.GET})
    public String binding(){
        /*账号绑定*/
        return "home/user/user_binding";
    }

    @RequestMapping(value = "user/signin",method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public SignInResult<SignInExecution> signIn(@Param("username")String username,
                                                @Param("password")String password,
                                                @Param("rememberMe")Boolean rememberMe){
        SignInResult<SignInExecution> result;
        SignInExecution signInExecution;
        try {
            /*登录成功*/
            signInExecution = usersService.signIn(username,password,rememberMe);
            result = new SignInResult<>(true,signInExecution);
        }catch (RepeatSignInException e1){
            signInExecution = new SignInExecution(SignInEnum.REPEAT_SIGNIN);
            result = new SignInResult<>(false,signInExecution);
        } catch (AuthenticationException e2) {
            signInExecution = new SignInExecution(SignInEnum.ACCOUNT_ERROR);
            result = new SignInResult<>(false,signInExecution);
        } catch (Exception e3) {
            signInExecution = new SignInExecution(SignInEnum.INNER_ERROR);
            result = new SignInResult<>(false,signInExecution);
        }
        return result;
    }

    @RequestMapping(value = "user/signup",method = {RequestMethod.POST})
    @ResponseBody
    public SignUpResult<SignUpExecution> signIn(@ModelAttribute Users users){
        SignUpResult<SignUpExecution> result;
        SignUpExecution signUpExecution;
        try {
            signUpExecution = usersService.signUp(users);
            result = new SignUpResult<>(true,signUpExecution);
        }catch (RepeatUserNameException e1){
            signUpExecution = new SignUpExecution(SignUpEnum.REPEAT_USERNAME);
            result = new SignUpResult<>(false,signUpExecution);
        }catch (Exception e2){
            signUpExecution = new SignUpExecution(SignUpEnum.INNER_ERROR);
            result = new SignUpResult<>(false,signUpExecution);
        }
        return result;
    }


    @RequestMapping(value = "user/verifycheck",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public VerifyResult<VerifyExecution> verifycheck(@Param("password")String password){
        VerifyResult<VerifyExecution> result;
        VerifyExecution verifyExecution;
        try {
            verifyExecution = usersService.verifyCheck(password);
            result = new VerifyResult<>(true,verifyExecution);
        }catch (TimeOutException e1){
            verifyExecution = new VerifyExecution(VerifyEnum.TIMEOUT);
            result = new VerifyResult<>(false,verifyExecution);
        }catch (NullPwdException e2){
            verifyExecution = new VerifyExecution(VerifyEnum.NULL_PASSWORD);
            result = new VerifyResult<>(false,verifyExecution);
        }catch (ErrorPwdException e3){
            verifyExecution = new VerifyExecution(VerifyEnum.ERROR_PASSWORD);
            result = new VerifyResult<>(false,verifyExecution);
        }catch (Exception e){
            verifyExecution = new VerifyExecution(VerifyEnum.INNER_ERROR);
            result = new VerifyResult<>(false,verifyExecution);
        }
        return result;
    }

    @RequestMapping(value = "user/bindemail",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public BindResult<BindExecution> bindEmail(@Param("email")String email){
        BindResult<BindExecution> result;
        BindExecution bindExecution;
        try {
            bindExecution = usersService.bindEmail(email);
            result = new BindResult<>(true,bindExecution);
        }catch (TimeOutException e1){
            bindExecution = new BindExecution(BindEnum.TIMEOUT);
            result = new BindResult<>(false,bindExecution);
        }catch (EmailBindException e2){
            bindExecution = new BindExecution(BindEnum.EMAIL_BIND);
            result = new BindResult<>(false,bindExecution);
        }catch (Exception e){
            bindExecution = new BindExecution(BindEnum.INNER_ERROR);
            result = new BindResult<>(false,bindExecution);
        }
        return result;
    }

    @RequestMapping(value = "user/bindphone",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public BindResult<BindExecution> bindphone(@Param("phone")String phone){
        BindResult<BindExecution> result;
        BindExecution bindExecution;
        try {
            bindExecution = usersService.bindPhone(phone);
            result = new BindResult<>(true,bindExecution);
        }catch (TimeOutException e1){
            bindExecution = new BindExecution(BindEnum.TIMEOUT);
            result = new BindResult<>(false,bindExecution);
        }catch (PhoneBindException e2){
            bindExecution = new BindExecution(BindEnum.PHONE_BIND);
            result = new BindResult<>(false,bindExecution);
        }catch (Exception e){
            bindExecution = new BindExecution(BindEnum.INNER_ERROR);
            result = new BindResult<>(false,bindExecution);
        }
        return result;
    }

    @RequestMapping(value = "user/setpwd",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public SetPwdResult<SetPwdExecution> setpwd(@Param("oldPwd")String oldPwd,
                                                @Param("newPwd")String newPwd,
                                                @Param("secNewPwd")String secNewPwd){
        SetPwdResult<SetPwdExecution> result;
        SetPwdExecution setPwdExecution;
        try {
            setPwdExecution = usersService.setPwd(oldPwd,newPwd,secNewPwd);
            result = new SetPwdResult<>(true,setPwdExecution);
        }catch (TimeOutException e1){
            setPwdExecution = new SetPwdExecution(SetPwdEnum.TIMEOUT);
            result = new SetPwdResult<>(false,setPwdExecution);
        }catch (NullPwdException e2){
            setPwdExecution = new SetPwdExecution(SetPwdEnum.NULL_PASSWORD);
            result = new SetPwdResult<>(false,setPwdExecution);
        }catch (ErrorPwdException e2){
            setPwdExecution = new SetPwdExecution(SetPwdEnum.PRE_PASSWORD_ERROR);
            result = new SetPwdResult<>(false,setPwdExecution);
        }catch (DiffPwdException e3){
            setPwdExecution = new SetPwdExecution(SetPwdEnum.PWD_INCONSISTENT);
            result = new SetPwdResult<>(false,setPwdExecution);
        }catch (Exception e){
            setPwdExecution = new SetPwdExecution(SetPwdEnum.INNER_ERROR);
            result = new SetPwdResult<>(false,setPwdExecution);
        }
        return result;
    }

}
