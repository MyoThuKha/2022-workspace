import java.text.NumberFormat;
public class FormatMethod {
    public static void main(String[] args) {
        //can't use new operator cause it is abstract class.
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        String price = currency.format(3435299L);
        System.out.println(price);
        
        String percent = NumberFormat.getPercentInstance().format(0.35);
        System.out.println(percent);
    }
}
