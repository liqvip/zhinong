package cn.blogss.mapper;

import cn.blogss.pojo.Users;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/*
 *Created by liqiang on 2019/2/21
 */
public class UsersMapperTest extends BaseMapperTest{
    @Resource
    UsersMapper usersMapper;
    @Test
    public void insertSelective() {
        Users users = new Users();
        users.setUsername("admin");
        int count = usersMapper.insertSelective(users);
        System.out.println("影响的行数:"+count);
    }

    @Test
    public void getUsersByUsersName() {
        String userName = "admin";
        String password = "abc";
        Users users = usersMapper.getUsersByUsersName(userName);
        System.out.println(users.toString());
    }

    @Test
    public void queryUserByIDAndPwd() {
        int count = usersMapper.queryUserByIDAndPwd(20,"dsfdsfsd");
        System.out.println("count:"+count);
    }
}