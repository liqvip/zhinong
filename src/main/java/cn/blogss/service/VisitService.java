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

    public int totRecord(Visit visit);
}
