package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Raise;
import com.fasterxml.jackson.core.JsonProcessingException;

public interface RaiseService {

    //农资添加
    public abstract String raiseAdd(Raise raise);

    //农资查看
    public abstract String raiseSelectAll(int pagenow) throws JsonProcessingException;

    //农资删除
    public abstract void raiseDelete(int raiseId);

//    农资修改
    public abstract void raiseModify(Raise raise);
}
