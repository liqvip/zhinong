package cn.blogss.service.impl;/*
    create by LiQiang at 2018/5/14   
*/

import cn.blogss.mapper.FarmMapper;
import cn.blogss.pojo.Farm;
import cn.blogss.service.FarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
* DAO 层工作演变为:接口设计+SQL编写
* DAO 拼接等逻辑在Service层完成
* */

@Service
public class FarmServiceImpl implements FarmService{
    @Autowired
    private FarmMapper farmMapper;

    @Override
    public void add(Farm farm) {
        farmMapper.insertSelective(farm);
    }

    @Override
    public List<Farm> selectFarmByPage(String pageIndex, int pageSize, Farm farm) {
        return farmMapper.selectFarmByPage((Integer.parseInt(pageIndex)-1)*pageSize,pageSize,farm);
    }

    @Override
    public void delBatch(String[] ids) {
        farmMapper.delBatch(ids);
    }

    @Override
    public void edit(Farm farm) {
        farmMapper.updateByPrimaryKeySelective(farm);
    }


    @Override
    public void delOne(String id) {
        farmMapper.delOne(id);
    }

    @Override
    public List<Farm> raiseAddShow() {
        return farmMapper.raiseAddShow();
    }

    @Override
    public Farm editShow(String id) {
        return farmMapper.editShow(id);
    }

    @Override
    public int totRecord(Farm farm) {
        return farmMapper.totRecord(farm);
    }

}
