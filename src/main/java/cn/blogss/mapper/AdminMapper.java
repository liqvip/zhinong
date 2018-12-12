package cn.blogss.mapper;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Admin;
import cn.blogss.pojo.Menu;

import java.util.List;

public interface AdminMapper {
    //管理员登录验证
    public abstract int adminLogin(Admin admin);
}
