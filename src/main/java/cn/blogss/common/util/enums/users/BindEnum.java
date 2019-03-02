package cn.blogss.common.util.enums.users;/*
 *Created by liqiang on 2019/3/1
 */

public enum BindEnum {
    SUCCESS(1,"绑定成功"),
    EMAIL_BIND(-1,"该邮箱已被绑定"),
    PHONE_BIND(-2,"该手机号已被绑定"),
    TIMEOUT(-99,"登录超时，请重新登录"),
    INNER_ERROR(-100,"系统异常");
    private int status;
    private String statusInfo;

    BindEnum(int status, String statusInfo) {
        this.status = status;
        this.statusInfo = statusInfo;
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

    public static BindEnum getStatusOf(int index){
        for(BindEnum status:values()){
            if(status.getStatus() == index)
                return status;
        }
        return null;
    }
}
