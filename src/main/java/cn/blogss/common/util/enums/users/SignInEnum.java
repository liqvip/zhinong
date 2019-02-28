package cn.blogss.common.util.enums.users;/*
 *Created by liqiang on 2019/2/21
 */

public enum SignInEnum {
    SUCCESS(1,"登录成功"),
    ACCOUNT_ERROR(-1,"账号或密码错误"),
    INNER_ERROR(-2,"系统异常"),
    REPEAT_SIGNIN(-3,"您已登录，请勿重复操作");
    private int status;
    private String statusInfo;

    SignInEnum(int status, String statusInfo) {
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

    public static SignInEnum statusOf(int index){
        for(SignInEnum status:values()){
            if(status.getStatus() == index)
                return status;
        }
        return null;
    }
}
