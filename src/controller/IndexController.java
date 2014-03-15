package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import model.Profile;
import model.User;
import validator.LoginValidator;
import validator.SignupValidator;

/**
 * Created by shenshijun on 14-3-2.
 */
public class IndexController extends Controller {
    public void index() {
        render("index.ftl");
    }

    public void login() {
        render("login/index.ftl");
    }

    public void signup() {
        render("login/index.ftl");
    }

    public void logout() {
        removeSessionAttr("user");
        redirect("/index/login");
    }

    public void profile() {
        render("profile/index.ftl");
    }

    public void about() {
        render("/common/about/index.ftl");
    }

    public void contact() {
        render("/common/contact/index.ftl");
    }

    @Before(LoginValidator.class)
    public void doLogin() {
        String username = getPara("username");
        String password = getPara("password");
        User user = User.getUserByNameAndPassword(username, password);
        if (user == null) {
            setAttr("NotFoundError", "用户名或者密码出错");
            render("login/index.ftl");
        } else {
            Profile profile = user.getProfile();
            String status = profile.get("status");
            System.out.println(status);
            boolean end = status.equals("end");
            if (!end) {
                setSessionAttr("user", user);
                dispatchUser(user);
            }else {
                redirect("/index/login");
            }
        }
    }

    @Before(SignupValidator.class)
    public void doSignup() {
        String username = getPara("usernamesignup");
        String email = getPara("emailsignup");
        String password = getPara("passwordsignup");
        String role = getPara("role");
        User user = User.getUserByNameAndPassword(username, password);
        if (user == null) {
            user = User.create(username, password, email,role);
            if (user != null) {
                setSessionAttr("user", user);
                dispatchUser(user);
            }
        } else {
            setAttr("UserRepeat", "不能使用这个用户名，已经有人在使用了");
            render("login/index.ftl");
        }
    }

    private void dispatchUser(User user) {
        String type = user.get("role");
        if (type.equals("user")) {
            redirect("/index");
        }else if (type.equals("waiter")){
            redirect("/waiter");
        }else {
            redirect("/manager");
        }
    }

}
