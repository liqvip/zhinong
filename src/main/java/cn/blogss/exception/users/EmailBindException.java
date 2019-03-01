package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/3/1
 */

public class EmailBindException extends BindException{
    public EmailBindException(String message) {
        super(message);
    }

    public EmailBindException(String message, Throwable cause) {
        super(message, cause);
    }
}
