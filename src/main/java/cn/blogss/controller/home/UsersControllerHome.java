package cn.blogss.controller.home;/*
    create by LiQiang at 2018/4/22   
*/
import cn.blogss.common.util.enums.users.SignInEnum;
import cn.blogss.common.util.enums.users.SignUpEnum;
import cn.blogss.dto.users.SignInExecution;
import cn.blogss.dto.users.SignInResult;
import cn.blogss.dto.users.SignUpExecution;
import cn.blogss.dto.users.SignUpResult;
import cn.blogss.exception.users.RepeatUserNameException;
import cn.blogss.pojo.Users;
import cn.blogss.service.UsersService;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/home/")
public class UsersControllerHome {
    @Autowired
    private UsersService usersService;

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
        } catch (AuthenticationException e1) {
            signInExecution = new SignInExecution(SignInEnum.ACCOUNT_ERROR);
            result = new SignInResult<>(false,signInExecution);
        } catch (Exception e2) {
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

    @RequestMapping(value = "user/logout",method = {RequestMethod.POST,RequestMethod.GET})
    public String logout(){
        Subject subject = SecurityUtils.getSubject();
        if(subject.isAuthenticated())
            subject.logout();
        return "redirect:/home/signin";
    }
}
