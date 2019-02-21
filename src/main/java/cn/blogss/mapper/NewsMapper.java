package cn.blogss.mapper;

import cn.blogss.pojo.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    int insert(News record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    int insertSelective(News record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    News selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(News record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    int updateByPrimaryKeyWithBLOBs(News record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table news
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(News record);

    public abstract List<News> selectNewsByPage(@Param("pageIndex")int pageIndex,
                                                   @Param("pageSize")int pageSize,
                                                   @Param("news")News news);

    //新闻分类批量删除
    public abstract void delBatch(String[] ids);

    public int totRecord(News newsCat);

    News selectNextNews(Integer id);

    News selectPrevNews(Integer id);

    List<News> selectNewsByClick();

    List<News> selectNotices();

    List<News> initNewsTab();
}