package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/2/21
 */

public class PasswordErrorException extends SignInException {
    public PasswordErrorException(String message) {
        super(message);
    }

    public PasswordErrorException(String message, Throwable cause) {
        super(message, cause);
    }
}
