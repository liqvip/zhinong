package cn.blogss.dto.users;/*
 *Created by liqiang on 2019/3/1
 */

import cn.blogss.common.util.enums.users.SetPwdEnum;

public class SetPwdExecution {
    /*修改密码结果状态表示*/
    private int status;
    /*状态信息*/
    private String statusInfo;

    public SetPwdExecution(SetPwdEnum setPwdEnum){
        this.status = setPwdEnum.getStatus();
        this.statusInfo = setPwdEnum.getStatusInfo();
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
