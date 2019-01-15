package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.VisitMapper;
import cn.blogss.pojo.Visit;
import cn.blogss.service.VisitService;
import cn.blogss.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VisitServiceImpl implements VisitService {
    @Autowired
    VisitMapper visitMapper;

    @Override
    public Long findVisitTimes(Visit visit) {
        return visitMapper.findVisitTimes(visit);
    }

    @Override
    public List<Visit> selectVisitByPage(String pageIndex, int pageSize, Visit visit) {
        return visitMapper.selectVisitByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,visit);
    }

    @Override
    public void add(Visit visit) {
        visitMapper.insertSelective(visit);
    }

    @Override
    public void delBatch(String[] ids) {
        visitMapper.delBatch(ids);
    }

    @Override
    public void delOne(String id) {
        visitMapper.deleteByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public void edit(Visit visit) {
        visitMapper.updateByPrimaryKeySelective(visit);
    }

    @Override
    public int totRecord(Visit visit) {
        return visitMapper.totRecord(visit);
    }


    @Override
    public Visit editShow(String id) {
        return visitMapper.selectByPrimaryKey(Integer.parseInt(id));
    }
}
