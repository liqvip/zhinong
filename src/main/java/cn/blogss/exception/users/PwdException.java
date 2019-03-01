package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/3/1
 */

public class PwdException extends RuntimeException{
    public PwdException(String message) {
        super(message);
    }

    public PwdException(String message, Throwable cause) {
        super(message, cause);
    }
}
