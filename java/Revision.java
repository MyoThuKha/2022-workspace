import java.util.Scanner;
public class Revision {
    public static void main(String[] args) {
        
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter income: ");
        int income = scan.nextInt();
        String seat = income > 100_000? "First class":"Economy";
        System.out.println(seat);
    }
}
