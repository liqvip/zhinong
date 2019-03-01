package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/3/1
 */

public class BindException extends RuntimeException{
    public BindException(String message) {
        super(message);
    }

    public BindException(String message, Throwable cause) {
        super(message, cause);
    }
}
