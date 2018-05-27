package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.NewsCat;
import com.fasterxml.jackson.core.JsonProcessingException;

public interface NewsCatService {

    //新闻分类添加
    public abstract String newsCatAdd(NewsCat newsCat);

    //新闻分类查看
    public abstract String newsCatSelectAll(int pagenow) throws JsonProcessingException;

    //新闻分类删除
    public abstract void newsCatDelete(int newsCatId);

//    新闻分类修改
    public abstract void newsCatModify(NewsCat newsCat);

//    查找所有的新闻分类
    public String newsCatSelectAll2();
}
