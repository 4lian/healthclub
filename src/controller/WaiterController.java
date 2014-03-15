package controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import helper.PriceHelper;
import helper.TimeHelper;
import model.*;

import java.util.List;

/**
 * Created by shenshijun on 14-3-5.
 */
public class WaiterController extends Controller {
    public void index() {
        render("index.ftl");
    }

    public void card() {
        List<Record> cards = Db.find("select card_id,id,type from profile join user using(id)");
        setAttr("cardList",cards);
        render("card.ftl");
    }

    public void bankCard() {
        List<Record> recordList = Db.find("select * from bank_card");
        setAttr("bankCards", recordList);
        render("bankCard.ftl");
    }

    public void deleteBankCard(){
        String bank_card = getPara(0);
        Db.update("delete from bank_card where id=?",bank_card);
        redirect("/waiter/bankCard");
    }

    public void payLog() {
        User user = getSessionAttr("user");
        List<PayLog> payLogList = PayLog.dao.find("select * from pay_log");
        setAttr("payLogList", payLogList);
        render("payLog.ftl");
    }

    public void action() {
        List<Doing> doingList = Doing.dao.find("select * from doing");
        setAttr("actionList", doingList);
        render("action.ftl");
    }

    public void userList(){
        List<User> users = User.dao.find("select * from user");
        setAttr("userList",users);
        render("userList.ftl");
    }

    public void deleteUser(){
        int user_id = Integer.parseInt(getPara(0));
        User user = User.dao.findById(user_id);
        Profile profile = user.getProfile();
        profile.set("status","end");
        profile.update();
        redirect("/waiter/userList");
    }

    public void activeUser(){
        int user_id = Integer.parseInt(getPara(0));
        User user = User.dao.findById(user_id);
        Profile profile = user.getProfile();
        profile.active();
        redirect("/waiter/userList");
    }

    public void profile() {
        int user_id = Integer.parseInt(getPara(0));
        User user = User.dao.findById(user_id);
        String type = user.get("type");
        Profile profile = user.getProfile();
        boolean idType = true;
        if (type.equals("family")) {
            idType = false;
        }
        setAttr("user", user);
        setAttr("idType", idType);
        setAttr("profile", profile);
        render("profile.ftl");
    }

    public void saveProfile() {
        String name = getPara("username");
        String full_name = getPara("full_name");
        String email = getPara("email");
        String idType = getPara("id_type");
        String telephone = getPara("telephone");
        String mobile_phone = getPara("mobile_phone");
        String address = getPara("address");
        String brith = getPara("brith");
        String gender = getPara("gender");
        int user_id = Integer.parseInt(getPara("user_id"));
        User user = User.dao.findById(user_id);
        user.set("name", name).set("email", email);
        user.set("type", idType);
        user.update();
        Profile profile = user.getProfile();
        profile.set("full_name", full_name).set("mobile_phone", mobile_phone);
        profile.set("telephone", telephone).set("address", address);
        profile.set("gender", gender);
        if (!brith.isEmpty()) {
            profile.set("brith", brith);
        }
        profile.update();
        redirect("/waiter/profile/"+user_id);
    }

    public void involveUser() {
        int doing_id = Integer.parseInt(getPara(0));
        List<Record> userList = Db.find("select * from doing_client where doing_id=?", doing_id);
        for (Record user : userList) {
            Integer user_id = user.get("user_id");
            User user1 = User.dao.findById(user_id);
            user.set("name", user1.get("name"));
        }
        setAttr("userList", userList);
        render("involveList.ftl");
    }

    public void deleteUserFromDoing() {
        int doing_id = Integer.parseInt(getPara(0));
        int user_id = Integer.parseInt(getPara(1));
        Db.update("delete  from doing_client where doing_id=? and user_id=?", doing_id, user_id);
        redirect("/waiter/involveUser/" + doing_id);
    }

    public void addAction() {
        String action_name = getPara("action_name");
        String action_address = getPara("action_address");
        String action_desc = getPara("action_desc");
        String start_time = getPara("start_time");
        String end_time = getPara("end_time");
        Doing doing = new Doing();
        User user = getSessionAttr("user");
        Waiter waiter = user.getWaiter();
        Integer waiter_id = waiter.get("id");
        doing.set("waiter_id", waiter_id).set("address", action_address);
        doing.set("start_time", start_time).set("end_time", end_time);
        doing.set("doing_name", action_name);
        if (action_desc == null) {
            doing.set("doing_desc",action_desc);
        }
        System.out.println(doing);
        doing.save();
        redirect("/waiter/action");
    }

}
