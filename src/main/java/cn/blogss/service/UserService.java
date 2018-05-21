package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.User;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.util.HashMap;
import java.util.List;

public interface UserService {

    //用户添加
    public abstract void userAdd(User user);

    //用户查看
    public abstract String userSelectAll(int pagenow) throws JsonProcessingException;

    //用户删除
    public abstract void userDelete(int userId);

//    用户修改
    public abstract void userModify(String userId,String loginName,String loginPwd);
}
