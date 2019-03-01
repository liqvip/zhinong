package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/3/1
 */

public class ErrorPwdException extends PwdException {
    public ErrorPwdException(String message) {
        super(message);
    }

    public ErrorPwdException(String message, Throwable cause) {
        super(message, cause);
    }
}
