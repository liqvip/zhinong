package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.RaiseCat;
import com.fasterxml.jackson.core.JsonProcessingException;

public interface RaiseCatService {

    //农资分类添加
    public abstract String raiseCatAdd(RaiseCat raiseCat);

    //农资分类查看
    public abstract String raiseCatSelectAll(int pagenow) throws JsonProcessingException;

    //农资分类删除
    public abstract void raiseCatDelete(int raiseCatId);

//    农资分类修改
    public abstract void raiseCatModify(RaiseCat raiseCat);

//    查找所有的农资分类
    public String raiseCatSelectAll2();
}
