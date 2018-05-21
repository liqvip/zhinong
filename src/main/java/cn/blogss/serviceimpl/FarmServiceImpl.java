package cn.blogss.serviceimpl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.FarmMapper;
import cn.blogss.pojo.Message;
import cn.blogss.pojo.Pagination;
import cn.blogss.pojo.Farm;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.service.FarmService;
import cn.blogss.service.FarmService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FarmServiceImpl implements FarmService{
    @Autowired
    FarmMapper farmMapper;

//    农场添加
    @Override
    public String farmAdd(Farm farm) {
        int code = farmMapper.farmAdd(farm);
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

    //    农场查看,分页
    @Override
    public String farmSelectAll(int pageNow) throws JsonProcessingException {
        Pagination<Farm> up = new Pagination<Farm>();
//        总页数
        int totPage = (farmMapper.totRecord()-1)/5+1;
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

        List<Farm> list = farmMapper.farmSelectAll((pageNow-1)*5);
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

    //    农场删除
    @Override
    public void farmDelete(int farmId) {
        farmMapper.farmDelete(farmId);
    }

    //    农场修改
    @Override
    public void farmModify(Farm farm) {
        farmMapper.farmModify(farm);
    }

    @Override
    public String farmSelectAll2() {
        List<Farm> list = farmMapper.farmSelectAll2();
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
