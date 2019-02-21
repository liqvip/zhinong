package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.common.util.enums.users.SignInEnum;
import cn.blogss.common.util.enums.users.SignUpEnum;
import cn.blogss.dto.users.SignInExecution;
import cn.blogss.dto.users.SignUpExecution;
import cn.blogss.exception.users.*;
import cn.blogss.mapper.UsersMapper;
import cn.blogss.pojo.Users;
import cn.blogss.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public SignInExecution signIn(String userName, String passsword)
            throws SignInException, UserNameErrorException,PasswordErrorException {
        SignInExecution signInExecution;
        try {
            Users users = usersMapper.getUsersByUsersName(userName);
            if(users == null)
                /*用户名错误*/
                throw new UserNameErrorException("userName is error");
            if(!users.getPassword().equals(passsword))
                /*密码错误*/
                throw new PasswordErrorException("password is error");
                /*登录成功*/
             return new SignInExecution(SignInEnum.SUCCESS);
        }catch (UserNameErrorException e1){
            throw  e1;
        }catch (PasswordErrorException e2){
            throw e2;
        }catch (Exception e){
            throw new SignInException("sign inner error:"+e.getMessage());
        }
    }

    /*
    * 用户注册
    * */
    @Override
    public SignUpExecution signUp(Users users)
            throws SignUpException, RepeatUserNameException {
        SignUpExecution signUpExecution;
        try {
            int count = usersMapper.insertSelective(users);
            if(count <=0 )
                /*用户名已被注册*/
                throw new RepeatUserNameException("userName is already been registered");
            /*注册成功*/
            return new SignUpExecution(SignUpEnum.SUCCESS);
        }catch (RepeatUserNameException e1){
            throw e1;
        }catch (Exception e){
            throw  new SignUpException("signUp inner error:"+e.getMessage());
        }
    }
}
