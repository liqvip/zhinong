package cn.blogss.pojo;/*
    create by LiQiang at 2018/5/14   
*/

import java.util.List;

public class Pagination<T> {
    private boolean isFirstPage;
    private boolean isLastPage;
    private  int totPage;
    List<T> list;

    public int getTotPage() {
        return totPage;
    }

    public void setTotPage(int totPage) {
        this.totPage = totPage;
    }

    public boolean isFirstPage() {
        return isFirstPage;
    }

    public void setFirstPage(boolean firstPage) {
        isFirstPage = firstPage;
    }

    public boolean isLastPage() {
        return isLastPage;
    }

    public void setLastPage(boolean lastPage) {
        isLastPage = lastPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
