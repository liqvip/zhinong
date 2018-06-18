package cn.blogss.utils;/*
 *Created by liqiang on 2018/6/17
 */

import java.io.Serializable;

public class Page implements Serializable{
//    当前页
    private int pageNow = 1;

//    每页显示记录的条数
    private int pageSize = 6;

//    总的记录条数
    private int totalCount;

//     总页数
    private int totalPageCount;

//    开始位置，从0开始
    private int startPos;

//    是否有首页
    private boolean hasFirst;

//    是否有前一页
    private boolean hasPre;

//    是否有后一页
    private boolean hasNext;

//    是否有尾页
    private boolean hasLast;

//    通过构造函数传入 总记录数 和 当前页
    public Page(int totalCount,int pageNow){
        this.totalCount = totalCount;
        this.pageNow = pageNow;
    }

//    取得总页数,总页数=总记录数/每页显示的记录条数,totalPageCount可以为0

    public int getTotalPageCount() {
        totalPageCount = getTotalCount()/getPageSize();
        return (totalCount%pageSize==0)?totalPageCount:totalPageCount+1;
    }

    public void setTotalPageCount(int totalPageCount) {
        this.totalPageCount = totalPageCount;
    }

    public int getPageNow() {
        return pageNow;
    }

    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

//    取得选择记录的初始位置

    public int getStartPos() {
        return (pageNow-1)*pageSize;
    }

    public void setStartPos(int startPos) {
        this.startPos = startPos;
    }

//    是否有首页
    public boolean isHasFirst() {
        return (pageNow==1)?false:true;
    }

    public void setHasFirst(boolean hasFirst) {
        this.hasFirst = hasFirst;
    }

//    是否有前一页，有首页就有前一页,因为有首页,当前页就不是第一页
    public boolean isHasPre() {
        return isHasFirst()?true:false;
    }

    public void setHasPre(boolean hasPre) {
        this.hasPre = hasPre;
    }

//    是否有下一页,有尾页就有下一页，因为有尾页,当前页就不是最后一页
    public boolean isHasNext() {
        return isHasLast()?true:false;
    }

    public void setHasNext(boolean hasNext) {
        this.hasNext = hasNext;
    }

//    是否有尾页
    public boolean isHasLast() {
        return (pageNow==getTotalPageCount()?false:true);
    }

    public void setHasLast(boolean hasLast) {
        this.hasLast = hasLast;
    }
}
