import java.util.Scanner;
import java.text.NumberFormat;

public class NewMortage {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int principal = 0;
        double rate=0;
        int period = 0;
        while (true) {
            System.out.print("Principal: ");
            principal = scanner.nextInt();
            if (principal >= 1000 && principal <= 1_000_000)
                break;
            System.out.println("Enter a number between 1000 and 1_000_000.");
       
        }

        while (true) {
            System.out.print("Annual Interest Rate: ");
            rate = scanner.nextDouble();
            if (rate >= 1 && rate <= 30) {
                rate = rate/100/12;
                break;
            }
            System.out.println("Enter a value between 1 and 30.");
       
        }

        while (true) {
            System.out.print("Period (Years): ");
            period = scanner.nextInt();
            if (period >=1 && period <= 30) {
                period = period*12;
                break;
            }
            System.out.println("Enter a value between 1 and 30.");
        }
        //principal * r(1+r)^n /(1+r)^n -1
        double calculation = principal * rate * Math.pow(1+rate, period)/(Math.pow(1+rate,period)-1);
        String result = NumberFormat.getCurrencyInstance().format(calculation);
        System.out.println("Mortgage: "+result);
        scanner.close();
    }
}
