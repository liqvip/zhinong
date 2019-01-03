package cn.blogss.service.impl;/*
 *Created by liqiang on 2018/12/6
 */

import cn.blogss.mapper.SlideMapper;
import cn.blogss.pojo.Slide;
import cn.blogss.service.SlideService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
class SlideServiceImpl implements SlideService {
    @Autowired
    private SlideMapper slideMapper;

    @Override
    public void add(Slide slide) {
        slideMapper.insertSelective(slide);
    }

    @Override
    public List<Slide> selectSlideByPage(String pageIndex, int pageSize) {
        return slideMapper.selectSlideByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize);
    }

    @Override
    public void delBatch(String[] ids) {
        slideMapper.delBatch(ids);
    }

    @Override
    public void edit(Slide slide) {
        slideMapper.updateByPrimaryKeySelective(slide);
    }


    @Override
    public void delOne(String id) {
        slideMapper.delOne(id);
    }

    @Override
    public Slide editShow(String id) {
        return slideMapper.editShow(id);
    }
}
