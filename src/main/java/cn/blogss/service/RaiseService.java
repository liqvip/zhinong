package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.dto.raise.Exposer;
import cn.blogss.dto.raise.KillExecution;
import cn.blogss.exception.raise.KillCloseException;
import cn.blogss.exception.raise.KillException;
import cn.blogss.exception.raise.RepeatKillException;
import cn.blogss.pojo.Raise;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.pojo.RaiseOrders;

import java.util.List;

/*
* 业务接口：站在"使用者"角度设计接口
* 三个方面：方法定义粒度，参数，返回类型(return 类型/异常)
* */

public interface RaiseService {

    public abstract List<Raise> selectRaiseByPage(String pageIndex, int pageSize, Raise raise);

    //农资添加
    public abstract void add(Raise raise);

    //农资批量删除
    public abstract void delBatch(String[] ids);

    //删除一条
    void delOne(String id);

    //    农资修改
    public abstract void edit(Raise raise);

    public int totRecord(Raise raise);

    List<RaiseCat> addShow();

    Raise editShow(String id);

    Raise selectRaiseById(Integer id);

    /*
    * 秒杀开启时输出秒杀接口地址
    * 否则输出系统时间和秒杀时间
    * */
    Exposer exportKillUrl(Integer id);

    /*
    * 执行秒杀操作
    * */
    KillExecution executeKill(String md5 ,RaiseOrders raiseOrders) throws
            KillException,RepeatKillException,KillCloseException;
}
