package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/2/21
 */

public class RepeatSignInException extends SignInException {
    public RepeatSignInException(String message) {
        super(message);
    }

    public RepeatSignInException(String message, Throwable cause) {
        super(message, cause);
    }
}
