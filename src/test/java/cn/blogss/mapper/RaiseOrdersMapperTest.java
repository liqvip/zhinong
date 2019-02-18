package cn.blogss.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/*
 *Created by liqiang on 2019/2/16
 * junit启动时加载springIOC 容器
 * 告诉junit配置文件
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class RaiseOrdersMapperTest {
    @Resource
    RaiseOrdersMapper raiseOrdersMapper;

    @Test
    public void insert() {

    }
}