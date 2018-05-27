package cn.blogss.serviceimpl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.NewsCatMapper;
import cn.blogss.pojo.Message;
import cn.blogss.pojo.Pagination;
import cn.blogss.pojo.NewsCat;
import cn.blogss.service.NewsCatService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsCatServiceImpl implements NewsCatService{
    @Autowired
    NewsCatMapper newsCatMapper;

//    新闻分类添加
    @Override
    public String newsCatAdd(NewsCat newsCat) {
        int code = newsCatMapper.newsCatAdd(newsCat);
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

    //    新闻分类查看,分页
    @Override
    public String newsCatSelectAll(int pageNow) throws JsonProcessingException {
        Pagination<NewsCat> up = new Pagination<NewsCat>();
//        总页数
        int totPage = (newsCatMapper.totRecord()-1)/5+1;
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

        List<NewsCat> list = newsCatMapper.newsCatSelectAll((pageNow-1)*5);
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

    //    新闻分类删除
    @Override
    public void newsCatDelete(int newsCatId) {
        newsCatMapper.newsCatDelete(newsCatId);
    }

    //    新闻分类修改
    @Override
    public void newsCatModify(NewsCat newsCat) {
        newsCatMapper.newsCatModify(newsCat);
    }

    @Override
    public String newsCatSelectAll2() {
        List<NewsCat> list = newsCatMapper.newsCatSelectAll2();
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
