package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.common.util.enums.raise.KillStatEnum;
import cn.blogss.dto.raise.Exposer;
import cn.blogss.dto.raise.KillExecution;
import cn.blogss.exception.raise.KillCloseException;
import cn.blogss.exception.raise.KillException;
import cn.blogss.exception.raise.RepeatKillException;
import cn.blogss.mapper.RaiseCatMapper;
import cn.blogss.mapper.RaiseMapper;
import cn.blogss.mapper.RaiseOrdersMapper;
import cn.blogss.pojo.Raise;
import cn.blogss.pojo.RaiseCat;
import cn.blogss.pojo.RaiseOrders;
import cn.blogss.service.RaiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.*;

@Service
public class RaiseServiceImpl implements RaiseService{
    @Autowired
    RaiseMapper raiseMapper;
    @Autowired
    RaiseCatMapper raiseCatMapper;
    @Autowired
    RaiseOrdersMapper raiseOrdersMapper;

    private final String salt = "dfdfilk**4545@#@$))@#";

    @Override
    public List<Raise> selectRaiseByPage(String pageIndex, int pageSize, Raise raise) {
        return raiseMapper.selectRaiseByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,raise);
    }

    @Override
    public void add(Raise raise) {
        if(raiseMapper.insertSelective(raise) != 0){
            raiseCatMapper.increaseNumByCatId(raise.getCatId());
        }
    }

    @Override
    public void delBatch(String[] ids) {
        raiseMapper.delBatch(ids);
    }

    @Override
    public void delOne(String id) {
        raiseMapper.deleteByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public void edit(Raise raise) {
        raiseMapper.updateByPrimaryKeySelective(raise);
    }

    @Override
    public int totRecord(Raise raise) {
        return raiseMapper.totRecord(raise);
    }

    @Override
    public List<RaiseCat> addShow() {
        return raiseCatMapper.raiseAddShow();
    }

    @Override
    public Raise editShow(String id) {
        return raiseMapper.selectByPrimaryKey(Integer.parseInt(id));
    }

    @Override
    public Raise selectRaiseById(Integer id) {
        return raiseMapper.selectByPrimaryKey(id);
    }

    @Override
    public Exposer exportKillUrl(Integer id) {
        Raise raise = raiseMapper.selectByPrimaryKey(id);
        if (raise == null)
            return new Exposer(false,id);
        Date startTime = raise.getStartTime();
        Date endTime = raise.getEndTime();
        //系统当前时间
        Date nowTime = new Date();
        if(nowTime.getTime() < startTime.getTime() ||
                nowTime.getTime() > endTime.getTime()){
            return new Exposer(false,id,nowTime.getTime(),startTime.getTime(),
                    endTime.getTime());
        }
        //转化为特定字符串的过程，不可逆
        String md5 = getMD5(id);
        return new Exposer(true,md5,id);
    }

    private String getMD5(int id) {
        String base = id + "/" + salt;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }

    @Override
    @Transactional
    /*
    * 使用注解控制事务方法的优点:
    * 1.开发团队达成一致约定，明确标注事务方法的编程风格
    * 2.保证事务方法的执行时间尽可能短，不要穿插其他网络操作RPC/HTTP请求或者剥离到事务方法外部
    * 3.不是所有的方法都需要事务，例只有一条修改操作，只读操作不需要事务控制
    * */
    public KillExecution executeKill(String md5,RaiseOrders raiseOrders) throws KillException, RepeatKillException,
            KillCloseException {
        int raiseId = raiseOrders.getRaiseId();
        if(md5 == null || !md5.equals(getMD5(raiseId))){
            throw new KillException("kill data rewrite");
        }
        //执行秒杀逻辑：减库存 + 记录购买行为
        Date nowTime = new Date();

        try {
            int updateAmount = raiseMapper.reduceAmount(raiseOrders.getRaiseId(),nowTime);
            if(updateAmount <= 0){
                //没有更新到记录，秒杀结束
                throw new KillCloseException("kill is closed");
            }else{
                //记录购买行为
                int insertCount = raiseOrdersMapper.insertSelective(raiseOrders);
                //唯一:raiseId,userId
                if(insertCount <= 0){
                    //重复秒杀
                    throw new RepeatKillException("kill repeated");
                }else{
                    //秒杀成功
                    raiseOrders = raiseOrdersMapper.queryByIdWithSucKill(raiseId,raiseOrders.getUserId());
                    return new KillExecution(raiseId, KillStatEnum.SUCCESS,raiseOrders);
                }
            }
        } catch (KillCloseException e1){
            throw e1;
        } catch (RepeatKillException e2){
            throw e2;
        } catch (Exception e){
            //所有编译期异常，转化为运行时异常，能够回滚
            throw new KillException("kill inner error:"+e.getMessage());
        }
    }
}
