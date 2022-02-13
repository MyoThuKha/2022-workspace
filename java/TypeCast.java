public class TypeCast {
    public static void main(String [] args) {
        short value1 = 2;
        double value2= 34.843;
        //Implicit typecasting (automatic)
        //byte - short - int - long - float -double
        int result1 = value1 + 3;//change short type to int.
        
        System.out.println(result1);
        
        //Explicit typecasting (manual)
        int result2 = (int)value2+2;
        System.out.println(result2);
        
        //Typecasting from string to value
        //Integer/Float/Double
        String strVal = "1.1";
        //strVal is double so use Double.
        System.out.println(Double.parseDouble(strVal)+2);

        
    }
}
