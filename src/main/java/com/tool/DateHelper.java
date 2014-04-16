package com.tool;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by luhuanglh on 14-4-14.
 */
public class DateHelper {

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

    /*
     *  根据 参数Timestamp类型 的时间
     *  返回与当前时间的 时间差 的自定义的表示 字符串
     */
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

    /*
     *  返回 参数Date类型 的 年月日“YYYY-MM-DD”表示 字符串
     */
    public static String dateToString(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        int day = cal.get(Calendar.DAY_OF_MONTH);
        String string = year + "-" + month + "-" + day;
        return string;
    }
}
