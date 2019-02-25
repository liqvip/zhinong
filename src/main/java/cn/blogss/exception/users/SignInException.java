package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/2/21
 */

public class SignInException extends RuntimeException {
    public SignInException(String message) {
        super(message);
    }

    public SignInException(String message, Throwable cause) {
        super(message, cause);
    }
}
