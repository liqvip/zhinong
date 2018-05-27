package cn.blogss.pojo;/*
    create by LiQiang at 2018/5/14   
*/

public class NewsCat {
    private int newsCatId;
    private int parentId;
    private String catName;

    public int getNewsCatId() {
        return newsCatId;
    }

    public void setNewsCatId(int newsCatId) {
        this.newsCatId = newsCatId;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }
}
