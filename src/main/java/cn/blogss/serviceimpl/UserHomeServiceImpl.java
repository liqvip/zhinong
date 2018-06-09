package cn.blogss.serviceimpl;/*
 *Created by liqiang on 2018/6/9
 */

import cn.blogss.mapper.UserHomeMapper;
import cn.blogss.pojo.User;
import cn.blogss.service.UserHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserHomeServiceImpl implements UserHomeService{
    @Autowired
    UserHomeMapper userHomeMapper;

    @Override
    public int userRegister(User user) {
        return userHomeMapper.userRegister(user);
    }

    @Override
    public int userLogin(String loginName, String loginPwd) {

        if(loginName != null && !"".equals(loginName) && loginPwd!=null && !"".equals(loginPwd)){
            return userHomeMapper.userLogin(loginName,loginPwd);
        }
        return 0;
    }
}
