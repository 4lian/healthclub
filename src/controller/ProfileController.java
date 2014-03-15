package controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import helper.PriceHelper;
import helper.TimeHelper;
import model.Doing;
import model.PayLog;
import model.Profile;
import model.User;

import java.util.List;

/**
 * Created by shenshijun on 14-3-5.
 */
public class ProfileController extends Controller {
    public void index() {
        render("index.ftl");
    }

    public void active() {
        User user = getSessionAttr("user");
        String status = user.getProfile().get("status");
        boolean isActive = status.equals("not-active");
        setAttr("isActive", !isActive);

        List<Record> cardList = Db.find("select id from bank_card where user_id=?", user.get("id"));
        setAttr("cardList", cardList);
        String type = user.get("type");
        boolean idType = true;
        if (type.equals("family")) {
            idType = false;
        }
        setAttr("idType", idType);
        render("active.ftl");
    }

    public void doActive() {
        String cardId = getPara("bank_card");
        String message = getPara("message");
        String type = getPara("id_type");
        User user = getSessionAttr("user");
        Integer id = user.get("id");
        PayLog.addCard(cardId, id);
        user.set("type", type);
        user.update();
        double active_price = PriceHelper.getActivePrice(type);
        PayLog payLog = new PayLog();
        payLog.set("user_id", user.get("id")).set("brank_card_id", cardId);
        payLog.set("pay_type", "active").set("count", active_price);
        if (!message.isEmpty()) {
            payLog.set("message", message);
        }
        payLog.save();
        Profile profile = user.getProfile();
        profile.active();
        renderText(payLog.toJson());
    }

    public void card() {
        User user = getSessionAttr("user");
        System.out.println(user);
        setAttr("cardList", user.getCards());
        render("card.ftl");
    }

    public void bankCard() {
        User user = getSessionAttr("user");
        List<Record> recordList = user.getBankCards();
        setAttr("bankCards", recordList);
        render("bankCard.ftl");
    }

    public void doDeleteCard() {
        String card_id = getPara(0);
        User user = getSessionAttr("user");
        user.deleteBankCard(card_id);
        redirect("/profile/bankCard");
    }

    public void doAddCard() {
        String card_id = getPara("cardId");
        User user = getSessionAttr("user");
        user.addBankCard(card_id);
        redirect("/profile/bankCard");
    }

    public void payLog() {
        User user = getSessionAttr("user");
        List<PayLog> payLogList = PayLog.dao.find("select * from pay_log where user_id=?", user.get("id"));
        setAttr("payLogList", payLogList);
        render("payLog.ftl");
    }

    public void actionLog() {
        User user = getSessionAttr("user");
        Integer user_id = user.get("id");
        List<Record> recordList = Doing.getActionLog(user_id);
        System.out.println(recordList);
        setAttr("actionLogList", recordList);
        render("actionLog.ftl");
    }

    public void profile() {
        User user = getSessionAttr("user");
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
        User user = getSessionAttr("user");
        user.set("name", name).set("email",email);
        user.set("type",idType);
        user.update();
        Profile profile = user.getProfile();
        profile.set("full_name", full_name).set("mobile_phone", mobile_phone);
        profile.set("telephone", telephone).set("address", address);
        profile.set("gender", gender);
        if (!brith.isEmpty()){
            profile.set("brith", brith);
        }
        profile.update();
        redirect("/profile/profile");
    }

    public void family(){
        User user = getSessionAttr("user");
        Profile p = user.getProfile();
        String type = user.get("type");
        setAttr("child_count",p.get("child_num"));
        boolean idType = true;
        if (type.equals("family")) {
            idType = false;
        }
        setAttr("idType", idType);
        render("family.ftl");
    }

    public void saveFamily(){
        User user = getSessionAttr("user");
        String type = getPara("id_type");
        user.set("type",type);
        user.update();
        if (type.equals("family")){
            Profile p = user.getProfile();
            int child_count = Integer.parseInt(getPara("child_count"));
            p.set("child_num",child_count);
            p.update();
        }
        redirect("/profile/family");
    }

    public void status(){
        User user = getSessionAttr("user");
        Profile profile = user.getProfile();
        List<Record> cardList = user.getBankCards();
        String user_status = profile.getStatus();
        String type = user.get("type");
        boolean idType = true;
        if (type.equals("family")) {
            idType = false;
        }
        setAttr("idType", idType);
        setAttr("user_status",user_status);
        setAttr("cardList", cardList);
        setAttr("profile",profile);
        render("status.ftl");
    }

    public void logout(){
        User user = getSessionAttr("user");
        Profile profile = user.getProfile();
        profile.set("status","end");
        profile.update();
        redirect("/index/login");
    } 
    public void pay(){
        User user = getSessionAttr("user");
        Profile profile = user.getProfile();
        String cardId = getPara("card_id");
        String message = getPara("message");
        Integer user_id = user.get("id");
        Integer child_num = profile.get("child_num");
        String user_type = user.get("type");
        profile.set("regular_pay_time", TimeHelper.now());
        profile.update();
        PayLog.addCard(cardId,user_id);
        double active_price = PriceHelper.getRegulerPrice(user_type,child_num);
        PayLog payLog = new PayLog();
        payLog.set("user_id", user.get("id")).set("brank_card_id", cardId);
        payLog.set("pay_type", "last_fee").set("count", active_price);
        if (!message.isEmpty()) {
            System.out.println("message:"+message);
            payLog.set("message", message);
        }
        payLog.save();
        redirect("/profile/status");
    }

}
