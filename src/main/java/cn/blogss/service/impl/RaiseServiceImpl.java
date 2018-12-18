package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.RaiseMapper;
import cn.blogss.pojo.Raise;
import cn.blogss.pojo.Message;
import cn.blogss.pojo.Pagination;
import cn.blogss.service.RaiseService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RaiseServiceImpl implements RaiseService{
    @Autowired
    RaiseMapper raiseMapper;

//    农资添加
    @Override
    public String raiseAdd(Raise raise) {
        int code = raiseMapper.raiseAdd(raise);
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

    //    农资查看,分页
    @Override
    public String raiseSelectAll(int pageNow) throws JsonProcessingException {
        Pagination<Raise> up = new Pagination<Raise>();
//        总页数
        int totPage = (raiseMapper.totRecord()-1)/5+1;
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

        List<Raise> list = raiseMapper.raiseSelectAll((pageNow-1)*5);
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

    //    农资删除
    @Override
    public void raiseDelete(int raiseId) {
        raiseMapper.raiseDelete(raiseId);
    }

    //    农资修改
    @Override
    public void raiseModify(Raise raise) {
        raiseMapper.raiseModify(raise);
    }
}
