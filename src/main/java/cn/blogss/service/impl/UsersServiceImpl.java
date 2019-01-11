package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

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
}
