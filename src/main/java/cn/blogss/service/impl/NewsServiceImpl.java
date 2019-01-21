package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.NewsCatMapper;
import cn.blogss.mapper.NewsMapper;
import cn.blogss.pojo.News;
import cn.blogss.pojo.NewsCat;
import cn.blogss.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Service
public class NewsServiceImpl implements NewsService{
    @Autowired
    NewsMapper newsMapper;
    @Autowired
    NewsCatMapper newsCatMapper;
    public static final AtomicInteger count = new AtomicInteger(0);

    @Override
    public List<News> selectNewsByPage(String pageIndex, int pageSize, News news) {
        return newsMapper.selectNewsByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,news);
    }

    @Override
    public void add(News news) {
        if(newsMapper.insertSelective(news) != 0){
            if(Integer.parseInt(news.getStatus()) == 1){
                newsCatMapper.increaseNumByCatId(news.getCatId());
            }
        }
    }

    @Override
    public void delBatch(String[] ids) {
        newsMapper.delBatch(ids);
    }

    @Override
    public void delOne(String id) {
        newsMapper.deleteByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public void edit(News news) {
        newsMapper.updateByPrimaryKeySelective(news);
    }

    @Override
    public int totRecord(News news) {
        return newsMapper.totRecord(news);
    }

    @Override
    public List<NewsCat> addShow() {
        return newsCatMapper.newsAddShow();
    }

    @Override
    public News editShow(String id) {
        return newsMapper.selectByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public News selectNewsById(String id) {
        News news = newsMapper.selectByPrimaryKey(Integer.parseInt(id));
        if(news != null){
            synchronized (news){
                count.getAndIncrement();
                news.setClicknum(news.getClicknum()+count.get());
                if(count.get() >= 5){
                    newsMapper.updateByPrimaryKeySelective(news);
                    count.set(0);
                }
            }
        }
        return news;
    }

    @Override
    public News selectNextNews(String id) {
        return newsMapper.selectNextNews(id);
    }

    @Override
    public News selectPrevNews(String id) {
        return newsMapper.selectPrevNews(id);
    }

    @Override
    public List<News> selectNewsByClick() {
        return newsMapper.selectNewsByClick();
    }
}
