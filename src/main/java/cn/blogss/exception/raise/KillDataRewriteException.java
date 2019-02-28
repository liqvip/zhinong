package cn.blogss.exception.raise;/*
 *Created by liqiang on 2019/2/18
 */

/*
* 秒杀关闭异常
* */
public class KillDataRewriteException extends KillException{

    public KillDataRewriteException(String message) {
        super(message);
    }

    public KillDataRewriteException(String message, Throwable cause) {
        super(message, cause);
    }
}
