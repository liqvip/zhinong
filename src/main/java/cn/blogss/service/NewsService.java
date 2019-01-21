package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.News;
import cn.blogss.pojo.NewsCat;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.util.List;
import java.util.Map;

public interface NewsService {

    public abstract List<News> selectNewsByPage(String pageIndex, int pageSize, News news);

    //新闻添加
    public abstract void add(News news);

    //新闻批量删除
    public abstract void delBatch(String[] ids);

    //删除一条
    void delOne(String id);

    //    新闻修改
    public abstract void edit(News news);

    public int totRecord(News news);

    List<NewsCat> addShow();

    News editShow(String id);

    News selectNewsById(String id);

    News selectNextNews(String id);

    News selectPrevNews(String id);

    List<News> selectNewsByClick();
}
