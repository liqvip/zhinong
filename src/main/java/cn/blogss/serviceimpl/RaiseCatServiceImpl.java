package cn.blogss.serviceimpl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.RaiseCatMapper;
import cn.blogss.pojo.Message;
import cn.blogss.pojo.Pagination;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.service.RaiseCatService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RaiseCatServiceImpl implements RaiseCatService{
    @Autowired
    RaiseCatMapper raiseCatMapper;

//    农资分类添加
    @Override
    public String raiseCatAdd(RaiseCat raiseCat) {
        int code = raiseCatMapper.raiseCatAdd(raiseCat);
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

    //    农资分类查看,分页
    @Override
    public String raiseCatSelectAll(int pageNow) throws JsonProcessingException {
        Pagination<RaiseCat> up = new Pagination<RaiseCat>();
//        总页数
        int totPage = (raiseCatMapper.totRecord()-1)/5+1;
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

        List<RaiseCat> list = raiseCatMapper.raiseCatSelectAll((pageNow-1)*5);
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

    //    农资分类删除
    @Override
    public void raiseCatDelete(int raiseCatId) {
        raiseCatMapper.raiseCatDelete(raiseCatId);
    }

    //    农资分类修改
    @Override
    public void raiseCatModify(RaiseCat raiseCat) {
        raiseCatMapper.raiseCatModify(raiseCat);
    }

    @Override
    public String raiseCatSelectAll2() {
        List<RaiseCat> list = raiseCatMapper.raiseCatSelectAll2();
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
