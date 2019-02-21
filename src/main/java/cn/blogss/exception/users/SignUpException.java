package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/2/21
 */

public class SignUpException extends Exception {
    public SignUpException(String message) {
        super(message);
    }

    public SignUpException(String message, Throwable cause) {
        super(message, cause);
    }
}
