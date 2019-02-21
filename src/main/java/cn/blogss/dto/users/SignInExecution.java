package cn.blogss.dto.users;/*
 *Created by liqiang on 2019/2/18
 */

import cn.blogss.common.util.enums.users.SignInEnum;

public class SignInExecution {

    //登录结果状态表示
    private int status;

    //状态信息
    private String statusInfo;


    public SignInExecution(SignInEnum signInEnum) {
        this.status = signInEnum.getStatus();
        this.statusInfo = signInEnum.getStatusInfo();
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

}
