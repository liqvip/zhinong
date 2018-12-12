package cn.blogss.mapper;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Farm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FarmMapper {
    //农场添加
    public abstract int farmAdd(Farm farm);

    //总记录数
    public abstract int totRecord(@Param("farmName") String farmName);

    //农场查看,分页
    public abstract List<Farm> farmSelectAll(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize,
                                             @Param("farmName") String farmName);

    //农场删除
    public abstract int farmDelete(String[] ids);

//    农场修改
    public abstract int farmModify(Farm farm);

    //删除一条
    void farmDelOne(String id);
}
