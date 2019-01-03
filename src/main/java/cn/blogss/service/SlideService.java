package cn.blogss.service;/*
 *Created by liqiang on 2018/12/6
 */

import cn.blogss.pojo.Slide;

import java.util.List;

public interface SlideService {
    //幻灯片添加
    public abstract void add(Slide slide);

    //幻灯片分页
    public abstract List<Slide> selectSlideByPage(String pageIndex, int pageSize);

    //幻灯片批量删除
    public abstract void delBatch(String[] ids);

    //    幻灯片修改
    public abstract void edit(Slide slide);

    //删除一条
    void delOne(String id);

    Slide editShow(String id);
}
