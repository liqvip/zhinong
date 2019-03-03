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
        List<?> raiseOrders = raiseOrdersMapper.querySomeByRaiseId(2);
        System.out.println("raiseOrders:"+raiseOrders.toString());
    }

    @Test
    public void selectRaiseOrdersByPage() {
        List<?> result = raiseOrdersMapper.selectRaiseOrdersByPage(0,5,"admin");
        System.out.println("result:"+result.toString());
    }

    @Test
    public void totRecord() {
        int count = raiseOrdersMapper.totRecord("admin");
        System.out.println("count:"+count);
    }
}