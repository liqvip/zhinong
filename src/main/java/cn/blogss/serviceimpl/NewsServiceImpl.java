package cn.blogss.serviceimpl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.NewsMapper;
import cn.blogss.pojo.Message;
import cn.blogss.pojo.News;
import cn.blogss.pojo.Pagination;
import cn.blogss.service.NewsService;
import cn.blogss.utils.TimeUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class NewsServiceImpl implements NewsService{
    @Autowired
    NewsMapper newsMapper;

//    新闻详情
    @Override
    public Map newsDetail(int newsId) {
        return newsMapper.newsDetail(newsId);
    }

    //    新闻添加
    @Override
    public String newsAdd(News news) {
        news.setNewsImg("");
        news.setCreateTime(TimeUtil.getCurTime());
        int code = newsMapper.newsAdd(news);
        System.out.println("code:"+code);
        Message msg = new Message();

        if(code!=0){
            msg.setSuccess(true);
            msg.setTime(System.currentTimeMillis());
            msg.setMsg("添加成功");
        }else {
            msg.setSuccess(false);
            msg.setTime(System.currentTimeMillis());
            msg.setMsg("添加失败");
        }

        ObjectMapper om = new ObjectMapper();
        om.configure(SerializationFeature.INDENT_OUTPUT,true);

        String str = "";
        try {
            str =  om.writeValueAsString(msg);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return  str;
    }

    //    新闻查看,分页
    @Override
    public String newsSelectAll(int pageNow) throws JsonProcessingException {
        Pagination<News> up = new Pagination<News>();
//        总页数
        int totPage = (newsMapper.totRecord()-1)/5+1;
        up.setTotPage(totPage);

        if(pageNow==1){
            up.setFirstPage(true);
            up.setLastPage(false);
        } else if(pageNow==totPage){
            up.setFirstPage(false);
            up.setLastPage(true);
        }else {
            up.setFirstPage(false);
            up.setLastPage(false);
        }

        List<News> list = newsMapper.newsSelectAll((pageNow-1)*5);
        up.setList(list);
        ObjectMapper om = new ObjectMapper();
        om.configure(SerializationFeature.INDENT_OUTPUT,true);
        //om.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);

        String str = "";
        try {
            str = om.writeValueAsString(up);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return  str;
    }

    //    新闻删除
    @Override
    public void newsDelete(int newsId) {
        newsMapper.newsDelete(newsId);
    }

    //    新闻修改
    @Override
    public void newsModify(News news) {
        newsMapper.newsModify(news);
    }

    @Override
    public String newsSelectAll2() {
        List<News> list = newsMapper.newsSelectAll2();
        ObjectMapper om = new ObjectMapper();
        om.configure(SerializationFeature.INDENT_OUTPUT,true);
        //om.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);

        String str = "";
        try {
            str = om.writeValueAsString(list);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return  str;
    }
}
