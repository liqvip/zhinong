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

@Service
public class NewsServiceImpl implements NewsService{
    @Autowired
    NewsMapper newsMapper;
    @Autowired
    NewsCatMapper newsCatMapper;

    @Override
    public List<News> selectNewsByPage(String pageIndex, int pageSize, News news) {
        return newsMapper.selectNewsByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,news);
    }

    @Override
    public void add(News news) {
        newsMapper.insertSelective(news);
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
}
