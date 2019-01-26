package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.LinkMapper;
import cn.blogss.pojo.Link;
import cn.blogss.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LinkServiceImpl implements LinkService{
    @Autowired
    LinkMapper linkMapper;

    @Override
    public List<Link> selectLinkByPage(String pageIndex, int pageSize, Link link) {
        return linkMapper.selectLinkByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,link);
    }

    @Override
    public void add(Link link) {
        linkMapper.insertSelective(link);
    }

    @Override
    public void delBatch(String[] ids) {
        linkMapper.delBatch(ids);
    }

    @Override
    public void delOne(String id) {
        linkMapper.deleteByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public void edit(Link link) {
        linkMapper.updateByPrimaryKeySelective(link);
    }

    @Override
    public int totRecord(Link link) {
        return linkMapper.totRecord(link);
    }


    @Override
    public Link editShow(String id) {
        return linkMapper.selectByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public List<Link> selectLink() {
        return linkMapper.selectLink();
    }
}
