package cn.blogss.common.util.pojo;/*
 *Created by liqiang on 2018/12/22
 */

public class Page {
    private int pageIndex;
    private int totalNum;
    public static final int pageSize = 5;
    private String submitUrl;


    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public String getSubmitUrl() {
        return submitUrl;
    }

    public void setSubmitUrl(String submitUrl) {
        this.submitUrl = submitUrl;
    }
}
