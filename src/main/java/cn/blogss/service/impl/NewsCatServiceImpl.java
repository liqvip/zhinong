package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.NewsCatMapper;
import cn.blogss.pojo.NewsCat;
import cn.blogss.service.NewsCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsCatServiceImpl implements NewsCatService{
    @Autowired
    NewsCatMapper newsCatMapper;


    @Override
    public List<NewsCat> selectNewsCatByPage(String pageIndex, int pageSize, NewsCat newsCat) {
        return newsCatMapper.selectNewsCatByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,newsCat);
    }

    @Override
    public void add(NewsCat newsCat) {
        newsCatMapper.insertSelective(newsCat);
    }

    @Override
    public void delBatch(String[] ids) {
        newsCatMapper.delBatch(ids);
    }

    @Override
    public void delOne(String id) {
        newsCatMapper.deleteByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public void edit(NewsCat newsCat) {
        newsCatMapper.updateByPrimaryKeySelective(newsCat);
    }

    @Override
    public int totRecord(NewsCat newsCat) {
        return newsCatMapper.totRecord(newsCat);
    }
}
