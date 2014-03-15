package controller;

import com.google.common.collect.Collections2;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Record;
import helper.JsonHelper;
import model.Doing;
import model.User;
import org.apache.commons.collections4.ListUtils;

import java.sql.*;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * Created by shenshijun on 14-3-6.
 */
public class ActionController extends Controller {
    public void index() {
        Date now = new Date();
        List<Doing> doingList = Doing.dao.find("select * from doing where start_time>?", new Timestamp(now.getTime()));
        setAttr("doing_list", doingList);
        render("index.ftl");
    }

    public void history() {
        Date now = new Date();
        List<Doing> doingList = Doing.dao.find("select * from doing where end_time>?", new Timestamp(now.getTime()));
        List<Doing> allList = Doing.dao.find("select * from doing");
        doingList = ListUtils.subtract(allList,doingList);
        setAttr("doing_list", doingList);
        render("history.ftl");
    }

    public void join() {
        int doing_id = Integer.parseInt(getPara(0));
        User user = getSessionAttr("user");
        renderText(user.join(doing_id));
    }

    public void isJoin() {
        int doing_int = Integer.parseInt(getPara(0));
        User user = getSessionAttr("user");
        Doing doing = Doing.dao.findById(doing_int);
        boolean result = doing.isJoin(user);
        if (result) {
            renderText(JsonHelper.success(""));
        } else {
            renderText(JsonHelper.fail(""));
        }
    }
}
