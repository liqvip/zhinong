package cn.blogss.common.util;/*
    create by LiQiang at 2018/5/16   
*/

public class Message {
    Boolean success;
    long time;
    String msg;

    public Message(){
        this.success = true;
        this.time = System.currentTimeMillis();
        this.msg = "操作成功";
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
