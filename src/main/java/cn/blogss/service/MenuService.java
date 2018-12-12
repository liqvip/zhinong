package cn.blogss.service;/*
 *Created by liqiang on 2018/12/6
 */

import cn.blogss.pojo.Menu;

import java.util.List;

public interface MenuService {
    //菜单点击
    String selectMenuList(String id);

    //菜单添加
    public abstract String menuAdd(Menu menu);

    //菜单查看
    public abstract List<Menu> menuSelectAll(String pageIndex, int pageSize, Menu menu);

    //菜单批量删除
    public abstract void menuDelete(String[] ids);

    //    菜单修改
    public abstract void menuModify(Menu menu);

    //查询总记录
    public int totRecord(Menu menu);

    //删除一条
    void menuDelOne(String id);

    List<Menu> addShow();

    Menu editShow(String id);
}
