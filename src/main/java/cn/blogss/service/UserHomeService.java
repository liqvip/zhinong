package cn.blogss.service;/*
 *Created by liqiang on 2018/6/9
 */

import cn.blogss.pojo.RaiseOrders;
import cn.blogss.pojo.User;
import org.springframework.ui.Model;

import java.util.List;

public interface UserHomeService {
    //    用户注册
    public abstract int userRegister(User user);

    //    用户登录
    public abstract int userLogin(String loginName,String loginPwd);

    //    用户查询
    public abstract User getUserByName(String loginName);

    //    用户订单查询
    public abstract void userOrders(int userId,Model model);
}
