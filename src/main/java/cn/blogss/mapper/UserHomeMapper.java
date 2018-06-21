package cn.blogss.mapper;/*
 *Created by liqiang on 2018/6/9
 */

import cn.blogss.pojo.RaiseOrders;
import cn.blogss.pojo.User;

import java.util.List;

public interface UserHomeMapper {
//    用户注册
        public abstract int userRegister(User user);

//    用户登录
        public abstract int userLogin(String loginName,String loginPwd);

//    用户查询
        public abstract User getUserByName(String loginName);

//    用户首页

//    用户订单查询
        public abstract List<RaiseOrders> userOrders(int userId);

}
