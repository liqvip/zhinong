package cn.blogss.common.util.enums.users;/*
 *Created by liqiang on 2019/2/21
 */

public enum SignUpEnum {
    SUCCESS(1,"注册成功"),
    REPEAT_USERNAME(-1,"用户名重复"),
    INNER_ERROR(-2,"系统异常");

    private int status;
    private String statusInfo;

    SignUpEnum(int status, String statusInfo) {
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

    public static SignUpEnum statusOf(int index){
        for(SignUpEnum status:values()){
            if(status.getStatus() == index)
                return status;
        }
        return null;
    }
}
