package com.tool;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by lion on 14-4-14.
 */
public class Converter {

    private static final int millisecondPerSecond = 1000;

    public static String getPastTimeString(Timestamp createdTime)
    {

        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        long pastSecond = (currentTime.getTime() - createdTime.getTime()) / millisecondPerSecond;
        String displayString = new String();

        // 小于1分钟
        if (pastSecond < 1 * 60)
        {
            displayString = "刚刚";
        }
        // 小于1小时 且 大于等于1分钟
        else if (pastSecond < 60 * 60)
        {
            int minutes = (int) (pastSecond / 60);
            displayString = minutes + "分钟前";
        }
        // 小于24小时 且 大于等于1小时
        else if (pastSecond < 24 * 60 * 60)
        {
            int hours = (int) (pastSecond / 60 / 60);
            displayString = hours + "小时前";
        }
        // 大于等于24小时
        else
        {
            Date date = new java.sql.Date(createdTime.getTime());
            displayString = date.toString();
        }

        return displayString;
    }

}
