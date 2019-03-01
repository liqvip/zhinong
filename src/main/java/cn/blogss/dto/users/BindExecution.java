package cn.blogss.dto.users;/*
 *Created by liqiang on 2019/3/1
 */

import cn.blogss.common.util.enums.users.BindEnum;

public class BindExecution {
    private int status;
    private String statusInfo;

    public BindExecution(BindEnum bindEnum){
        this.status = bindEnum.getStatus();
        this.statusInfo = bindEnum.getStatusInfo();
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
