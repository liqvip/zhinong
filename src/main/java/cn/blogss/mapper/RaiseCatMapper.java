package cn.blogss.mapper;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.RaiseCat;

import java.util.List;

public interface RaiseCatMapper {
    //农资分类添加
    public abstract int raiseCatAdd(RaiseCat raiseCat);

    //总记录数
    public abstract int totRecord();

    //农资分类查看
    public abstract List<RaiseCat> raiseCatSelectAll(int pageNow);

    //农资分类删除
    public abstract int raiseCatDelete(int raiseCatId);

//    农资分类修改
    public abstract int raiseCatModify(RaiseCat raiseCat);

    //    查找所有的农资分类
    public abstract List<RaiseCat> raiseCatSelectAll2();

}
