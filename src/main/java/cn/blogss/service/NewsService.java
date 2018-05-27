package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.News;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.util.Map;

public interface NewsService {
    //    新闻详情
    public abstract Map newsDetail(int newsId);

    //新闻添加
    public abstract String newsAdd(News news);

    //新闻查看
    public abstract String newsSelectAll(int pagenow) throws JsonProcessingException;

    //新闻删除
    public abstract void newsDelete(int newsId);

//    新闻修改
    public abstract void newsModify(News news);

//    查找所有的新闻
    public String newsSelectAll2();
}
