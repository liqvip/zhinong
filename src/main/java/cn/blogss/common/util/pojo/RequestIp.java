package cn.blogss.common.util.pojo;
/*
 *Created by liqiang on 2019/1/15
 */

public class RequestIp {
    private String ip ;
    private long createTime;
    private Integer reCount;

    public String getIp() {
        return ip;
    }
    public void setIp(String ip) {
        this.ip = ip;
    }
    public long getCreateTime() {
        return createTime;
    }
    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }
    public Integer getReCount() {
        return reCount;
    }
    public void setReCount(Integer reCount) {
        this.reCount = reCount;

    }
}
