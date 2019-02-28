package cn.blogss.mapper;

import cn.blogss.pojo.Raise;
import org.junit.Test;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/*
 *Created by liqiang on 2019/2/16
 */public class RaiseMapperTest extends BaseMapperTest{
     @Resource
     RaiseMapper raiseMapper;

    @Test
    public void insertSelective() {
    }

    @Test
    public void selectByPrimaryKey() {
    }

    @Test
    public void reduceAmount() {
    }

    @Test
    public void initRecommended() {
        List<Raise> raises = raiseMapper.initRecommended();
        System.out.println("raises:"+raises.toString());
    }
}