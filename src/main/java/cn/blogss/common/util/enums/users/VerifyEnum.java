package cn.blogss.common.util.enums.users;/*
 *Created by liqiang on 2019/3/1
 */

public enum VerifyEnum {
    SUCCESS(1,"验证通过"),
    ERROR_PASSWORD(-1,"密码错误"),
    NULL_PASSWORD(-2,"密码不能为空"),
    TIMEOUT(-99,"登录超时，请重新登录"),
    INNER_ERROR(-100,"系统异常");
    private int status;
    private String statusInfo;

    VerifyEnum(int status, String statusInfo) {
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

    public static VerifyEnum statusOf(int index){
        for(VerifyEnum status:values()){
            if(status.getStatus() == index)
                return status;
        }
        return null;
    }
}
