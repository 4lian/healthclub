package model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * Created by shenshijun on 14-3-11.
 */
public class PayLog extends Model<PayLog> {
    public static PayLog dao = new PayLog();

    public static boolean addCard(String cardId, int user_id) {
        Record card = new Record().set("id", cardId).set("user_id", user_id);
        return Db.update("bank_card", card);
    }
}
