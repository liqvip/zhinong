package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.NewsCat;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.util.List;

public interface NewsCatService {
    public abstract List<NewsCat> selectNewsCatByPage(String pageIndex, int pageSize, NewsCat newsCat);

    //新闻分类添加
    public abstract void add(NewsCat newsCat);

    //新闻分类批量删除
    public abstract void delBatch(String[] ids);

    //删除一条
    void delOne(String id);

    //    新闻分类修改
    public abstract void edit(NewsCat newsCat);

    public int totRecord(NewsCat newsCat);

}
