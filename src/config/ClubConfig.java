package config;

import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import controller.*;
import handler.LoginTestHandler;
import model.*;

/**
 * Created by shenshijun on 14-3-2.
 */
public class ClubConfig extends  JFinalConfig{
    /**
     * Config constant
     *
     * @param me
     */
    @Override
    public void configConstant(Constants me) {
        me.setError404View("/common/404.html");
    }

    /**
     * Config route
     *
     * @param me
     */
    @Override
    public void configRoute(Routes me) {
        me.add("/index", IndexController.class,"/client");
        me.add("/profile", ProfileController.class,"/client/profile");
        me.add("/waiter", WaiterController.class,"/waiter");
        me.add("/manager", ManagerController.class,"/manager");
        me.add("/action", ActionController.class, "/action");
    }

    /**
     * Config plugin
     *
     * @param me
     */
    @Override
    public void configPlugin(Plugins me) {
        C3p0Plugin cp = new C3p0Plugin("jdbc:mysql://localhost/healthclube", "root", "");
        me.add(cp);
        ActiveRecordPlugin arp = new ActiveRecordPlugin(cp); me.add(arp);
        arp.addMapping("user", User.class);
        arp.addMapping("profile", Profile.class);
        arp.addMapping("doing", Doing.class);
        arp.addMapping("waiter", Waiter.class);
        arp.addMapping("pay_log",PayLog.class);
    }

    /**
     * Config interceptor applied to all actions.
     *
     * @param me
     */
    @Override
    public void configInterceptor(Interceptors me) {

    }

    /**
     * Config handler
     *
     * @param me
     */
    @Override
    public void configHandler(Handlers me) {
        me.add(new LoginTestHandler());
    }

    @Override
    public void afterJFinalStart() {
        super.afterJFinalStart();

    }
}
