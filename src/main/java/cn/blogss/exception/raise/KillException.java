package cn.blogss.exception.raise;/*
 *Created by liqiang on 2019/2/18
 */

public class KillException extends RuntimeException{

    public KillException(String message) {
        super(message);
    }

    public KillException(String message, Throwable cause) {
        super(message, cause);
    }
}
