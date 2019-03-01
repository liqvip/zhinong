package cn.blogss.dto.users;/*
 *Created by liqiang on 2019/3/1
 */

import cn.blogss.common.util.enums.users.VerifyEnum;

public class VerifyExecution {
    /*验证结果状态表示*/
    private int status;

    /*状态信息*/
    private String statusInfo;

    public VerifyExecution(VerifyEnum verifyEnum){
        this.status = verifyEnum.getStatus();
        this.statusInfo = verifyEnum.getStatusInfo();
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
