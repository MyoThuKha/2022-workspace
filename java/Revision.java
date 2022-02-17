import java.util.Scanner;
import java.util.Arrays;

public class Revision {
    public static void main(String[] args) {
        String num1 = "33830";

        System.out.println(Integer.parseInt(num1)+1);
        
        int[][] matx = {{2,42,4},{24,83,72}};

        System.out.println(Arrays.deepToString(matx));

        Scanner scan = new Scanner(System.in);
        System.out.print("Your Name: ");
        String name = scan.nextLine();
        System.out.println("Hi "+name.trim());
    }
}
