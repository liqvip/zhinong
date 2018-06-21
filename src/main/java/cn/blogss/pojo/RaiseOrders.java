package cn.blogss.pojo;/*
 *Created by liqiang on 2018/6/21
 */

public class RaiseOrders {
    private int orderId;
    private int userId;
    private int raiseId;
    private int raiseMount;
    private double totalMoney;
    private String createTime;

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    private String orderNum;
    private String profitCat;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRaiseId() {
        return raiseId;
    }

    public void setRaiseId(int raiseId) {
        this.raiseId = raiseId;
    }

    public int getRaiseMount() {
        return raiseMount;
    }

    public void setRaiseMount(int raiseMount) {
        this.raiseMount = raiseMount;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getProfitCat() {
        return profitCat;
    }

    public void setProfitCat(String profitCat) {
        this.profitCat = profitCat;
    }
}
