package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.RaiseOrders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RaiseOrdersService {

    public abstract List<RaiseOrders> selectRaiseOrdersByPage(int pageIndex, int pageSize, RaiseOrders raiseOrders);

    List<RaiseOrders> queryByUserId();

    RaiseOrders orderDetail(Integer id);

    List<?> queryByRaiseId(int raiseId);

    //订单批量删除
    public abstract void delBatch(String[] ids);

    //删除一条
    void delOne(int id);

    //    订单修改
    public abstract void edit(RaiseOrders raiseOrders);

    public int totRecord(RaiseOrders raiseOrders);

}
