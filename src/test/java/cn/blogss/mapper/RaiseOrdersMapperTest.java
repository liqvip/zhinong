package cn.blogss.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

public class RaiseOrdersMapperTest extends BaseMapperTest{
    @Resource
    RaiseOrdersMapper raiseOrdersMapper;

    @Test
    public void insert() {

    }

    @Test
    public void queryByRaiseId() {
        List<?> raiseOrders = raiseOrdersMapper.queryByRaiseId(2);
        System.out.println("raiseOrders:"+raiseOrders.toString());
    }
}