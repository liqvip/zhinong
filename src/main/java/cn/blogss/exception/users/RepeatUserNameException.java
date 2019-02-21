package cn.blogss.exception.users;/*
 *Created by liqiang on 2019/2/21
 */

public class RepeatUserNameException extends SignUpException {
    public RepeatUserNameException(String message) {
        super(message);
    }

    public RepeatUserNameException(String message, Throwable cause) {
        super(message, cause);
    }
}
