package com.tool;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by luhuanglh on 14-4-14.
 */
public class DateUtil {

    private static String MyDateFormat = "yyyy-MM-dd HH:mm:ss";

    public static String timestampToStr(Timestamp timestamp){
        return new SimpleDateFormat(MyDateFormat).format(timestamp);
    }

    public static Date getDateByString(String time) {
        Date date = null;
        try {
            date = new SimpleDateFormat(MyDateFormat).parse(time);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return date;
    }

    public static String getShortTime(Timestamp timestamp) {
        String shortString = null;
        String time = timestampToStr(timestamp);
        Date date = getDateByString(time);
        if(date == null)
            return shortString;

        long now = Calendar.getInstance().getTimeInMillis();
        long deltaTime = (now - date.getTime())/1000;
        if (deltaTime > 365*24*60*60) {
            shortString = (int)(deltaTime/(365*24*60*60)) + "年前";
        } else if (deltaTime > 10*24*60*60) {
            shortString = time;
        } else if (deltaTime > 2*24*60*60) {
            shortString = (int)(deltaTime/(24*60*60)) + "天前";
        } else if (deltaTime > 24*60*60) {
            shortString = "昨天";
        } else if(deltaTime > 60*60) {
            shortString = (int)(deltaTime/(60*60)) + "小时前";
        } else if(deltaTime > 60) {
            shortString = (int)(deltaTime/(60)) + "分前";
        } else if(deltaTime > 3) {
            shortString = deltaTime + "秒前";
        } else {
            shortString = "刚刚";
        }
        return shortString;
    }



}
