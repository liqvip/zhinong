package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Link;
import java.util.List;

public interface LinkService {

    public abstract List<Link> selectLinkByPage(String pageIndex, int pageSize, Link link);

    //友情链接添加
    public abstract void add(Link link);

    //友情链接批量删除
    public abstract void delBatch(String[] ids);

    //删除一条
    void delOne(String id);

    //    友情链接修改
    public abstract void edit(Link link);

    public int totRecord(Link link);

    Link editShow(String id);

    List<Link> selectLink();
}
