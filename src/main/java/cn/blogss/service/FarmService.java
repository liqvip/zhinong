package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Farm;

import java.util.List;

public interface FarmService {

    //农场添加
    public abstract void add(Farm farm);

    //农场分页
    public abstract List<Farm> selectFarmByPage(String pageIndex, int pageSize, Farm farm);

    //农场批量删除
    public abstract void delBatch(String[] ids);

    //    农场修改
    public abstract void edit(Farm farm);
    
    public int totRecord(Farm farm);

    //删除一条
    void delOne(String id);

    Farm editShow(String id);
}
