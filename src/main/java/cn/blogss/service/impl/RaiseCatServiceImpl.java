package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.RaiseCatMapper;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.service.RaiseCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RaiseCatServiceImpl implements RaiseCatService{
    @Autowired
    RaiseCatMapper raiseCatMapper;


    @Override
    public List<RaiseCat> selectRaiseCatByPage(String pageIndex, int pageSize, RaiseCat raiseCat) {
        return raiseCatMapper.selectRaiseCatByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,raiseCat);
    }

    @Override
    public void add(RaiseCat raiseCat) {
        raiseCatMapper.insertSelective(raiseCat);
    }

    @Override
    public void delBatch(String[] ids) {
        raiseCatMapper.delBatch(ids);
    }

    @Override
    public void delOne(String id) {
        raiseCatMapper.deleteByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public void edit(RaiseCat raiseCat) {
        raiseCatMapper.updateByPrimaryKeySelective(raiseCat);
    }

    @Override
    public int totRecord(RaiseCat raiseCat) {
        return raiseCatMapper.totRecord(raiseCat);
    }

    @Override
    public List<RaiseCat> selectRaiseType() {
        return raiseCatMapper.selectRaiseCat();
    }
}
