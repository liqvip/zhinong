package cn.blogss.utils;/*
    create by LiQiang at 2018/4/23   
*/

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
    public static String getCurTime(){
        Date date = new Date();
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return  sd.format(date);
    }
}
