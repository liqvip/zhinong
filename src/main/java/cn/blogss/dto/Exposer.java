package cn.blogss.dto;/*
 *Created by liqiang on 2019/2/18
 */

/*
* 暴露秒杀地址DTO
* */
public class Exposer {
    //是否开启秒杀
    private boolean exposed;

    //一种加密措施
    private String md5;

    private int id;

    //系统当前时间(毫秒)
    private long now;

    //开启时间
    private long start;

    //结束时间
    private long end;

    public Exposer(boolean exposed, String md5, int id) {
        this.exposed = exposed;
        this.md5 = md5;
        this.id = id;
    }

    public Exposer(boolean exposed, int id, long now, long start, long end) {
        this.exposed = exposed;
        this.id = id;
        this.now = now;
        this.start = start;
        this.end = end;
    }

    public Exposer(boolean exposed, int id) {
        this.exposed = exposed;
        this.id = id;
    }

    public boolean isExposed() {
        return exposed;
    }

    public void setExposed(boolean exposed) {
        this.exposed = exposed;
    }

    public String getMd5() {
        return md5;
    }

    public void setMd5(String md5) {
        this.md5 = md5;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getNow() {
        return now;
    }

    public void setNow(long now) {
        this.now = now;
    }

    public long getStart() {
        return start;
    }

    public void setStart(long start) {
        this.start = start;
    }

    public long getEnd() {
        return end;
    }

    public void setEnd(long end) {
        this.end = end;
    }
}
