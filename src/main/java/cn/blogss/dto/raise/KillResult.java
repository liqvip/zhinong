package cn.blogss.dto.raise;/*
 *Created by liqiang on 2019/2/19
 */

//封装Json结果
public class KillResult<T> {
    private boolean success;

    private T data;

    private String error;

    public KillResult(boolean success, T data) {
        this.success = success;
        this.data = data;
    }

    public KillResult(boolean success, String error) {
        this.success = success;
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
