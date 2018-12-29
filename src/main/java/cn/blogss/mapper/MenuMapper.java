package cn.blogss.mapper;/*
 *Created by liqiang on 2018/12/6
 */

import cn.blogss.pojo.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    List<Menu> selectMenuList(String id);
    
    int isParent(int id);

    //菜单添加
    public abstract void add(Menu menu);

    //总记录数
    public abstract int totRecord(Menu menu);

    //菜单查看,分页
    public abstract List<Menu> selectMenuByPage(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize,
                                             @Param("menu") Menu menu);
    //    菜单修改
    public abstract int edit(Menu menu);

    //删除一条
    void delOne(String id);

    //菜单删除
    public abstract int delBatch(String[] ids);

    List<Menu> addShow();

    Menu editShow(String id);
}
