package cn.blogss.pojo;

import java.util.Date;

public class News {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column news.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column news.cat_id
     *
     * @mbggenerated
     */
    private Integer catId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column news.title
     *
     * @mbggenerated
     */
    private String title;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column news.introduction
     *
     * @mbggenerated
     */
    private String introduction;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column news.images
     *
     * @mbggenerated
     */
    private String images;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column news.status
     *
     * @mbggenerated
     */
    private String status;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column news.updateTime
     *
     * @mbggenerated
     */
    private Date updatetime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column news.clickNum
     *
     * @mbggenerated
     */
    private Integer clicknum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column news.addTime
     *
     * @mbggenerated
     */
    private Date addtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column news.content
     *
     * @mbggenerated
     */
    private String content;

    private NewsCat newsCat;

    public NewsCat getNewsCat() {
        return newsCat;
    }

    public void setNewsCat(NewsCat newsCat) {
        this.newsCat = newsCat;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column news.id
     *
     * @return the value of news.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column news.id
     *
     * @param id the value for news.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column news.cat_id
     *
     * @return the value of news.cat_id
     *
     * @mbggenerated
     */
    public Integer getCatId() {
        return catId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column news.cat_id
     *
     * @param catId the value for news.cat_id
     *
     * @mbggenerated
     */
    public void setCatId(Integer catId) {
        this.catId = catId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column news.title
     *
     * @return the value of news.title
     *
     * @mbggenerated
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column news.title
     *
     * @param title the value for news.title
     *
     * @mbggenerated
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column news.introduction
     *
     * @return the value of news.introduction
     *
     * @mbggenerated
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column news.introduction
     *
     * @param introduction the value for news.introduction
     *
     * @mbggenerated
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column news.images
     *
     * @return the value of news.images
     *
     * @mbggenerated
     */
    public String getImages() {
        return images;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column news.images
     *
     * @param images the value for news.images
     *
     * @mbggenerated
     */
    public void setImages(String images) {
        this.images = images == null ? null : images.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column news.status
     *
     * @return the value of news.status
     *
     * @mbggenerated
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column news.status
     *
     * @param status the value for news.status
     *
     * @mbggenerated
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column news.updateTime
     *
     * @return the value of news.updateTime
     *
     * @mbggenerated
     */
    public Date getUpdatetime() {
        return updatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column news.updateTime
     *
     * @param updatetime the value for news.updateTime
     *
     * @mbggenerated
     */
    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column news.clickNum
     *
     * @return the value of news.clickNum
     *
     * @mbggenerated
     */
    public Integer getClicknum() {
        return clicknum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column news.clickNum
     *
     * @param clicknum the value for news.clickNum
     *
     * @mbggenerated
     */
    public void setClicknum(Integer clicknum) {
        this.clicknum = clicknum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column news.addTime
     *
     * @return the value of news.addTime
     *
     * @mbggenerated
     */
    public Date getAddtime() {
        return addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column news.addTime
     *
     * @param addtime the value for news.addTime
     *
     * @mbggenerated
     */
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column news.content
     *
     * @return the value of news.content
     *
     * @mbggenerated
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column news.content
     *
     * @param content the value for news.content
     *
     * @mbggenerated
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}