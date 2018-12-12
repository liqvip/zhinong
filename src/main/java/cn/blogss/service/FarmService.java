package cn.blogss.service;/*
    create by LiQiang at 2018/4/22   
*/

import cn.blogss.pojo.Farm;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.ui.Model;

import java.util.List;

public interface FarmService {

    //农场添加
    public abstract String farmAdd(Farm farm);

    //农场查看
    public abstract List<Farm> farmSelectAll(String pageIndex,int pageSize,String farmName);

    //农场删除
    public abstract void farmDelete(String[] ids);

//    农场修改
    public abstract void farmModify(Farm farm);

    //查询总记录
    public int totRecord(String farmName);

    //删除一条
    void farmDelOne(String id);
}
