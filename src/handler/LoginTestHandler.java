package handler;

import com.jfinal.handler.Handler;
import model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by shenshijun on 14-3-9.
 */
public class LoginTestHandler extends Handler {
    @Override
    public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
        HttpSession session = request.getSession();
        session.setAttribute("user",createUser());
        nextHandler.handle(target,request,response,isHandled);
    }

    private static User createUser(){
        User user = User.getUserByNameAndPassword("ssj","060213");
        return user;
    }
}
