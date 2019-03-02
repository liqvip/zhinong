package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.common.util.ConstantUtil;
import cn.blogss.mapper.RaiseOrdersMapper;
import cn.blogss.pojo.RaiseOrders;
import cn.blogss.pojo.Users;
import cn.blogss.service.RaiseOrdersService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RaiseOrdersServiceImpl implements RaiseOrdersService{
    @Autowired
    RaiseOrdersMapper raiseOrdersMapper;

    @Override
    public List<RaiseOrders> selectRaiseOrdersByPage(int pageIndex, int pageSize, RaiseOrders raiseOrders) {
        return raiseOrdersMapper.selectRaiseOrdersByPage((pageIndex-1)*pageSize,pageSize,raiseOrders);
    }

    @Override
    public RaiseOrders orderDetail(Integer id) {
        return raiseOrdersMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<RaiseOrders> queryByUserId() {
        Integer userId = getUser().getId();
        return raiseOrdersMapper.queryByUserId(userId);
    }

    @Override
    public List<?> queryByRaiseId(int raiseId) {
        return raiseOrdersMapper.querySomeByRaiseId(raiseId);
    }


    @Override
    public void delBatch(String[] ids) {
        raiseOrdersMapper.delBatch(ids);
    }

    @Override
    public void delOne(int id) {
        raiseOrdersMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void edit(RaiseOrders raiseOrders) {
        raiseOrdersMapper.updateByPrimaryKeySelective(raiseOrders);
    }

    @Override
    public int totRecord(RaiseOrders raiseOrders) {
        return raiseOrdersMapper.totRecord(raiseOrders);
    }

    public Users getUser() {
        return (Users) SecurityUtils.getSubject().getSession().getAttribute(ConstantUtil.SESSION_NAME);
    }
}
