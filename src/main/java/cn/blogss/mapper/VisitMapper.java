package cn.blogss.mapper;

import cn.blogss.pojo.Visit;

import java.util.List;

public interface VisitMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visit
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visit
     *
     * @mbggenerated
     */
    int insert(Visit record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visit
     *
     * @mbggenerated
     */
    int insertSelective(Visit record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visit
     *
     * @mbggenerated
     */
    Visit selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visit
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Visit record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table visit
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Visit record);


    Long findVisitTimes(Visit visit);

    public abstract List<Visit> selectVisitByPage(int pageIndex, int pageSize, Visit visit);

    //用户访问记录批量删除
    public abstract void delBatch(String[] ids);

    public int totRecord(Visit visit);

}