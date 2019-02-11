package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.RaiseCatMapper;
import cn.blogss.mapper.RaiseMapper;
import cn.blogss.pojo.Raise;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.service.RaiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

@Service
public class RaiseServiceImpl implements RaiseService{
    @Autowired
    RaiseMapper raiseMapper;
    @Autowired
    RaiseCatMapper raiseCatMapper;

    @Override
    public List<Raise> selectRaiseByPage(String pageIndex, int pageSize, Raise raise) {
        return raiseMapper.selectRaiseByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,raise);
    }

    @Override
    public void add(Raise raise) {
        if(raiseMapper.insertSelective(raise) != 0){
            raiseCatMapper.increaseNumByCatId(raise.getCatId());
        }
    }

    @Override
    public void delBatch(String[] ids) {
        raiseMapper.delBatch(ids);
    }

    @Override
    public void delOne(String id) {
        raiseMapper.deleteByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public void edit(Raise raise) {
        raiseMapper.updateByPrimaryKeySelective(raise);
    }

    @Override
    public int totRecord(Raise raise) {
        return raiseMapper.totRecord(raise);
    }

    @Override
    public List<RaiseCat> addShow() {
        return raiseCatMapper.raiseAddShow();
    }

    @Override
    public Raise editShow(String id) {
        return raiseMapper.selectByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public Raise selectRaiseById(String id) {
        return raiseMapper.selectByPrimaryKey(Integer.parseInt(id));
    }
}
