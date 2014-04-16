package com.tool;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by luhuanglh on 14-4-14.
 */
public class DateHelper {

    private static String DateFormat1 = "yyyy-MM-dd HH:mm:ss";
    private static String DateFormat2 = "yyyy-MM-dd";

    public static String timestampToStr1(Timestamp timestamp){
        return new SimpleDateFormat(DateFormat1).format(timestamp);
    }

    public static String timestampToStr2(Timestamp timestamp){
        return new SimpleDateFormat(DateFormat2).format(timestamp);
    }

    public static Date getDateByString(String time) {
        Date date = null;
        try {
            date = new SimpleDateFormat(DateFormat1).parse(time);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    public static String getShortTime(Timestamp timestamp) {
        String shortString = null;
        String time1 = timestampToStr1(timestamp);
        String time2 = timestampToStr2(timestamp);
        Date date = getDateByString(time1);
        if(date == null)
            return shortString;

        long now = Calendar.getInstance().getTimeInMillis();
        long deltaTime = (now - date.getTime())/1000;
        if (deltaTime > 365*24*60*60) {
            shortString = (int)(deltaTime/(365*24*60*60)) + "年前";
        } else if (deltaTime > 2*24*60*60) {
            shortString = time2;
        } else if (deltaTime > 24*60*60) {
            shortString = "昨天";
        } else if(deltaTime > 60*60) {
            shortString = (int)(deltaTime/(60*60)) + "小时前";
        } else if(deltaTime > 60) {
            shortString = (int)(deltaTime/(60)) + "分钟前";
        } else if(deltaTime > 3) {
            shortString = deltaTime + "秒前";
        } else {
            shortString = "刚刚";
        }
        return shortString;
    }



}
