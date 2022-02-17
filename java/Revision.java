import java.util.Scanner;

public class Revision {
    public static void main(String[] args) {
        String num1 = "33830";
        
        System.out.println(Integer.parseInt(num1)+1);
        Scanner scan = new Scanner(System.in);
        System.out.print("Your Name: ");
        String name = scan.nextLine();
        System.out.println("Hi "+name);
    }
}
