package cn.blogss.service;/*
 *Created by liqiang on 2018/6/17
 */

import cn.blogss.pojo.Raise;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.pojo.RaiseOrders;
import org.springframework.ui.Model;

import java.util.List;

public interface HomeRaiseService {

    //总记录数
    public abstract int totCount();

    //农资查看
    public abstract void raiseList(String pageNow, Model model,String cid);

    //    农资详情
    public abstract void raiseDetail(int raiseId,Model model);

    //    农资类型
    public abstract String catName(int raiseId);


    //    农资所有分类
    public abstract List<RaiseCat> raiseCat();

    //    订单提交
    public abstract void raiseSubmit(int raiseId,int raiseMount,Model model);

    //    订单付款
    public abstract int raisePay(RaiseOrders raiseOrders);

    //    更新农资库存
    public abstract void raiseStock(int raiseMount);

}
