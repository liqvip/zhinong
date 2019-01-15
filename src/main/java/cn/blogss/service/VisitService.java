package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Visit;

import java.util.List;

public interface VisitService {
    Long findVisitTimes(Visit visit);

    public abstract List<Visit> selectVisitByPage(String pageIndex, int pageSize, Visit visit);

    //用户访问记录添加
    public abstract void add(Visit visit);

    //用户访问记录批量删除
    public abstract void delBatch(String[] ids);

    //删除一条
    void delOne(String id);

    //    用户访问记录修改
    public abstract void edit(Visit visit);

    public int totRecord(Visit visit);

    Visit editShow(String id);
}
