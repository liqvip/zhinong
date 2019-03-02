package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/3/2
 */

public class NullPwdException extends PwdException {
    public NullPwdException(String message) {
        super(message);
    }

    public NullPwdException(String message, Throwable cause) {
        super(message, cause);
    }
}
