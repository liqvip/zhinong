package cn.blogss.pojo;/*
 *Created by liqiang on 2018/12/6
 */

public class Menu {
    private int id;
    private String name = "";
    private String murl = "";
    private int priority;
    private boolean isParent = true;
    private int pid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public boolean getIsParent() {
        return isParent;
    }

    public void setIsParent(boolean parent) {
        isParent = parent;
    }

    public String getMurl() {
        return murl;
    }

    public void setMurl(String murl) {
        this.murl = murl;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", murl='" + murl + '\'' +
                ", priority=" + priority +
                ", isParent=" + isParent +
                ", pid=" + pid +
                '}';
    }
}
