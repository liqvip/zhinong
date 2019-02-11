package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.RaiseCat;

import java.util.List;

public interface RaiseCatService {

    public abstract List<RaiseCat> selectRaiseCatByPage(String pageIndex, int pageSize, RaiseCat raiseCat);

    //农资分类添加
    public abstract void add(RaiseCat raiseCat);

    //农资分类批量删除
    public abstract void delBatch(String[] ids);

    //删除一条
    void delOne(String id);

    //    农资分类修改
    public abstract void edit(RaiseCat raiseCat);

    public int totRecord(RaiseCat raiseCat);

    List<RaiseCat> selectRaiseType();
}
