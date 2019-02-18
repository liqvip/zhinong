package cn.blogss.exception.raise;/*
 *Created by liqiang on 2019/2/18
 */

/*
* 重复秒杀异常(运行期异常)
* */

public class RepeatKillException extends KillException{

    public RepeatKillException(String message) {
        super(message);
    }

    public RepeatKillException(String message, Throwable cause) {
        super(message, cause);
    }
}
