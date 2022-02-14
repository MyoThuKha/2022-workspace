package codecamp;

import java.util.Scanner;
public class UserInput {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        //println make \n. so.
        System.out.print("Name: ");
        //.next read only 1 token. so.
        String name = scanner.nextLine().trim();//trim- string method.

        System.out.println("Hello " + name);
    }

}
