package controller;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by shenshijun on 14-3-5.
 */
public class ManagerController extends Controller {
    public static final long AGE_CAT = 8L;

    public void index() {
        render("index.ftl");
    }

    public void age() {
        List<Record> recordList = Db.find("select count(age) as age_count,age from profile group by age");
        Map<String, Double> data = new HashMap<String, Double>();
        Long[] age_user = new Long[(int) AGE_CAT];
        for (int i = 0; i < AGE_CAT; ++i) {
            age_user[i] = 0l;
        }
        for (Record record : recordList) {
            Long age = record.get("age");
            Long count = record.get("age_count");
            int index = 0;
            if (age == null) {
                index = 7;
            } else if (age <= 10) {
                index = 0;
            } else if (age <= 20) {
                index = 1;
            } else if (age <= 30) {
                index = 2;
            } else if (age < 40) {
                index = 3;
            } else if (age <= 50) {
                index = 4;
            } else if (age <= 60) {
                index = 5;
            } else {
                index = 6;
            }
            age_user[index] += count;
        }
        long people_count = 0l;
        for (long co : age_user) {
            people_count += co;
        }
        data.put("0~10", age_user[0] / (double) people_count * 100);
        data.put("10~20", age_user[1] / (double) people_count * 100);
        data.put("20~30", age_user[2] / (double) people_count * 100);
        data.put("30~40", age_user[3] / (double) people_count * 100);
        data.put("40~50", age_user[4] / (double) people_count * 100);
        data.put("50~60", age_user[5] / (double) people_count * 100);
        data.put("60~", age_user[6] / (double) people_count * 100);
        data.put("未设定", age_user[7] / (double) people_count * 100);
        renderJson(data);
    }

    public void gender() {
        List<Record> records = Db.find("select gender,count(*) as count from profile group by gender");
        Double[] genders = new Double[3];
        long sum = 0l;
        for (Record record : records) {
            Long count = record.get("count");
            sum += count;
        }
        for (Record record : records) {
            String gender = record.get("gender");
            Long count = record.get("count");
            if (gender == null) {
                genders[0] = (double) count / sum;
            } else if (gender.equals("male")) {
                genders[1] = (double) count / sum;
            } else if (gender.equals("female")) {
                genders[2] = (double) count / sum;
            }
        }
        renderJson(genders);
    }

    public void status() {
        List<Record> records = Db.find("select count(*) status_count,status from profile group by status");
        renderJson(records);
    }

    public void user() {
        render("user.ftl");
    }

    public void club() {
        render("club.ftl");
    }

    public void dailyMan(){
        int[] a = {1,2,3,4};
        renderJson(a);
    }

    public void monthMan(){
        int[] a = {1,2,3,4};
        renderJson(a);
    }
}
