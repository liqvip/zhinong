package cn.blogss.service.impl;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.mapper.UserMapper;
import cn.blogss.pojo.Pagination;
import cn.blogss.pojo.User;
import cn.blogss.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl  implements UserService{
    public UserServiceImpl(){
        System.out.println("UsrServiceImpl:我被注入啦");
    }
    @Autowired
    UserMapper userMapper;

    //    用户添加
    @Override
    public void userAdd(User user) {
        userMapper.userAdd(user);
    }

    //   用户查看,分页
    @Override
    public String userSelectAll(int pageNow){
        Pagination<User> up = new Pagination<User>();
//        总页数
        int totPage = (userMapper.totRecord()-1)/5+1;
        up.setTotPage(totPage);

        if(pageNow==1){
            up.setFirstPage(true);
            up.setLastPage(false);
        } else if(pageNow==totPage){
            up.setFirstPage(false);
            up.setLastPage(true);
        }else {
            up.setFirstPage(false);
            up.setLastPage(false);
        }

        List<User> list = userMapper.userSelectAll((pageNow-1)*5);
        up.setList(list);
        ObjectMapper om = new ObjectMapper();
        om.configure(SerializationFeature.INDENT_OUTPUT,true);
        //om.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);

        String str = "";
        try {
            str = om.writeValueAsString(up);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return  str;
    }

    //    用户删除
    @Override
    public void userDelete(int userId) {
        userMapper.userDelete(userId);
    }

//    用户修改
    @Override
    public void userModify(String userId, String loginName, String loginPwd) {
        userMapper.userModify(userId,loginName,loginPwd);
    }
}
