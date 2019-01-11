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
    private FarmMapper farmMapper;

    @Override
    public void add(Farm farm) {
        farmMapper.insertSelective(farm);
    }

    @Override
    public List<Farm> selectFarmByPage(String pageIndex, int pageSize, Farm farm) {
        return farmMapper.selectFarmByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,farm);
    }

    @Override
    public void delBatch(String[] ids) {
        farmMapper.delBatch(ids);
    }

    @Override
    public void edit(Farm farm) {
        farmMapper.updateByPrimaryKeySelective(farm);
    }


    @Override
    public void delOne(String id) {
        farmMapper.delOne(id);
    }

    @Override
    public Farm editShow(String id) {
        return farmMapper.editShow(id);
    }

    @Override
    public int totRecord(Farm farm) {
        return farmMapper.totRecord(farm);
    }

}
