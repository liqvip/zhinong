package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.FarmMapper;
import cn.blogss.mapper.HomeMapper;
import cn.blogss.pojo.Farm;
import cn.blogss.service.FarmService;
import cn.blogss.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HomeServiceImpl implements HomeService {
    @Autowired
    HomeMapper homeMapper;

    @Override
    public List<?> selectNewsCountByStatus() {
        return homeMapper.selectNewsCountByStatus();
    }

    @Override
    public List<?> selectNewsCountByDate(Map<String, Object> map) {
        return homeMapper.selectNewsCountByDate(map);
    }
}
