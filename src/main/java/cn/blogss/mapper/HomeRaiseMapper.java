package cn.blogss.mapper;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Raise;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.pojo.RaiseOrders;

import java.util.List;

public interface HomeRaiseMapper {

    //总记录数
    public abstract int totCount();

    //农资查看
    public abstract List<Raise> raiseList(int startPos);

    //农资分类查看
    public abstract List<Raise> raiseCatList(int startPos,String cid);

//    农资详情
    public abstract Raise raiseDetail(int raiseId);

    //    农资类型
    public abstract String catName(int raiseId);

//    农资所有分类
    public abstract List<RaiseCat> raiseCat();

//    订单提交
    public abstract int raisePay(RaiseOrders raiseOrders);

//    更新农资库存
    public abstract int raiseStock(int raiseMount);

}
