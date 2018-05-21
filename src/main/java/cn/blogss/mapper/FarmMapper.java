package cn.blogss.mapper;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Farm;

import java.util.List;

public interface FarmMapper {
    //农场添加
    public abstract int farmAdd(Farm farm);

    //总记录数
    public abstract int totRecord();

    //农场查看,分页
    public abstract List<Farm> farmSelectAll(int pageNow);

    //农场查看全部
    public abstract List<Farm> farmSelectAll2();

    //农场删除
    public abstract int farmDelete(int farmId);

//    农场修改
    public abstract int farmModify(Farm farm);

}
