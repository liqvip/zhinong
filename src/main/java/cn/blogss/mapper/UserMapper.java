package cn.blogss.mapper;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.User;

import java.util.List;

public interface UserMapper {
    //用户添加
    public abstract void userAdd(User user);

    //总记录数
    public abstract int totRecord();

    //用户查看
    public abstract List<User> userSelectAll(int pageNow);

    //用户删除
    public abstract void userDelete(int userId);

//    用户修改
    public abstract void userModify(String userId,String loginName,String loginPwd);

}
