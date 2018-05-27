package cn.blogss.mapper;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.News;

import java.util.List;
import java.util.Map;

public interface NewsMapper {
    //    新闻详情
    public abstract Map newsDetail(int newsId);
    //新闻添加
    public abstract int newsAdd(News news);

    //总记录数
    public abstract int totRecord();

    //新闻查看
    public abstract List<News> newsSelectAll(int pageNow);

    //新闻删除
    public abstract int newsDelete(int newsId);

//    新闻修改
    public abstract int newsModify(News news);

    //    查找所有的新闻

    public abstract List<News> newsSelectAll2();

}
