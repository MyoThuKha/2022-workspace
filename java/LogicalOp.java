public class LogicalOp {
    public static void main(String[] args) {
        int temperature = 23;
        boolean isWarm = temperature > 20 && temperature < 30;
        //Not operator
        boolean isCold = !isWarm;

        System.out.println(isCold);
    }
}
