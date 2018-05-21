package cn.blogss.mapper;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Raise;

import java.util.List;

public interface RaiseMapper {
    //农资添加
    public abstract int raiseAdd(Raise raise);

    //总记录数
    public abstract int totRecord();

    //农资查看
    public abstract List<Raise> raiseSelectAll(int pageNow);

    //农资删除
    public abstract void raiseDelete(int raiseId);

//    农资修改
    public abstract void raiseModify(Raise raise);

}
