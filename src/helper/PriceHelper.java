package helper;

/**
 * Created by shenshijun on 14-3-11.
 */
public class PriceHelper {
    public static double getActivePrice(String type){
        if (type.equals("private")){
            return  75;
        }else if (type.equals("family")){
            return 100;
        }
        return 0;
    }

    public static double getRegulerPrice(String type, int child_num) {
        double sum = 0;
        if (type.equals("private")){
            sum = 40;
        }else {
            sum = 55 + 10*child_num;
        }
        return sum;
    }
}
