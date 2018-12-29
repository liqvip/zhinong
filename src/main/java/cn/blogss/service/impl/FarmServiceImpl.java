package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.FarmMapper;
import cn.blogss.common.util.Message;
import cn.blogss.pojo.Farm;
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
    public List<Farm> farmSelectAll(String pageIndex,int pageSize,String farmName){


         return farmMapper.farmSelectAll((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,farmName);

    }

    //    农场删除
    @Override
    public void farmDelete(String[] ids) {
        farmMapper.farmDelete(ids);
    }

    @Override
    public void farmDelOne(String id) {
        farmMapper.farmDelOne(id);
    }

    //    农场修改
    @Override
    public void farmModify(Farm farm) {
        farmMapper.farmModify(farm);
    }


    @Override
    public int totRecord(String farmName) {
        return farmMapper.totRecord(farmName);
    }

}
