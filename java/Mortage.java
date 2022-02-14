package codecamp;

import java.util.Scanner;
import java.text.NumberFormat;
public class Mortage {
    public static void main(String[] args) {
       Scanner scanner = new Scanner(System.in);
       System.out.print("Principal: ");
       long principal = scanner.nextLong();
       
       System.out.print("Annual Interest Rate: ");
       double rate = scanner.nextDouble();
       
       System.out.print("Period (Years): ");
       int period = scanner.nextInt();
       
       rate = rate/100/12;
       period = period*12;
       //principal * r(1+r)^n /(1+r)^n -1
       double calculation = principal * rate * Math.pow(1+rate, period)/(Math.pow(1+rate,period)-1);
       String result = NumberFormat.getCurrencyInstance().format(calculation);
       System.out.println("Mortgage: "+result);
       scanner.close();
    }
}
