package cn.blogss.dto;/*
 *Created by liqiang on 2019/2/18
 */

import cn.blogss.common.util.enums.KillStatEnum;
import cn.blogss.pojo.RaiseOrders;

public class KillExecution {
    private int id;

    //秒杀结果状态表示
    private int status;

    //状态信息
    private String statusInfo;

    //秒杀成功对象
    private RaiseOrders raiseOrders;

    public KillExecution(int id, KillStatEnum killStatEnum) {
        this.id = id;
        this.status = killStatEnum.getStatus();
        this.statusInfo = killStatEnum.getStatusInfo();
    }

    public KillExecution(int id, KillStatEnum killStatEnum, RaiseOrders raiseOrders) {
        this.id = id;
        this.status = killStatEnum.getStatus();
        this.statusInfo = killStatEnum.getStatusInfo();
        this.raiseOrders = raiseOrders;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusInfo() {
        return statusInfo;
    }

    public void setStatusInfo(String statusInfo) {
        this.statusInfo = statusInfo;
    }

    public RaiseOrders getRaiseOrders() {
        return raiseOrders;
    }

    public void setRaiseOrders(RaiseOrders raiseOrders) {
        this.raiseOrders = raiseOrders;
    }
}
