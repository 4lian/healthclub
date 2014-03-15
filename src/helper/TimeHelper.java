package helper;

import java.sql.Timestamp;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by shenshijun on 14-3-12.
 */
public class TimeHelper {

    public static long getTimeIntervalDays(Timestamp target){
        Timestamp now = new Timestamp(System.currentTimeMillis());//获取系统当前时间
        System.out.println(target);
        long interval = now.getTime() - target.getTime();
        return (interval/(24*60*60));
    }

    public static Timestamp now(){
        Timestamp now = new Timestamp(System.currentTimeMillis());//获取系统当前时间
        return now;
    }
}
