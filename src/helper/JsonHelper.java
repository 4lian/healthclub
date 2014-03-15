package helper;

import com.jfinal.kit.JsonKit;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by shenshijun on 14-3-9.
 */
public class JsonHelper {
    public static String success(String reason){
        return jsonResult(true,reason);
    }

    public static String fail(String reason){
        return jsonResult(false,reason);
    }

    private static String jsonResult(boolean result,String reason){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("success",result);
        map.put("reason",reason);
        return JsonKit.toJson(map);
    }
}
