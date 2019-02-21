package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/2/21
 */

public class UserNameErrorException extends SignInException {
    public UserNameErrorException(String message) {
        super(message);
    }

    public UserNameErrorException(String message, Throwable cause) {
        super(message, cause);
    }
}
