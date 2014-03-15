package handler;
import com.jfinal.handler.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by shenshijun on 14-3-4.
 */
public class ContextPathHandler extends Handler {
    public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
        request.setAttribute("CONTEXT_PATH", request.getContextPath());
        nextHandler.handle(target, request, response, isHandled);
    }
}
