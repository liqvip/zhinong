package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/3/1
 */

public class PhoneBindException extends BindException{
    public PhoneBindException(String message) {
        super(message);
    }

    public PhoneBindException(String message, Throwable cause) {
        super(message, cause);
    }
}
