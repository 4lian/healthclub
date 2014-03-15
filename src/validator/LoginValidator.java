package validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * Created by shenshijun on 14-3-5.
 */
public class LoginValidator extends Validator {
    @Override
    protected void validate(Controller c) {
        validateRequiredString("username","UserName","用户名不能为空");
        validateRequiredString("password","password","密码不能为空");
    }

    @Override
    protected void handleError(Controller c) {
        c.keepPara("username");
        c.redirect("/index/login");
    }
}
