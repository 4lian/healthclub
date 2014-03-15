package model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import helper.TimeHelper;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by shenshijun on 14-3-5.
 */
public class Profile extends Model<Profile> {
    public static Profile dao = new Profile();

    public boolean active() {
        set("status", "active");
        set("regular_pay_time", new Timestamp(System.currentTimeMillis()));
        return update();
    }

    public boolean isMale() {
        String gender = get("gender");
        return gender.equals("male");
    }

    public String getStatus() {
        Timestamp timestamp = get("regular_pay_time");
        if (timestamp == null) {
            User user = getUser();
            timestamp = user.get("create_time");
            if (timestamp == null) {
                timestamp = new Timestamp(System.currentTimeMillis());
            }
        }
        String status = get("status");
        if (status.equals("not-active")) {
            return status;
        }
        long days = TimeHelper.getTimeIntervalDays(timestamp);
        if (days < 30) {
            set("status", "active");
        } else if (days >= 30) {
            set("status", "pending");
        } else if (days >= 180) {
            set("status", "end");
        }
        update();
        String result = get("status");
        return result;
    }

    public User getUser() {
        User user = User.dao.findById(get("id"));
        return user;
    }

    public boolean isEnd() {
        String status = get("status");
        if (status == null) {
            return true;
        }
        return status.equals("end");
    }

}
