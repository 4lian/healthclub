package model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;

/**
 * Created by shenshijun on 14-3-9.
 */
public class Doing extends Model<Doing> {
    public static Doing dao = new Doing();


    public Waiter getWaiter() {
        return Waiter.dao.findById(get("waiter_id"));
    }

    public boolean isJoin(User user) {
        Record record = Db.findFirst("select * from doing_client where doing_id=? and user_id=?", get("id"), user.get("id"));
        return (record != null);
    }

    public static List<Record> getActionLog(int user_id) {
        List<Record> recordList = Db.find("select * from doing_client where user_id=?", user_id);
        for (Record record : recordList) {
            Doing doing = dao.findById(record.get("doing_id"));
            record.set("start_time", doing.get("start_time"));
            record.set("name", doing.get("doing_name"));
            record.set("end_time", doing.get("end_time"));
        }
        return recordList;
    }
}
