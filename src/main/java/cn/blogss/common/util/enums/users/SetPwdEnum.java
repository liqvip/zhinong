package cn.blogss.common.util.enums.users;/*
 *Created by liqiang on 2019/3/1
 */

public enum SetPwdEnum {
    SUCCESS(1,"修改成功"),
    PRE_PASSWORD_ERROR(-1,"原始密码错误"),
    PWD_INCONSISTENT(-2,"两次密码不一致"),
    TIMEOUT(-99,"登录超时，请重新登录"),
    INNER_ERROR(-100,"系统异常");
    private int status;
    private String statusInfo;

    SetPwdEnum(int status, String statusInfo) {
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

    public static SetPwdEnum statusOf(int index){
        for(SetPwdEnum status:values()){
            if(status.getStatus() == index)
                return status;
        }
        return null;
    }
}
