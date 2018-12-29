package cn.blogss.service;/*
 *Created by liqiang on 2018/12/6
 */

import cn.blogss.pojo.Menu;

import java.util.List;

public interface MenuService {
    //菜单点击
    String selectMenuList(String id);

    //菜单添加
    public abstract void add(Menu menu);

    //菜单查看
    public abstract List<Menu> selectMenuByPage(String pageIndex, int pageSize, Menu menu);

    //菜单批量删除
    public abstract void delBatch(String[] ids);

    //    菜单修改
    public abstract void edit(Menu menu);

    public int totRecord(Menu menu);

    //删除一条
    void delOne(String id);

    List<Menu> addShow();

    Menu editShow(String id);
}
