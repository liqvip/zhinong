package cn.blogss.mapper;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.NewsCat;

import java.util.List;

public interface NewsCatMapper {
    //新闻分类添加
    public abstract int newsCatAdd(NewsCat newsCat);

    //总记录数
    public abstract int totRecord();

    //新闻分类查看
    public abstract List<NewsCat> newsCatSelectAll(int pageNow);

    //新闻分类删除
    public abstract int newsCatDelete(int newsCatId);

//    新闻分类修改
    public abstract int newsCatModify(NewsCat newsCat);

    //    查找所有的新闻分类

    public abstract List<NewsCat> newsCatSelectAll2();

}
