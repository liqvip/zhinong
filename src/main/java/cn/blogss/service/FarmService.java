package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Farm;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.util.List;

public interface FarmService {

    //农场添加
    public abstract String farmAdd(Farm farm);

    //农场查看
    public abstract String farmSelectAll(int pagenow) throws JsonProcessingException;

    //农场删除
    public abstract void farmDelete(int farmId);

//    农场修改
    public abstract void farmModify(Farm farm);

    //农场查看全部
    public abstract String farmSelectAll2();
}
