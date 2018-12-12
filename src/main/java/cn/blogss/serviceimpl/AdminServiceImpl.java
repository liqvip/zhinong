package cn.blogss.serviceimpl;/*
    create by LiQiang at 2018/5/25   
*/

import cn.blogss.mapper.AdminMapper;
import cn.blogss.pojo.Admin;
import cn.blogss.pojo.Menu;
import cn.blogss.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    AdminMapper adminMapper;

    @Override
    public Integer adminLogin(Admin admin) {
        Integer code = adminMapper.adminLogin(admin);
        return code;
    }

}
