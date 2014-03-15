package validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * Created by shenshijun on 14-3-5.
 */
public class SignupValidator extends Validator {
    @Override
    protected void validate(Controller c) {
        validateRequiredString("usernamesignup","NoUserNameError","用户名不能是空");
        validateRequiredString("emailsignup","NoEmailError","没有Email邮箱");
    }

    @Override
    protected void handleError(Controller c) {

    }
}
