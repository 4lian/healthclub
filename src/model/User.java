package model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import helper.JsonHelper;
import helper.MD5Helper;
import helper.RandomHelper;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by shenshijun on 14-3-5.
 */
public class User extends Model<User> {
    public static final User dao = new User();

    public static User getUserByNameAndPassword(String name, String password) {
        password = MD5Helper.getMD5(password.getBytes());
        return dao.findFirst("select * from user where name=? and password=?", name, password);
    }

    public static User create(String username, String password, String email, String role) {
        String en_password = MD5Helper.getMD5(password.getBytes());
        User user = new User().set("name", username).set("password", en_password).set("email", email).set("role", role);
        Profile profile = user.getProfile();
        String card = RandomHelper.getStringRandom(7);
        profile.set("card_id", card);
        profile.update();
        if (user.save()) {
            return user;
        } else {
            return null;
        }
    }

    public String join(int doing_id) {
        Record user_doing = new Record().set("user_id", get("id")).set("doing_id", doing_id);
        try {
            if (Db.save("doing_client", user_doing)) {
                return JsonHelper.success("你已经参加成功");
            } else {
                return JsonHelper.fail("出现了问题，不能参加这个活动");
            }
        } catch (Exception e) {
            return JsonHelper.fail(e.toString());
        }
    }

    public Profile getProfile() {
        Profile profile = Profile.dao.findById(get("id"));
        if (profile == null) {
            profile = new Profile();
            profile.set("id", get("id"));
            profile.save();
        }
        return profile;
    }

    public List<Record> getCards() {
        Profile profile = getProfile();
        String card = profile.get("card_id");
        if (card == null) {
            card = RandomHelper.getStringRandom(7);
            profile.set("card_id", card);
            profile.update();

        }
        List<Record> recordList = new LinkedList<Record>();
        Record record = new Record().set("card_id", card).set("type", get("type"));
        recordList.add(record);
        return recordList;
    }

    public List<Record> getBankCards() {
        List<Record> recordList = Db.find("select * from bank_card where user_id=?", get("id"));
        return recordList;
    }

    public void deleteBankCard(String card_id) {
        Record target = new Record().set("id", card_id).set("user_id", get("id"));
        Db.delete("bank_card", target);
    }

    public void addBankCard(String card_id) {
        Record target = new Record().set("id", card_id).set("user_id", get("id"));
        Db.save("bank_card", target);
    }

    public Waiter getWaiter() {
        Integer user_id = get("id");
        Waiter waiter = Waiter.dao.findFirst("select * from waiter where user_id=?", user_id);
        if (waiter == null) {
            waiter = new Waiter();
            waiter.set("user_id", user_id);
            waiter.save();
        }
        return waiter;
    }

    public Manager getManager() {
        String user_id = get("id");
        Manager manager = Manager.dao.findFirst("select * from manager where user_id=?", user_id);
        if (manager == null) {
            manager = new Manager();
            manager.set("user_id", user_id);
            manager.save();
        }
        return manager;
    }
}
