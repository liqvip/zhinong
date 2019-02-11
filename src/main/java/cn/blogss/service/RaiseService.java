package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Raise;
import cn.blogss.pojo.RaiseCat;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.util.List;
import java.util.Map;

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

    Raise selectRaiseById(String id);
}
