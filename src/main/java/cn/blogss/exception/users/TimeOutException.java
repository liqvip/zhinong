package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/3/1
 */

public class TimeOutException extends RuntimeException {
    public TimeOutException(String message) {
        super(message);
    }

    public TimeOutException(String message, Throwable cause) {
        super(message, cause);
    }
}
