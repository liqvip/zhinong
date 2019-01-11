package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Users;

import java.util.List;

public interface UsersService {

    public abstract List<Users> selectUsersByPage(String pageIndex, int pageSize, Users users);

    //用户添加
    public abstract void add(Users users);

    //用户批量删除
    public abstract void delBatch(String[] ids);

    //删除一条
    void delOne(String id);

    //    用户修改
    public abstract void edit(Users users);

    public int totRecord(Users users);

    Users editShow(String id);
}
