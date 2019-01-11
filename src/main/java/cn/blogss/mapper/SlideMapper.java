package cn.blogss.mapper;

import cn.blogss.pojo.Slide;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SlideMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table slide
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table slide
     *
     * @mbggenerated
     */
    int insert(Slide record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table slide
     *
     * @mbggenerated
     */
    int insertSelective(Slide record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table slide
     *
     * @mbggenerated
     */
    Slide selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table slide
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Slide record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table slide
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Slide record);

    //总记录数
    public abstract int totRecord(Slide slide);

    //幻灯片查看,分页
    public abstract List<Slide> selectSlideByPage(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);
    
    //删除一条
    void delOne(String id);

    //幻灯片删除
    public abstract int delBatch(String[] ids);

    Slide editShow(String id);
}