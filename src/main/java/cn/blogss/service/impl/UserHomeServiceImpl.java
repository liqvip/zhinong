package cn.blogss.service.impl;/*
 *Created by liqiang on 2018/6/9
 */

import cn.blogss.mapper.UserHomeMapper;
import cn.blogss.pojo.RaiseOrders;
import cn.blogss.pojo.User;
import cn.blogss.service.UserHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class UserHomeServiceImpl implements UserHomeService{
    @Autowired
    UserHomeMapper userHomeMapper;

//    用户注册
    @Override
    public int userRegister(User user) {
        return userHomeMapper.userRegister(user);
    }

//    用户登录
    @Override
    public int userLogin(String loginName, String loginPwd) {

        if(loginName != null && !"".equals(loginName) && loginPwd!=null && !"".equals(loginPwd)){
            return userHomeMapper.userLogin(loginName,loginPwd);
        }
        return 0;
    }

    @Override
    public User getUserByName(String loginName) {
            return userHomeMapper.getUserByName(loginName);

    }

//    用户订单查询
    @Override
    public void userOrders(int userId,Model model) {
        List<RaiseOrders> raiseOrders = userHomeMapper.userOrders(userId);
        model.addAttribute("raiseOrders",raiseOrders);
    }
}
