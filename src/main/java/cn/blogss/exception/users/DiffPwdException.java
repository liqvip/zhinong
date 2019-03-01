package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/3/1
 */

public class DiffPwdException extends PwdException {

    public DiffPwdException(String message) {
        super(message);
    }

    public DiffPwdException(String message, Throwable cause) {
        super(message, cause);
    }
}
