package model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by shenshijun on 14-3-9.
 */
public class Waiter extends Model<Waiter> {
    public static Waiter dao = new Waiter();


    public User getUser() {
        return User.dao.findById(get("user_id"));
    }
}
