package cn.blogss.exception.raise;/*
 *Created by liqiang on 2019/2/18
 */

/*
* 秒杀关闭异常
* */
public class KillCloseException extends KillException{

    public KillCloseException(String message) {
        super(message);
    }

    public KillCloseException(String message, Throwable cause) {
        super(message, cause);
    }
}
