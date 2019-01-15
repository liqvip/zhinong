package cn.blogss.common.util.pojo;/*
    create by LiQiang at 2018/5/16   
*/

public class Message {
    Boolean success = true;
    String msg = "操作成功";

    public Message(){};

    public Message(boolean success,String msg){
        this.success = success;
        this.msg = msg;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
