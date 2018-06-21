package cn.blogss.utils;/*
 *Created by liqiang on 2018/6/21
 */

public class OrderNum {
    public static String getOrderNum(){
        int r1 = (int)Math.random()*10;
        int r2 = (int)Math.random()*10;
        long now = System.currentTimeMillis();//13位的时间戳

        String orderNum = "z"+r1+r2+now;

        return orderNum;
    }
}
