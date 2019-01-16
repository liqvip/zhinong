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
    public int totRecord(Visit visit) {
        return visitMapper.totRecord(visit);
    }

}
