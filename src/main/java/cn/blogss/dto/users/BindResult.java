package cn.blogss.dto.users;/*
 *Created by liqiang on 2019/3/1
 */

public class BindResult<T> {
    private boolean success;
    private T data;
    private String error;

    public BindResult(boolean success, T data) {
        this.success = success;
        this.data = data;
    }

    public BindResult(T data, String error) {
        this.data = data;
        this.error = error;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}
